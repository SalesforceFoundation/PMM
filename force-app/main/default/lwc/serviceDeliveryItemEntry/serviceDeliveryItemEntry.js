import { LightningElement, api, track } from "lwc";
import { showToast, handleError, debouncify } from "c/util";
import SERVICE_DELIVERY_OBJECT from "@salesforce/schema/ServiceDelivery__c";
import CONTACT_FIELD from "@salesforce/schema/ServiceDelivery__c.Contact__c";
import SERVICE_FIELD from "@salesforce/schema/ServiceDelivery__c.Service__c";
import QUANTITY_FIELD from "@salesforce/schema/ServiceDelivery__c.Quantity__c";
import UNIT_FIELD from "@salesforce/schema/ServiceDelivery__c.UnitOfMeasure__c";
import DATE_FIELD from "@salesforce/schema/ServiceDelivery__c.DeliveryDate__c";

const DELAY = 750;

export default class ServiceDeliveryItemEntry extends LightningElement {
    @api serviceDelivery;
    @track recordId;
    @track serviceDeliveryObject = SERVICE_DELIVERY_OBJECT;
    @track contactField = CONTACT_FIELD;
    @track serviceField = SERVICE_FIELD;
    @track quantityField = QUANTITY_FIELD;
    @track unitField = UNIT_FIELD;
    @track dateField = DATE_FIELD;
    @track isSaving = false;
    @track saveMessage;

    handleInputChange() {
        console.log('inputchange');
        this.autoSaveAfterDebounce();
    }

    autoSaveAfterDebounce = debouncify(this.autoSave.bind(this), DELAY);

    autoSave() {
        //To get all the data we need for save, we need to simulate clicking the submit button
        let itemSubmit = this.template.querySelector(".item-submit");
        if (itemSubmit) {
            itemSubmit.click();
        }
    }

    handleSubmit(event) {
        this.saveMessage = "Saving...";
        this.isSaving = true;
        event.preventDefault();
        let fields = event.detail.fields;

        // i don't think this will ever happen
        if (this.recordId) {
            fields.Id = this.recordId;
        }
        fields.Name = 'test';

        this.template.querySelector("lightning-record-edit-form").submit(fields);
    }

    handleSuccess(event) {
        this.saveMessage = "Saved";
        this.recordId = event.detail.id;
        this.isSaving = false;
    }
}
