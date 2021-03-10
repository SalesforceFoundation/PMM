import { api, LightningElement, wire } from "lwc";
import { getRecord } from "lightning/uiRecordApi";

import SERVICE_DELIVERY_OBJECT from "@salesforce/schema/ServiceDelivery__c";
import SERVICE_FIELD from "@salesforce/schema/ServiceDelivery__c.Service__c";
import CONTACT_FIELD from "@salesforce/schema/ServiceDelivery__c.Contact__c";
import PROGRAM_ENGAGEMENT_FIELD from "@salesforce/schema/ServiceDelivery__c.ProgramEngagement__c";
import BULK_SERVICE_DELIVERY_FIELD_SET_FIELD from "@salesforce/schema/Service__c.BulkServiceDeliveryFieldSet__c";

import getFieldSet from "@salesforce/apex/FieldSetController.getFieldSetForLWC";

import selectService from "@salesforce/label/c.BSDT_Select_Service";

const DEFAULT_FIELD_SET = "Bulk_Service_Deliveries";

export default class GroupServiceDelivery extends LightningElement {
    objectApiName = SERVICE_DELIVERY_OBJECT.objectApiName;
    fieldSetName = DEFAULT_FIELD_SET;
    serviceId;
    fieldSet;

    serviceField = SERVICE_FIELD.fieldApiName;
    fieldSetField = BULK_SERVICE_DELIVERY_FIELD_SET_FIELD.fieldApiName;
    fieldsToExclude = [
        CONTACT_FIELD.fieldApiName,
        PROGRAM_ENGAGEMENT_FIELD.fieldApiName,
        this.serviceField,
    ];
    labels = { selectService };

    @wire(getRecord, {
        recordId: "$serviceId",
        fields: [BULK_SERVICE_DELIVERY_FIELD_SET_FIELD],
    })
    wiredSession(result) {
        if (result.data && result.data.fields && result.data.fields[this.fieldSetField]) {
            this.fieldSetName = result.data.fields[this.fieldSetField].value
                ? result.data.fields[this.fieldSetField].value
                : DEFAULT_FIELD_SET;
        }
    }

    @wire(getFieldSet, {
        objectName: "$objectApiName",
        fieldSetName: "$fieldSetName",
    })
    wiredFields({ error, data }) {
        if (data) {
            this.configureFieldSet(data);
        } else if (error) {
            console.log(JSON.stringify(error));
        }
    }

    @api
    getFields() {
        let fields = [];
        this.template.querySelectorAll("lightning-input-field").forEach(inputField => {
            let field = {};
            field[inputField.fieldName] = inputField.value;
            fields.push(field);
        });

        return fields;
    }

    handleServiceId(event) {
        this.resetFields();
        this.serviceId = event.target.value;
    }

    configureFieldSet(fieldSet) {
        this.fieldSet = [];
        fieldSet.forEach(field => {
            if (!this.fieldsToExclude.includes(field.apiName)) {
                this.fieldSet.push(field);
            }
        });
    }

    resetFields() {
        this.template.querySelectorAll("lightning-input-field").forEach(field => {
            if (field.fieldName !== this.serviceField) {
                field.reset();
            }
        });
    }
}
