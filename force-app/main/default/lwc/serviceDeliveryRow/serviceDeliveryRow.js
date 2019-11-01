import { LightningElement, track, wire, api } from 'lwc';
import { showToast, handleError, debouncify } from 'c/util';
import { deleteRecord } from 'lightning/uiRecordApi';
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

    @wire(getFieldSet)
    wiredFields({error, data}) {
        if (data) {
            this.fieldSet = data;
        } else if (error) {
            handleError(error);
        }
    }

    handleInputChange() {
        this.autoSaveAfterDebounce();        
    }

    autoSaveAfterDebounce = debouncify(this.autoSave.bind(this), DELAY)

    autoSave() {
        //To get all the data we need for save, we need to simulate clicking the submit button
        let deliverySubmit = this.template.querySelector('.sd-submit');
        if(deliverySubmit) {
            deliverySubmit.click();
        }
    }
    handleError(event) {
        console.log('Error', JSON.parse(JSON.stringify(event.detail)));
    }
    handleSuccess(event) {
        console.log('Success');
        this.recordId = event.detail.id;
        showToast('Success', 'Success', 'success');
    }
    handleSubmit(event) {
        console.log('Handle Submit');
        console.log(JSON.parse(JSON.stringify(event.detail)));
    
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
}