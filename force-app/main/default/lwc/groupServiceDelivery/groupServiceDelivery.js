import { api, LightningElement, wire } from "lwc";
import { getRecord } from "lightning/uiRecordApi";

import SERVICE_DELIVERY_OBJECT from "@salesforce/schema/ServiceDelivery__c";
import SERVICE_FIELD from "@salesforce/schema/ServiceDelivery__c.Service__c";
import CONTACT_FIELD from "@salesforce/schema/ServiceDelivery__c.Contact__c";
import PROGRAM_ENGAGEMENT_FIELD from "@salesforce/schema/ServiceDelivery__c.ProgramEngagement__c";
import SERVICE_DELIVERY_FIELD_SET_FIELD from "@salesforce/schema/Service__c.ServiceDeliveryFieldSet__c";

import getFieldSet from "@salesforce/apex/FieldSetController.getFieldSetForLWC";

import selectService from "@salesforce/label/c.BSDT_Select_Service";

const DEFAULT_FIELD_SET = "Bulk_Service_Deliveries";
const ERROR_MESSAGE = "Error on Page"; // Not displayed on screen, does not require a label.

export default class GroupServiceDelivery extends LightningElement {
    _serviceDelivery;
    objectApiName = SERVICE_DELIVERY_OBJECT.objectApiName;
    fieldSetName = DEFAULT_FIELD_SET;
    serviceId;
    fieldSet;

    serviceField = SERVICE_FIELD.fieldApiName;
    fieldSetField = SERVICE_DELIVERY_FIELD_SET_FIELD.fieldApiName;
    fieldsToExclude = [
        CONTACT_FIELD.fieldApiName,
        PROGRAM_ENGAGEMENT_FIELD.fieldApiName,
        this.serviceField,
    ];
    labels = { selectService };

    @wire(getRecord, {
        recordId: "$serviceId",
        fields: [SERVICE_DELIVERY_FIELD_SET_FIELD],
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
        let fields = {};
        let valid = true;
        this.template.querySelectorAll("lightning-input-field").forEach(inputField => {
            valid = valid && inputField.reportValidity();
            fields[inputField.fieldName] = inputField.value;
        });

        if (!valid) {
            throw new Error(ERROR_MESSAGE);
        }

        return fields;
    }

    @api
    get serviceDelivery() {
        return this._serviceDelivery;
    }

    set serviceDelivery(value) {
        if (!value) {
            return;
        }

        this._serviceDelivery = value;
        this.serviceId = value[SERVICE_FIELD.fieldApiName];
    }

    handleServiceId(event) {
        this.resetFields();
        this.serviceId = event.target.value;
    }

    configureFieldSet(fieldSetMembers) {
        this.fieldSet = [];

        fieldSetMembers.forEach(member => {
            let field = { ...member };
            if (!this.fieldsToExclude.includes(member.apiName)) {
                field.value = this.serviceDelivery
                    ? this.serviceDelivery[member.apiName]
                    : null;
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
