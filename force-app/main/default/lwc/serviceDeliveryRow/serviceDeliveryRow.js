import { LightningElement, wire, track, api } from "lwc";
import { showToast, handleError, debouncify } from "c/util";
import { deleteRecord } from "lightning/uiRecordApi";
import { fireEvent } from "c/pubsub";
import { CurrentPageReference } from "lightning/navigation";

import getServicesAndEngagements from "@salesforce/apex/ServiceDeliveryController.getServicesAndEngagements";

import deleteLabel from "@salesforce/label/c.Delete";
import cancel from "@salesforce/label/c.Cancel";
import error from "@salesforce/label/c.Error";
import warning from "@salesforce/label/c.Warning";
import saving from "@salesforce/label/c.Saving";
import saved from "@salesforce/label/c.Saved";

import confirmDelete from "@salesforce/label/c.Confirm_Delete";
import confirmDeleteMessage from "@salesforce/label/c.Confirm_Delete_Row";
import success from "@salesforce/label/c.Success";
import recordDeleted from "@salesforce/label/c.Record_Deleted";
import selectService from "@salesforce/label/c.Select_Service";
import selectEngagement from "@salesforce/label/c.Select_Program_Engagement";
import selectedContactWarning from "@salesforce/label/c.Service_Delivery_Contact_Without_Programs";
import noServiceWarning from "@salesforce/label/c.No_Services_For_Program_Engagement";

import CONTACT_FIELD from "@salesforce/schema/ServiceDelivery__c.Contact__c";
import SERVICE_FIELD from "@salesforce/schema/ServiceDelivery__c.Service__c";
import PROGRAMENGAGEMENT_FIELD from "@salesforce/schema/ServiceDelivery__c.ProgramEngagement__c";
import SERVICEDELIVERY_OBJECT from "@salesforce/schema/ServiceDelivery__c";

const DELAY = 1000;
const ENGAGEMENTS = "engagements";
const SERVICES = "services";

export default class ServiceDeliveryRow extends LightningElement {
    @wire(CurrentPageReference) pageRef;

    @api recordId;
    @api index;
    @api rowCount;
    @track isSaving;
    @track isError;
    @track isSaved;
    @track rowError;
    @api
    get defaultValues() {
        return this.localDefaultValues;
    }
    set defaultValues(value) {
        this.localDefaultValues = value;
        this.processDefaults();
    }
    @api
    get fieldSet() {
        return this.localFieldSet;
    }
    set fieldSet(value) {
        this.localFieldSet = value;
    }

    @track localDefaultValues;
    @track localFieldSet;
    @track hasQuantity = false;
    @track saveMessage;

    noContactPrograms = false;
    _defaultsSet = false;
    _filteredValues;
    _valuesToSave = [];
    _targetProgram;

    ERROR = error;
    WARNING = warning;

    serviceDeliveryObject = SERVICEDELIVERY_OBJECT;

    get isDeleteDisabled() {
        return this.rowCount === 1 && this.recordId == null ? true : false;
    }
    labels = {
        cancel,
        confirmDelete,
        confirmDeleteMessage,
        deleteLabel,
        noServiceWarning,
        recordDeleted,
        selectedContactWarning,
        selectEngagement,
        selectService,
        success,
        saved,
        saving,
        error,
    };
    fields = {
        contact: CONTACT_FIELD,
        service: SERVICE_FIELD,
        programEngagement: PROGRAMENGAGEMENT_FIELD,
    };

    autoSaveAfterDebounce = debouncify(this.autoSave.bind(this), DELAY);

    autoSave() {
        let deliverySubmit = this.template.querySelector(".sd-submit");
        if (deliverySubmit) {
            deliverySubmit.click();
        }
    }

    handleGetServicesEngagements(contactId) {
        this.noContactPrograms = false;
        this.isError = false;
        getServicesAndEngagements({ contactId: contactId })
            .then(result => {
                if (result && (!result[SERVICES] || !result[ENGAGEMENTS].length)) {
                    this.isError = true;
                    this.rowError = [this.labels.selectedContactWarning];
                }
                this._filteredValues = result;
                this.handleContactChange();
            })
            .catch(error => {
                this.rowError = handleError(error,false);
            });
    }

    handleInputChange(event) {
        if (event.target.fieldName === this.fields.contact.fieldApiName) {
            if (event.detail.value && event.detail.value.length) {
                this.handleGetServicesEngagements(event.detail.value[0]);
            } else {
                this.handleResetContact();
            }
        } else {
            this.autoSaveAfterDebounce();
        }
    }

    handleResetContact() {
        this.localFieldSet.forEach(element => {
            element.showFilteredInput = false;
        });
        this._filteredValues = [];
        this._valuesToSave = [];
        this.noContactPrograms = false;
    }

    handleComboChange(event) {
        let fieldName = event.target.name;
        let fieldVal = event.detail.value;

        if (fieldName === this.fields.programEngagement.fieldApiName) {
            this._valuesToSave = []; //If the engagement changes, wipe stored values.
            this._filteredValues[ENGAGEMENTS].forEach(element => {
                if (element.value === fieldVal) {
                    this._targetProgram = element.program;
                }
            });
            this.enableServiceInputWithOptions();
        }

        if (fieldName && fieldVal) {
            this._valuesToSave[fieldName] = fieldVal;
        }

        //If the service value changes, attempt to save the record.
        if (fieldName === this.fields.service.fieldApiName) {
            this.enableFields();
            this.autoSaveAfterDebounce();
        }
    }

    handleContactChange() {
        //Make our fieldset mutable the first time it's manipulated.
        this.localFieldSet = this.localFieldSet.map(a => ({ ...a }));

        this.localFieldSet.forEach(element => {
            if (element.apiName === this.fields.service.fieldApiName) {
                element.showFilteredInput = true;
                element.isService = true;
                element.options = this._filteredValues[SERVICES];
                element.placeholder = this.labels.selectService;
            } else if (element.apiName === this.fields.programEngagement.fieldApiName) {
                element.showFilteredInput = true;
                element.isEngagement = true;
                element.options = this._filteredValues[ENGAGEMENTS];
                element.placeholder = this.labels.selectEngagement;
                element.disabled = false;
                if (this.noContactPrograms) {
                    element.disabled = true;
                }
            } else if (element.apiName !== this.fields.contact.fieldApiName) {
                element.disabled = true;
            }
        });
    }

    handleLoad(event) {
        this.processDefaults();
    }

    handleError(event) {
        this.isSaving = false;
        this.isSaved = false;
        this.isError = true;
        // TODO: show this in a tooltip on the lightning:icon on hover and keyboard focus; probably slds-tooltip
        this.rowError = handleError(event, false, "dismissible", true);
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
                .catch(error => {
                    handleError(error);
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

    enableFields() {
        this.localFieldSet.forEach(element => {
            if (element.apiName !== this.fields.contact.fieldApiName) {
                element.disabled = false;
            }
        });
    }

    enableServiceInputWithOptions() {
        let result = [];
        this._filteredValues[SERVICES].forEach(element => {
            if (element.program === this._targetProgram) {
                result.push(element);
            }
        });

        this.localFieldSet.forEach(element => {
            if (element.apiName === this.fields.service.fieldApiName) {
                this.isError = false;
                element.disabled = false;
                element.options = result;
                if (!result.length) {
                    this.isError = true;
                    this.rowError = [this.labels.noServiceWarning];
                    element.disabled = true;
                }
            } else if (
                element.apiName !== this.fields.contact.fieldApiName &&
                element.apiName !== this.fields.programEngagement.fieldApiName
            ) {
                element.disabled = true;
            }
        });
    }

    lockContactField() {
        this.localFieldSet.forEach(element => {
            if (element.apiName === this.fields.contact.fieldApiName) {
                element.disabled = true;
            }
        });
    }

    processDefaults() {
        if (
            this.localDefaultValues &&
            Object.keys(this.localDefaultValues).length > 0 &&
            this.localFieldSet &&
            this.localFieldSet.length &&
            !this._defaultsSet
        ) {
            this._defaultsSet = true;
            let hasContact = false;
            let contactId = "";

            this.localFieldSet = this.localFieldSet.map(a => ({ ...a }));
            this.localFieldSet.forEach(element => {
                for (let [key, value] of Object.entries(this.localDefaultValues)) {
                    if (element.apiName.endsWith(key)) {
                        element.value = this.localDefaultValues[key];
                        if (element.apiName === this.fields.contact.fieldApiName) {
                            hasContact = true;
                            contactId = value;
                        }
                    }
                }
            });

            if (hasContact) {
                this.handleGetServicesEngagements(contactId);
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
    }

    //Temporary CSS Overrides.
    //TODO : Update when shadow-dom styling options are available.
    renderedCallback() {
        if (this.hasRendered) return;
        this.hasRendered = true;
        const style = document.createElement("style");
        style.innerText = `
        .sd-input .slds-form-element__help {
            position: absolute;
            }
        `;
        this.template.querySelector("div.style-target").appendChild(style);
    }
}
