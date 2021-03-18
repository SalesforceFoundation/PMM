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

    @api recordId;
    @api selectedContact;
    @api programEngagementId;
    @api index;
    @api rowCount;
    @api isDirty = false;

    @track rowError;
    @track unitOfMeasureValue = quantity;
    @track saveMessage;
    @track fieldSet;

    serviceId;
    serviceDeliveryObject = SERVICE_DELIVERY_OBJECT;
    fieldSetApiName = DEFAULT_FIELD_SET;
    hasContactField;
    hasProgramEngagementField;
    isServiceFiltered = false;
    isSaving;
    isError;
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
    _servicesAndEngagements;
    _valuesToSave = []; // stores combobox field values
    _targetProgram;
    _filteredServices;
    _fieldSets;

    @api
    get defaultValues() {
        return this._defaultValues;
    }
    set defaultValues(value) {
        this._defaultValues = value;
        this.processDefaults();
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
        this.fieldSet = value
            .getFieldSet(this.fieldSetApiName)
            .map(field => ({ ...field }));

        this.trackSpecialFields();
    }

    get isDeleteDisabled() {
        return this.rowCount === 1 && this.recordId == null ? true : false;
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

    // switched to optional fields here, getRecord will error
    // when the user does not have access
    @wire(getRecord, {
        recordId: "$serviceId",
        optionalFields: [SERVICE_UNIT_OF_MEASUREMENT_FIELD, SERVICE_FIELD_SET_FIELD],
    })
    wiredSession(result) {
        if (result.data && result.data.fields) {
            this.setUnitOfMeasurement(result.data.fields);
            this.extractFieldSet(result.data.fields);
        } else if (result.error) {
            console.log(JSON.stringify(result.error));
        }
    }

    get showSavedIcon() {
        return this.isSaved && !this.isDirty;
    }

    get showModifiedIcon() {
        return this.isSaved && this.isDirty;
    }

    handleGetServicesEngagements(contactId) {
        this.isError = false;
        getServicesAndEngagements({ contactId: contactId })
            .then(result => {
                this.setServicesAndEngagements(result);
                this.updateFieldAttributes();
            })
            .catch(err => {
                this.rowError = handleError(err, false);
            });
    }

    handleGetServicesForProgramEngagement(programEngagementId) {
        this.isError = false;

        getServicesByProgramEngagementId({ programEngagementId: programEngagementId })
            .then(result => {
                if (result) {
                    this._filteredServices = result;
                } else {
                    this.isError = true;
                }

                this.enableServiceInputWithOptions();
            })
            .catch(err => {
                this.rowError = handleError(err, false);
            });
    }

    handleInputChange(event) {
        this.isDirty = true;
        if (event.target.fieldName === this.fields.contact) {
            this.handleContactInputChange(event);
        } else if (event.target.fieldName === this.fields.programEngagement) {
            // program engagement is only an input field when the contact is not present
            this.handleProgramEngagementInputChange(event);
        } else if (event.target.fieldName === this.fields.service) {
            // service is only an input field when the contact is not present
            this.handleServiceInputChange(event.target.fieldName, event.target.value);
        }
    }

    handleServiceInputChange(fieldName, fieldVal) {
        this.serviceId = fieldVal;
        this.handleEnableFieldOnInputChange(fieldName);
        this.enableDisableFieldsOnSaveAndInputChange();
    }

    handleContactInputChange(event) {
        if (this.hasContactField && this.hasProgramEngagementField) {
            if (event.detail.value && event.detail.value.length) {
                this.selectedContact = event.detail.value[0];
                this.handleGetServicesEngagements(event.detail.value[0]);
            } else {
                this.handleResetContact();
            }
        } else if (this.hasContactField && !this.hasProgramEngagementField) {
            this.handleEnableFieldOnInputChange(event.target.fieldName);
        }
    }

    handleProgramEngagementInputChange(event) {
        if (event.detail.value && event.detail.value.length) {
            this.isServiceFiltered = true;
            this.handleGetServicesForProgramEngagement(event.detail.value[0]);
        }
    }

    handleEnableFieldOnInputChange(fieldApiName) {
        //Getting this error Uncaught TypeError: 'set' on proxy: when trying to enable an element
        //on Input field change and we suspect that since the record edit form is updating the values on the same array and
        //that is the reason why we are cloning the object here
        this.fieldSet = JSON.parse(JSON.stringify(this.fieldSet));
        this.fieldSet.forEach(element => {
            if (fieldApiName !== element.apiName) {
                element.disabled = false;
            }
        });
    }

    handleResetContact() {
        this.fieldSet.forEach(element => {
            element.isComboBox = false;
        });
        this._servicesAndEngagements = [];
        this._valuesToSave = [];
    }

    handleComboChange(event) {
        this.isDirty = true;
        let fieldName = event.target.name;
        let fieldVal = event.detail.value;

        if (fieldVal !== newProgramEngagement) {
            this.updateComboBoxValues(fieldName, fieldVal);
        } else {
            this.template.querySelector("c-new-program-engagement").showModal();
        }
    }

    updateComboBoxValues(fieldName, fieldVal) {
        if (fieldName === this.fields.programEngagement) {
            this._valuesToSave = []; //If the engagement changes, wipe stored values.
            this.extractTargetProgram(fieldVal);
            this.enableServiceInputWithOptions();
            this.resetQuantityLabel();
        }

        if (fieldName && fieldVal) {
            this._valuesToSave[fieldName] = fieldVal;
        }

        if (fieldName === this.fields.service) {
            this.handleServiceInputChange(fieldName, fieldVal);
        }
    }

    updateFieldAttributes() {
        this.fieldSet.forEach(member => {
            if (
                this.hasProgramEngagementField &&
                member.apiName === this.fields.service
            ) {
                this.updateServiceAttributes(member);
            } else if (
                this.hasContactField &&
                member.apiName === this.fields.programEngagement
            ) {
                this.updateProgramEngagementAttributes(member);
                this.extractTargetProgram(this.programEngagementId);

                if (this._targetProgram) {
                    this.enableServiceInputWithOptions();
                }
            } else if (member.apiName !== this.fields.contact) {
                member.disabled = true;
            }

            if (member.value && member.isComboBox) {
                this.updateComboBoxValues(member.apiName, member.value);
            }
        });
    }

    handleLoad() {
        this.processDefaults();
    }

    handleSaveError(event) {
        this.isDirty = false;
        this.isSaving = false;
        this.isSaved = false;
        this.isError = true;
        this.rowError = handleError(event, false, "dismissible", true);
        event.detail.index = this.index;
        this.dispatchEvent(new CustomEvent("error", { detail: event.detail }));
    }

    handleCustomError() {
        let eventDetail = { index: this.index };
        this.dispatchEvent(new CustomEvent("error", { detail: eventDetail }));
    }

    handleSuccess(event) {
        this.recordId = event.detail.id;
        this.handleSaveEnd();
        this.lockContactField();
        fireEvent(this.pageRef, "serviceDeliveryUpsert", event.detail);
    }

    handleSubmit(event) {
        let fields = event.detail.fields;

        if (this.recordId) {
            fields.Id = this.recordId;
        }

        for (const [key, value] of Object.entries(this._valuesToSave)) {
            fields[key] = value;
        }

        this.template.querySelector("lightning-record-edit-form").submit(fields);

        this.handleSaveStart();
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

    enableDisableFieldsOnSaveAndInputChange() {
        this.fieldSet.forEach(element => {
            if (this.hasContactField && element.apiName !== this.fields.contact) {
                element.disabled = false;
            } else if (this.hasContactField & (element.apiName === this.fields.contact)) {
                element.disabled = true;
            }

            if (
                !this.hasContactField &&
                this.hasProgramEngagementField &&
                element.apiName !== this.fields.programEngagement
            ) {
                element.disabled = false;
            } else if (
                !this.hasContactField &&
                this.hasProgramEngagementField &&
                element.apiName === this.fields.programEngagement
            ) {
                element.disabled = true;
            }

            if (
                !this.hasContactField &&
                !this.hasProgramEngagementField &&
                element.apiName !== this.fields.service
            ) {
                element.disabled = false;
            } else if (
                !this.hasContactField &&
                !this.hasProgramEngagementField &&
                element.apiName === this.fields.service
            ) {
                element.disabled = true;
            }
        });
    }

    enableServiceInputWithOptions() {
        let result = [];

        if (this._servicesAndEngagements) {
            this._servicesAndEngagements[SERVICES].forEach(element => {
                if (element.program === this._targetProgram) {
                    result.push(element);
                }
            });
        }

        if (this._filteredServices) {
            result = this._filteredServices;
        }

        if (this.isServiceFiltered) {
            this.fieldSet = JSON.parse(JSON.stringify(this.fieldSet));
        }

        this.fieldSet.forEach(element => {
            if (
                element.apiName === this.fields.service &&
                this.hasProgramEngagementField
            ) {
                this.isError = false;
                if (this.isServiceFiltered) {
                    element.isComboBox = true;
                }

                element.disabled = false;
                element.options = result;
                if (!result.length) {
                    this.isError = true;
                    this.rowError = [this.labels.noServiceWarning];
                    element.disabled = true;
                    this.handleCustomError();
                }
            } else if (
                element.apiName !== this.fields.contact &&
                element.apiName !== this.fields.programEngagement
            ) {
                element.disabled = true;
            }
        });
    }

    resetQuantityLabel() {
        if (this.unitOfMeasureValue !== this.labels.quantity) {
            this.unitOfMeasureValue = this.labels.quantity;
        }
    }

    lockContactField() {
        this.fieldSet.forEach(element => {
            if (element.apiName === this.fields.contact) {
                element.disabled = true;
            }
        });
    }

    processDefaults() {
        if (
            this._defaultValues &&
            Object.keys(this._defaultValues).length > 0 &&
            this.fieldSet &&
            this.fieldSet.length &&
            !this._defaultsSet
        ) {
            this._defaultsSet = true;
            let contactId = "";

            this.fieldSet.forEach(member => {
                for (let [fieldName, fieldValue] of Object.entries(this._defaultValues)) {
                    if (member.apiName === fieldName && fieldValue != null) {
                        member.value = this._defaultValues[fieldName];
                        if (member.apiName === this.fields.contact) {
                            contactId = fieldValue;
                        }
                        if (member.apiName === this.fields.programEngagement) {
                            this.programEngagementId = fieldValue;
                        }
                    }
                    continue;
                }
            });

            if (this.hasContactField && this.hasProgramEngagementField && contactId) {
                this.handleGetServicesEngagements(contactId);
                this.selectedContact = contactId;
            }

            if (
                !this.hasContactField &&
                this.hasProgramEngagementField &&
                this.programEngagementId
            ) {
                this.isServiceFiltered = true;
                this.handleGetServicesForProgramEngagement(this.programEngagementId);
            }

            if (this.hasContactField && !this.hasProgramEngagementField && contactId) {
                this.handleEnableFieldOnInputChange(this.fields.contact);
            }
        }
    }

    handleSaveStart() {
        this.saveMessage = "...";
        this.isSaving = true;
        this.isSaved = false;
        this.isError = false;
    }

    handleSaveEnd() {
        this.isSaving = false;
        this.isSaved = true;
        this.isDirty = false;
        this.enableDisableFieldsOnSaveAndInputChange();
    }

    handleSaveNewPE(event) {
        if (event.detail) {
            this.programEngagementId = event.detail;
            if (this.selectedContact && this.programEngagementId) {
                this.handleGetServicesEngagements(this.selectedContact);
            }
        }
    }

    handleCancelNewPE() {
        this.template.querySelectorAll("lightning-combobox").forEach(element => {
            element.value = null;
        });
    }

    trackSpecialFields() {
        this.hasContactField = this.serviceDeliveryFieldSets.hasContactField(
            this.fieldSet
        );
        this.hasProgramEngagementField = this.serviceDeliveryFieldSets.hasProgramEngagementField(
            this.fieldSet
        );
    }

    setUnitOfMeasurement(fields) {
        this.unitOfMeasureValue =
            fields[this.fields.unitOfMeasurement] &&
            fields[this.fields.unitOfMeasurement].value
                ? fields[this.fields.unitOfMeasurement].value
                : quantity;
    }

    extractFieldSet(fields) {
        let serviceDeliveryFieldSet =
            fields[this.fields.fieldSet] && fields[this.fields.fieldSet].value
                ? fields[this.fields.fieldSet].value
                : DEFAULT_FIELD_SET;

        if (this.fieldSetApiName === serviceDeliveryFieldSet) {
            return;
        }

        this.fieldSet = this.serviceDeliveryFieldSets
            .getFieldSet(this.fieldSetApiName)
            .map(field => ({
                ...field,
            }));

        this.trackSpecialFields();
    }

    extractTargetProgram(engagementId) {
        this._servicesAndEngagements[ENGAGEMENTS].forEach(engagement => {
            if (engagement.value === engagementId) {
                this._targetProgram = engagement.program;
            }
        });
    }

    setServicesAndEngagements(result) {
        let engagements = result[ENGAGEMENTS].slice(0);
        engagements.push({
            label: "\u254B   " + newProgramEngagement,
            value: newProgramEngagement,
            program: "",
        });
        this._servicesAndEngagements = { ...result, engagements };
    }

    updateServiceAttributes(member) {
        member.isComboBox = true;
        if (!this.programEngagementId) {
            member.options = this._servicesAndEngagements[SERVICES].slice(0);
        } else {
            let result = [];
            this._servicesAndEngagements[SERVICES].forEach(filteredVal => {
                if (filteredVal.program === this._targetProgram) {
                    result.push(filteredVal);
                }
            });
            member.options = result.slice(0);
        }

        member.placeholder = this.labels.selectService;
    }

    updateProgramEngagementAttributes(member) {
        member.isComboBox = true;
        member.options = this._servicesAndEngagements[ENGAGEMENTS].slice(0);
        member.placeholder = this.labels.selectEngagement;
        member.disabled = false;

        if (this.programEngagementId) {
            member.value = this.programEngagementId;
        }
    }
}
