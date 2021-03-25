/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { LightningElement, wire, track, api } from "lwc";
import { showToast, handleError } from "c/util";
import { deleteRecord, getRecord } from "lightning/uiRecordApi";
import { fireEvent } from "c/pubsub";
import { CurrentPageReference } from "lightning/navigation";

import getServicesAndEngagements from "@salesforce/apex/ServiceDeliveryController.getServicesAndEngagements";
import getServicesByProgramEngagementId from "@salesforce/apex/ServiceDeliveryController.getServicesByProgramEngagementId";

import deleteLabel from "@salesforce/label/c.Delete";
import cancel from "@salesforce/label/c.Cancel";
import error from "@salesforce/label/c.Error";
import saving from "@salesforce/label/c.Saving";
import saved from "@salesforce/label/c.Saved";

import confirmDelete from "@salesforce/label/c.Confirm_Delete";
import confirmDeleteMessage from "@salesforce/label/c.Confirm_Delete_Row";
import success from "@salesforce/label/c.Success";
import recordDeleted from "@salesforce/label/c.Record_Deleted";
import selectService from "@salesforce/label/c.Select_Service";
import selectEngagement from "@salesforce/label/c.Select_Program_Engagement";
import noServiceWarning from "@salesforce/label/c.No_Services_For_Program_Engagement";
import newProgramEngagement from "@salesforce/label/c.New_Program_Engagement";
import quantity from "@salesforce/label/c.Quantity";
import fieldAccessError from "@salesforce/label/c.Util_UnsupportedField";
import edited from "@salesforce/label/c.Edited";

import CONTACT_FIELD from "@salesforce/schema/ServiceDelivery__c.Contact__c";
import SERVICE_FIELD from "@salesforce/schema/ServiceDelivery__c.Service__c";
import PROGRAMENGAGEMENT_FIELD from "@salesforce/schema/ServiceDelivery__c.ProgramEngagement__c";
import UNIT_OF_MEASUREMENT_FIELD from "@salesforce/schema/ServiceDelivery__c.UnitOfMeasurement__c";
import SERVICE_UNIT_OF_MEASUREMENT_FIELD from "@salesforce/schema/Service__c.UnitOfMeasurement__c";
import SERVICE_FIELD_SET_FIELD from "@salesforce/schema/Service__c.ServiceDeliveryFieldSet__c";
import SERVICE_DELIVERY_OBJECT from "@salesforce/schema/ServiceDelivery__c";

const ENGAGEMENTS = "engagements";
const SERVICES = "services";
const DEFAULT_FIELD_SET = "Bulk_Service_Deliveries";

export default class ServiceDeliveryRow extends LightningElement {
    @wire(CurrentPageReference) pageRef;

    @api index;
    @api rowCount;
    @api isDirty = false;
    @api isError;

    @track fieldSet;

    recordId;
    contactId;
    programEngagementId;
    serviceId;
    serviceDeliveryObject = SERVICE_DELIVERY_OBJECT;
    unitOfMeasureValue = quantity;
    saveMessage;
    errorMessage;
    // TODO: Store these with the field set so we do not have to continue to check
    hasContactField;
    hasProgramEngagementField;
    isSaving;
    isSaved;

    labels = {
        cancel,
        confirmDelete,
        confirmDeleteMessage,
        deleteLabel,
        noServiceWarning,
        recordDeleted,
        selectEngagement,
        selectService,
        newProgramEngagement,
        success,
        saved,
        saving,
        error,
        quantity,
        fieldAccessError,
        edited,
    };
    fields = {
        contact: CONTACT_FIELD.fieldApiName,
        service: SERVICE_FIELD.fieldApiName,
        programEngagement: PROGRAMENGAGEMENT_FIELD.fieldApiName,
        unitOfMeasurement: UNIT_OF_MEASUREMENT_FIELD.fieldApiName,
        fieldSet: SERVICE_FIELD_SET_FIELD.fieldApiName,
    };

    _defaultsSet = false;
    _defaultValues;
    _services;
    _programEngagements;
    _comboboxValues = [];
    _fieldSets;

    // switched to optional fields here, getRecord will error
    // when the user does not have access
    @wire(getRecord, {
        recordId: "$serviceId",
        optionalFields: [SERVICE_UNIT_OF_MEASUREMENT_FIELD, SERVICE_FIELD_SET_FIELD],
    })
    wiredService(result) {
        if (result.data && result.data.fields) {
            let hadContactField = this.hasContactField;
            let hadProgramEngagementField = this.hasProgramEngagementField;

            this.setUnitOfMeasurement(result.data.fields);
            let isChanged = this.setCurrentFieldSetName(result.data.fields);
            if (!isChanged) {
                return;
            }

            this.setCurrentFieldSet();
            this.resetFields(hadContactField, hadProgramEngagementField);
        } else if (result.error) {
            console.log(JSON.stringify(result.error));
        }
    }

    // We display combobox options based on different fields found in the field set
    // when contact and program engagement are present we will filter both
    // program engagements and services related to the contact.
    getRelatedRecordsFromContact() {
        getServicesAndEngagements({ contactId: this.contactId })
            .then(result => {
                this._programEngagements = result[ENGAGEMENTS];
                this._services = result[SERVICES];
                this.setProgramEngagementOptions();
            })
            .catch(err => {
                this.errorMessage = handleError(err, false);
            });
    }

    // We display combobox options based on different fields found in the field set
    // when contact is not present we will filter services
    // related to the program engagement.
    getRelatedRecordsFromProgramEngagement() {
        getServicesByProgramEngagementId({
            programEngagementId: this.programEngagementId,
        })
            .then(result => {
                this._services = [...result];
                this.setServiceOptions();
            })
            .catch(err => {
                this.errorMessage = handleError(err, false);
            });
    }

    @api
    saveRow() {
        if (!this.isDirty) {
            return;
        }
        let deliverySubmit = this.template.querySelector(".sd-submit");
        if (deliverySubmit) {
            deliverySubmit.click();
        }
    }

    @api
    get defaultValues() {
        return this._defaultValues;
    }
    set defaultValues(value) {
        this._defaultValues = value;
        this.setDefaults();
    }

    @api
    get serviceDeliveryFieldSets() {
        return this._fieldSets;
    }
    set serviceDeliveryFieldSets(value) {
        if (!value) {
            return;
        }

        this._fieldSets = value;
        this._fieldSets.currentFieldSetName = value.currentFieldSetName
            ? value.currentFieldSetName
            : DEFAULT_FIELD_SET;

        this.setCurrentFieldSet();
    }

    get isDeleteDisabled() {
        return this.rowCount === 1 && this.recordId == null ? true : false;
    }

    get showSavedIcon() {
        return this.isSaved && !this.isDirty;
    }

    get showModifiedIcon() {
        return this.isSaved && this.isDirty;
    }

    // Called by lightning input field; when selections are filtered they
    // will use the lightning combobox and not the lignting input
    handleInputChange(event) {
        let fieldName = event.target.fieldName;
        let fieldValue =
            event.detail.value && event.detail.value.length
                ? event.detail.value[0]
                : undefined;

        this.isDirty = true;
        this.resetError();

        if (fieldName === this.fields.contact) {
            this.contactId = fieldValue;
            // When the program engagement field is not present
            // we do not have comboboxes
            if (!this.hasProgramEngagementField) {
                return;
            }

            this.resetProgramEngagements();
            this.resetServices();
            this.getRelatedRecordsFromContact();
        } else if (fieldName === this.fields.programEngagement) {
            // Since this is an input field and not a comboxbox
            // we assume the contact field is not present and options should be
            // related to the selected program engagement
            this.programEngagementId = fieldValue;
            this.resetServices();
            this.getRelatedRecordsFromProgramEngagement();
        } else if (fieldName === this.fields.service) {
            // Service is an input field when the program engagement field is not
            // present to provide a list of service options for a combobox
            this.serviceId = fieldValue;
        }

        this.setDisabledAttribute();
    }

    handleComboChange(event) {
        let fieldName = event.target.name;
        let fieldVal = event.detail.value;

        this.isDirty = true;
        this.resetError();

        if (fieldVal !== newProgramEngagement) {
            this.setComboboxValues(fieldName, fieldVal);
        } else {
            this.template.querySelector("c-new-program-engagement").showModal();
        }

        this.setDisabledAttribute();
    }

    handleLoad() {
        this.setDefaults();
    }

    handleSaveError(event) {
        this.isDirty = false;
        this.isSaving = false;
        this.isSaved = false;
        this.isError = true;
        this.errorMessage = handleError(event, false, "dismissible", true);
        event.detail.index = this.index;
        this.dispatchEvent(new CustomEvent("error", { detail: event.detail }));
    }

    handleSuccess(event) {
        this.recordId = event.detail.id;
        this.setSaved();
        this.setDisabledAttribute();
        fireEvent(this.pageRef, "serviceDeliveryUpsert", event.detail);
    }

    handleSubmit(event) {
        let fields = event.detail.fields;

        if (this.recordId) {
            fields.Id = this.recordId;
        }

        for (const [key, value] of Object.entries(this._comboboxValues)) {
            fields[key] = value;
        }

        this.template.querySelector("lightning-record-edit-form").submit(fields);

        this.setSaving();
    }

    handleSaveNewPE(event) {
        if (event.detail) {
            this.programEngagementId = event.detail;
            if (this.contactId && this.programEngagementId) {
                this.getRelatedRecordsFromContact(this.contactId);
                this.setServiceOptions();
            }
        }
    }

    handleCancelNewPE() {
        this.template.querySelectorAll("lightning-combobox").forEach(combobox => {
            combobox.value = null;
        });
    }

    handleDelete() {
        if (this.recordId) {
            deleteRecord(this.recordId)
                .then(() => {
                    const deletedRecordId = this.recordId;
                    this.recordId = "";
                    showToast(
                        this.labels.success,
                        this.labels.recordDeleted,
                        "success",
                        "dismissible"
                    );
                    this.dispatchEvent(new CustomEvent("delete", { detail: this.index }));
                    fireEvent(this.pageRef, "serviceDeliveryDelete", deletedRecordId);
                })
                .catch(err => {
                    handleError(err);
                });
        } else {
            this.dispatchEvent(new CustomEvent("delete", { detail: this.index }));
        }
    }

    handleShowModal() {
        const modal = this.template.querySelector("c-modal");
        modal.show();
    }

    handleCloseModal() {
        const modal = this.template.querySelector("c-modal");
        modal.hide();
    }

    resetError() {
        this.isError = false;
        this.errorMessage = "";
    }

    resetQuantityLabel() {
        if (this.unitOfMeasureValue !== this.labels.quantity) {
            this.unitOfMeasureValue = this.labels.quantity;
        }
    }

    setInputField(fieldName, id) {
        let inputField = this.fieldSet.find(member => member.apiName === fieldName);
        inputField.value = id;
    }

    resetFields(hadContactField, hadProgramEngagementField) {
        if (hadContactField && !this.hasContactField) {
            this.resetContact();
            if (this.hasProgramEngagementField) {
                let programEngagementId = this.programEngagementId;
                this.resetProgramEngagements();
                this.programEngagementId = programEngagementId;
                this.setInputField(this.fields.programEngagement, programEngagementId);
                this.setServiceOptions();
            }
        }

        if (hadProgramEngagementField && !this.hasProgramEngagementField) {
            this.resetProgramEngagements();
            let serviceId = this.serviceId;
            this.resetServices();
            this.serviceId = serviceId;
            this.setInputField(this.fields.service, serviceId);
        }

        if (!hadProgramEngagementField && this.hasProgramEngagementField) {
            if (this.hasContactField) {
                this.getRelatedRecordsFromContact();
            } else {
                this.getRelatedRecordsFromProgramEngagement();
            }
        }

        if (
            hadContactField &&
            this.hasContactField &&
            hadProgramEngagementField &&
            this.hasProgramEngagementField
        ) {
            this.setProgramEngagementOptions();
        }

        if (hadProgramEngagementField && this.hasProgramEngagementField) {
            this.setServiceOptions();
        }

        this.setDisabledAttribute();
    }

    resetContact() {
        this.contactId = undefined;
    }

    resetProgramEngagements() {
        this.programEngagementId = undefined;
        this._programEngagements = undefined;
        delete this._comboboxValues[this.fields.programEngagement];
        this.template.querySelectorAll("lightning-combobox").forEach(box => {
            if (box.name === this.fields.programEngagement) {
                box.value = undefined;
            }
        });
    }

    resetServices() {
        this.services = undefined;
        delete this._comboboxValues[this.fields.service];

        this.template.querySelectorAll("lightning-combobox").forEach(box => {
            if (box.name === this.fields.service) {
                box.value = undefined;
            }
        });

        this.serviceId = undefined;
        this.resetQuantityLabel();
    }

    setComboboxValues(fieldName, fieldVal) {
        if (fieldName === this.fields.programEngagement) {
            this.programEngagementId = fieldVal;
            this.resetServices();
            this.setServiceOptions();
        } else if (fieldName === this.fields.service) {
            this.serviceId = fieldVal;
        }

        if (fieldName && fieldVal) {
            this._comboboxValues[fieldName] = fieldVal;
        }
    }

    setDisabledAttribute() {
        let isContactDisabled = this.hasContactField && this.contactId && this.isSaved;
        let isProgramEngagementDisabled =
            (this.hasContactField && !this.contactId) ||
            (!this.hasContactField && this.programEngagementId && this.isSaved);
        let isServiceDisabled =
            (this.hasContactField && !this.contactId && !this.serviceId) ||
            (this.hasProgramEngagementField && !this.programEngagementId) ||
            (!this.hasContactField &&
                !this.hasProgramEngagementField &&
                this.serviceId &&
                this.isSaved);
        let isInputDisabled = !this.serviceId;

        this.fieldSet.forEach(member => {
            if (member.apiName === this.fields.contact) {
                member.disabled = isContactDisabled;
            } else if (member.apiName === this.fields.programEngagement) {
                member.disabled = isProgramEngagementDisabled;
            } else if (member.apiName === this.fields.service) {
                member.disabled = isServiceDisabled;
            } else {
                member.disabled = isInputDisabled;
            }
        });
    }

    // TODO: This is called 2x but can only run once?
    setDefaults() {
        if (
            this._defaultValues &&
            Object.keys(this._defaultValues).length > 0 &&
            this.fieldSet &&
            this.fieldSet.length &&
            !this._defaultsSet
        ) {
            this._defaultsSet = true;

            this.fieldSet.forEach(member => {
                for (let [fieldName, fieldValue] of Object.entries(this._defaultValues)) {
                    if (member.apiName === fieldName && fieldValue != null) {
                        member.value = this._defaultValues[fieldName];
                        if (member.apiName === this.fields.contact) {
                            this.contactId = fieldValue;
                        } else if (member.apiName === this.fields.programEngagement) {
                            this.programEngagementId = fieldValue;
                        } else if (member.apiName === this.fields.service) {
                            this.serviceId = fieldValue;
                        }
                    }
                    continue;
                }
            });

            if (this.hasContactField && this.contactId) {
                this.getRelatedRecordsFromContact(this.contactId);
            }

            if (
                !this.hasContactField &&
                this.hasProgramEngagementField &&
                this.programEngagementId
            ) {
                this.getRelatedRecordsFromProgramEngagement();
            }

            this.setDisabledAttribute();
        }
    }

    setSaving() {
        this.saveMessage = "...";
        this.isSaving = true;
        this.isSaved = false;
    }

    setSaved() {
        this.isSaving = false;
        this.isSaved = true;
        this.isDirty = false;
    }

    setUnitOfMeasurement(fields) {
        this.unitOfMeasureValue =
            fields[this.fields.unitOfMeasurement] &&
            fields[this.fields.unitOfMeasurement].value
                ? fields[this.fields.unitOfMeasurement].value
                : this.labels.quantity;
    }

    setCurrentFieldSet() {
        this.fieldSet = this.serviceDeliveryFieldSets.getCurrentFieldSet().map(field => ({
            ...field,
        }));

        this.hasContactField = this.serviceDeliveryFieldSets.hasContactField(
            this.fieldSet
        );
        this.hasProgramEngagementField = this.serviceDeliveryFieldSets.hasProgramEngagementField(
            this.fieldSet
        );
    }

    setCurrentFieldSetName(fields) {
        let serviceDeliveryFieldSet =
            fields[this.fields.fieldSet] && fields[this.fields.fieldSet].value
                ? fields[this.fields.fieldSet].value
                : DEFAULT_FIELD_SET;

        if (
            this.serviceDeliveryFieldSets.currentFieldSetName === serviceDeliveryFieldSet
        ) {
            return false;
        }

        this.serviceDeliveryFieldSets.currentFieldSetName = serviceDeliveryFieldSet;
        return true;
    }

    setProgramEngagementOptions() {
        let programEngagementField = this.fieldSet.find(
            member => member.apiName === this.fields.programEngagement
        );

        let engagements = [...this._programEngagements];

        engagements.push({
            // TODO: move this into the label object like our normal pattern
            label: "\u254B   " + newProgramEngagement,
            value: newProgramEngagement,
            program: "",
        });

        programEngagementField.options = engagements;
        programEngagementField.value = this._comboboxValues[
            this.fields.programEngagementField
        ];
    }

    setServiceOptions() {
        if (!this.hasProgramEngagementField || !this.programEngagementId) {
            return;
        }

        let serviceField = this.fieldSet.find(
            member => member.apiName === this.fields.service
        );
        let services = [];

        if (this.hasContactField && this.hasProgramEngagementField) {
            let targetProgram = this.getTargetProgram();

            this._services.forEach(service => {
                if (service.program === targetProgram) {
                    services.push({ ...service });
                }
            });
        } else if (!this.hasContactField && this.hasProgramEngagementField) {
            services = [...this._services];
        }

        serviceField.options = services;
        serviceField.value = this._comboboxValues[this.fields.service];

        if (!services.length) {
            this.isError = true;
            this.errorMessage = [this.labels.noServiceWarning];
        }
    }

    getTargetProgram() {
        let currentEngagement = this._programEngagements.find(
            engagement => engagement.value === this.programEngagementId
        );

        return currentEngagement ? currentEngagement.program : undefined;
    }
}
