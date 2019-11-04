import { LightningElement, track, wire, api } from 'lwc';
import { showToast, handleError, debouncify } from 'c/util';
import { deleteRecord } from 'lightning/uiRecordApi';

import deleteLabel from "@salesforce/label/c.Delete";
import cancel from "@salesforce/label/c.Cancel";
import confirmDelete from "@salesforce/label/c.Confirm_Delete";
import confirmDeleteMessage from "@salesforce/label/c.Confirm_Delete_Row";
import success from "@salesforce/label/c.Success";
import recordSaved from "@salesforce/label/c.Record_Saved";

import SERVICEDEVLIERY_OBJECT from "@salesforce/schema/ServiceDelivery__c";
import UNITMEASURE_FIELD from "@salesforce/schema/ServiceDelivery__c.UnitOfMeasure__c";
import QUANTITY_FIELD from "@salesforce/schema/ServiceDelivery__c.Quantity__c";

import getFieldSet from '@salesforce/apex/ServiceDeliveryController.getFieldSet';

const DELAY = 750;

export default class ServiceDeliveryRow extends LightningElement {
    @api recordId;
    @api index;

    @track fieldSet;
    
    serviceDeliveryObject = SERVICEDEVLIERY_OBJECT;
    fields = {
        unitMeasureField : UNITMEASURE_FIELD,
        quantity : QUANTITY_FIELD
    }
    labels = {
        cancel,
        confirmDelete,
        confirmDeleteMessage,
        deleteLabel,
        recordSaved,
        success
    }

    @wire(getFieldSet)
    wiredFields({error, data}) {
        if (data) {
            this.fieldSet = data;
        } else if (error) {
            handleError(error);
        }
    }

    connectedCallback() {
        console.log('fields', this.fields);
    }

    handleInputChange() {
        this.autoSaveAfterDebounce();        
    }

    autoSaveAfterDebounce = debouncify(this.autoSave.bind(this), DELAY)

    autoSave() {
        let deliverySubmit = this.template.querySelector('.sd-submit');
        if(deliverySubmit) {
            deliverySubmit.click();
        }
    }
    handleError(event) {
        //TODO : handleError;
        console.log('Error', JSON.parse(JSON.stringify(event.detail)));
    }
    handleSuccess(event) {
        this.recordId = event.detail.id;
        showToast(this.labels.success, this.labels.recordSaved, 'success');
    }
    handleSubmit(event) {    
        let fields = event.detail.fields;

        if(this.recordId) {
            fields.Id = this.recordId;
        }

        this.template.querySelector('lightning-record-edit-form').submit(fields);
    }
  
    handleDelete() {
        if(this.recordId) {
            deleteRecord(this.recordId)
            .then(() => {
                this.recordId = '';
                showToast('Success', 'Deleted', 'success');
                this.dispatchEvent(new CustomEvent("delete", {detail : this.index}));
            })
            .catch(error => {
                handleError(error);
            });
        } else {
            this.dispatchEvent(new CustomEvent("delete", {detail : this.index}));
        }
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

    handleShowModal() {
        const modal = this.template.querySelector('c-modal');
        modal.show();
    }

    handleCloseModal() {
        const modal = this.template.querySelector('c-modal');
        modal.hide();
    }
}