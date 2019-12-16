import { LightningElement, track, api } from 'lwc';
import { showToast, handleError, debouncify } from 'c/util';
import { deleteRecord } from 'lightning/uiRecordApi';

import deleteLabel from "@salesforce/label/c.Delete";
import cancel from "@salesforce/label/c.Cancel";
import confirmDelete from "@salesforce/label/c.Confirm_Delete";
import confirmDeleteMessage from "@salesforce/label/c.Confirm_Delete_Row";
import success from "@salesforce/label/c.Success";
import recordDeleted from "@salesforce/label/c.Record_Deleted";

import SERVICEDEVLIERY_OBJECT from "@salesforce/schema/ServiceDelivery__c";

const DELAY = 1000;

export default class ServiceDeliveryRow extends LightningElement {
    @api recordId;
    @api index;
    @api fieldSet;
    @api rowCount;

    @track hasQuantity = false;

    serviceDeliveryObject = SERVICEDEVLIERY_OBJECT;

    get isDeleteDisabled() {
        return this.rowCount === 1 && this.recordId == null ? true : false;
    }

    labels = {
        cancel,
        confirmDelete,
        confirmDeleteMessage,
        deleteLabel,
        recordDeleted,
        success
    }

    autoSaveAfterDebounce = debouncify(this.autoSave.bind(this), DELAY)

    autoSave() {
        let deliverySubmit = this.template.querySelector('.sd-submit');
        if(deliverySubmit) {
            deliverySubmit.click();
        }
    }

    handleInputChange() {
        this.autoSaveAfterDebounce();        
    }

    handleError(event) {
        this.dispatchEvent(new CustomEvent("saveend"));
        handleError(event.detail.message);
    }

    handleSuccess(event) {
        this.recordId = event.detail.id;
        this.dispatchEvent(new CustomEvent("saveend"));
    }

    handleSubmit(event) {    
        let fields = event.detail.fields;

        if(this.recordId) {
            fields.Id = this.recordId;
        }

        this.template.querySelector('lightning-record-edit-form').submit(fields);
        this.dispatchEvent(new CustomEvent("savestart"));
    }
  
    handleDelete() {
        if(this.recordId) {
            deleteRecord(this.recordId)
            .then(() => {
                this.recordId = '';
                showToast(this.labels.success, this.labels.recordDeleted, 'success');
                this.dispatchEvent(new CustomEvent("delete", {detail : this.index}));
            })
            .catch(error => {
                handleError(error);
            });
        } else {
            this.dispatchEvent(new CustomEvent("delete", {detail : this.index}));
        }
    }

    handleShowModal() {
        const modal = this.template.querySelector('c-modal');
        modal.show();
    }

    handleCloseModal() {
        const modal = this.template.querySelector('c-modal');
        modal.hide();
    }

    //Temporary CSS Overrides.
    //TODO : Update when shadow-dom styling options are available.
    renderedCallback() {
        if (this.hasRendered) return;
        this.hasRendered = true;
        const style = document.createElement('style');
        style.innerText = `
        .sd-input .slds-form-element__help {
            position: absolute;
            }
        `;
        this.template.querySelector('div.style-target').appendChild(style);
    }
}