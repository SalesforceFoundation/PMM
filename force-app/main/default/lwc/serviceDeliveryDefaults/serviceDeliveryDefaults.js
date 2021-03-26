import { api, LightningElement, track, wire } from "lwc";
import { getRecord } from "lightning/uiRecordApi";

import SERVICE_DELIVERY_OBJECT from "@salesforce/schema/ServiceDelivery__c";
import SERVICE_FIELD from "@salesforce/schema/ServiceDelivery__c.Service__c";
import CONTACT_FIELD from "@salesforce/schema/ServiceDelivery__c.Contact__c";
import PROGRAM_ENGAGEMENT_FIELD from "@salesforce/schema/ServiceDelivery__c.ProgramEngagement__c";
import QUANTITY_FIELD from "@salesforce/schema/ServiceDelivery__c.Quantity__c";
import SERVICE_UNIT_OF_MEASUREMENT_FIELD from "@salesforce/schema/Service__c.UnitOfMeasurement__c";
import SERVICE_DELIVERY_FIELD_SET_FIELD from "@salesforce/schema/Service__c.ServiceDeliveryFieldSet__c";

import getFieldSet from "@salesforce/apex/FieldSetController.getFieldSetForLWC";

import selectService from "@salesforce/label/c.BSDT_Select_Service";

const DEFAULT_FIELD_SET = "Bulk_Service_Deliveries";
const ERROR_MESSAGE = "Error on Page"; // Not displayed on screen, does not require a label.

export default class ServiceDeliveryDefaults extends LightningElement {
    @track fieldSet;

    serviceId;
    objectApiName = SERVICE_DELIVERY_OBJECT.objectApiName;
    fieldSetName = DEFAULT_FIELD_SET;
    serviceFieldName = SERVICE_FIELD.fieldApiName;

    fieldsToExclude = [
        CONTACT_FIELD.fieldApiName,
        PROGRAM_ENGAGEMENT_FIELD.fieldApiName,
        SERVICE_FIELD.fieldApiName,
    ];
    labels = { selectService };
    _serviceDelivery;

    @wire(getRecord, {
        recordId: "$serviceId",
        fields: [SERVICE_DELIVERY_FIELD_SET_FIELD, SERVICE_UNIT_OF_MEASUREMENT_FIELD],
    })
    wiredService(result) {
        if (result.data && result.data.fields) {
            this.fieldSetName =
                result.data.fields[SERVICE_DELIVERY_FIELD_SET_FIELD.fieldApiName] &&
                result.data.fields[SERVICE_DELIVERY_FIELD_SET_FIELD.fieldApiName].value
                    ? result.data.fields[SERVICE_DELIVERY_FIELD_SET_FIELD.fieldApiName]
                          .value
                    : DEFAULT_FIELD_SET;

            this.setUnitOfMeasurement(
                result.data.fields[SERVICE_UNIT_OF_MEASUREMENT_FIELD.fieldApiName]
            );
        }
    }

    setUnitOfMeasurement(field) {
        if (!field || !field.value) {
            return;
        }

        let quantityField = this.fieldSet.find(
            member => member.apiName === QUANTITY_FIELD.fieldApiName
        );

        if (!quantityField) {
            return;
        }

        quantityField.label = field.value;
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

        fields[SERVICE_DELIVERY_FIELD_SET_FIELD.fieldApiName] = this.fieldSetName;

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
            if (field.fieldName !== SERVICE_FIELD.fieldApiName) {
                field.reset();
            }
        });
    }
}
