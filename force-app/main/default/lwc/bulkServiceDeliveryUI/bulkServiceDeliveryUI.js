import { LightningElement, api, track, wire } from "lwc";
import { handleError, debouncify } from "c/util";
import addServiceDelivery from "@salesforce/label/c.Add_Service_Delivery";
import saved from "@salesforce/label/c.Saved";
import saving from "@salesforce/label/c.Saving";
import serviceDeliveries from "@salesforce/label/c.Service_Deliveries";
import CONTACT_FIELD from "@salesforce/schema/ServiceDelivery__c.Contact__c";
import QUANTITY_FIELD from "@salesforce/schema/ServiceDelivery__c.Quantity__c";
import UNITSERVICE_FIELD from "@salesforce/schema/ServiceDelivery__c.UnitOfService__c";

import getFieldSet from "@salesforce/apex/ServiceDeliveryController.getFieldSet";

export default class BulkServiceDeliveryUI extends LightningElement {
    @api defaultValues;
    @track serviceDeliveries = [{ index: 0 }];
    @track isSaving = false;
    @track saveMessage;
    @track fieldSet = [];
    @track hasQuantity = false;
    @track rowCount = this.serviceDeliveries.length;

    labels = {
        addServiceDelivery,
        saved,
        saving,
        serviceDeliveries,
    };
    fields = {
        contact: CONTACT_FIELD,
        unitService: UNITSERVICE_FIELD,
        quantity: QUANTITY_FIELD,
    };
    _deliveryIndex = 1;

    @wire(getFieldSet)
    wiredFields({ error, data }) {
        if (data) {
            this.configureFieldSize(data.map(a => ({ ...a })));
        } else if (error) {
            handleError(error);
        }
    }

    configureFieldSize(fieldSet) {
        fieldSet.forEach(field => {
            field.size = 2;
            field.disabled = true;
            if (
                field.apiName === this.fields.quantity.fieldApiName ||
                field.apiName === this.fields.unitService.fieldApiName
            ) {
                field.size = 1;
            }
            if (field.apiName === this.fields.contact.fieldApiName) {
                field.disabled = false;
            }
            this.fieldSet.push(field);
        });
    }

    addDelivery() {
        this.serviceDeliveries.push({ index: this._deliveryIndex });
        this._deliveryIndex++;
        this.rowCount = this.serviceDeliveries.length;
    }

    handleDelete(event) {
        this.serviceDeliveries = this.serviceDeliveries.filter(function(obj) {
            return obj.index !== event.detail;
        });
        if (this.serviceDeliveries.length <= 0) {
            this.addDelivery();
        }
    }

    handleSaveStart() {
        this.saveMessage = this.labels.saving + "...";
        this.isSaving = true;
    }

    resetIsSaving = debouncify(
        function() {
            this.isSaving = false;
        }.bind(this),
        2000
    );

    handleSaveEnd() {
        this.saveMessage = this.labels.saved;
        this.resetIsSaving();
    }
}
