import { LightningElement, wire, track } from "lwc";
import { CurrentPageReference } from "lightning/navigation";
import { debug } from "c/util";

import getFieldSet from "@salesforce/apex/ServiceDeliveryController.getFieldSet";

import SERVICEDELIVERY_OBJECT from "@salesforce/schema/ServiceDelivery__c";
import CONTACT_FIELD from "@salesforce/schema/ServiceDelivery__c.Contact__c";
import QUANTITY_FIELD from "@salesforce/schema/ServiceDelivery__c.Quantity__c";
import UNITMEASUREMENT_FIELD from "@salesforce/schema/ServiceDelivery__c.UnitOfMeasurement__c";

export default class TestModal extends LightningElement {

    @wire(CurrentPageReference) pageRef;

    @track fieldSet = [];
    @track localFieldSet;

    serviceDeliveryObject = SERVICEDELIVERY_OBJECT;

    fields = {
        contact: CONTACT_FIELD,
        unitMeasurement: UNITMEASUREMENT_FIELD,
        quantity: QUANTITY_FIELD,
    };

    @wire(getFieldSet)
    wiredFields({ data }) {
        if (data) {
            this.configureFieldSize(data.map(a => ({ ...a })));
        }
    }

    configureFieldSize(fieldSet) {
        fieldSet.forEach(field => {
            field.size = 2;
            field.disabled = true;
            if (
                field.apiName === this.fields.quantity.fieldApiName ||
                field.apiName === this.fields.unitMeasurement.fieldApiName
            ) {
                field.size = 1;
            }
            if (field.apiName === this.fields.contact.fieldApiName) {
                field.disabled = false;
            }
            this.fieldSet.push(field);
        });
    }

    doNothing() {
    }

    get defaultValues() {
        const defaultValues = {};
        this.template.querySelectorAll('lightning-input-field').forEach(field => {
            defaultValues[field.fieldName] = field.value;
        });
        return defaultValues;
    }

    showModal() {
        const defaultValues = this.defaultValues;
        debug("showModal", {
            defaultValues: defaultValues,
        })

        this.template.querySelector('c-service-delivery-modal').showModal(defaultValues);
    }

    showNewModal() {
        const defaultValues = this.defaultValues;
        debug("showNewModal", {
            defaultValues: defaultValues,
        })

        this.template.querySelector('c-service-delivery-modal').showNewModal(defaultValues);
    }

    hideModal() {
        this.template.querySelector('c-service-delivery-modal').hideModal();
    }
}