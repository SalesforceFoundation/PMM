import CONTACT_FIELD from "@salesforce/schema/ServiceDelivery__c.Contact__c";
import SERVICE_FIELD from "@salesforce/schema/ServiceDelivery__c.Service__c";
import QUANTITY_FIELD from "@salesforce/schema/ServiceDelivery__c.Quantity__c";
import PROGRAM_ENGAGEMENT_FIELD from "@salesforce/schema/ServiceDelivery__c.ProgramEngagement__c";

import selectService from "@salesforce/label/c.Select_Service";
import selectEngagement from "@salesforce/label/c.Select_Program_Engagement";

const SHORT_DATA_TYPES = ["DOUBLE", "INTEGER", "BOOLEAN"];
const LONG_DATA_TYPES = ["TEXTAREA"];

export class ServiceDeliveryFieldSets {
    fieldSets = {};
    currentFieldSetName;

    constructor(data) {
        this.setFieldSets(data);
    }

    setFieldSets(fieldSets) {
        for (const [apiName, fieldSet] of Object.entries(fieldSets)) {
            this.configureFieldSet(apiName, fieldSet);
        }
    }

    getCurrentFieldSet() {
        return this.fieldSets[this.currentFieldSetName];
    }

    isFieldInCurrentFieldSet(fieldApiName) {
        return this.isFieldInFieldSet(this.getCurrentFieldSet(), fieldApiName);
    }

    isFieldInFieldSet(fieldSet, fieldApiName) {
        let field = fieldSet.find(member => member.apiName === fieldApiName);

        return field !== undefined;
    }

    hasContactField(fieldSet) {
        return this.isFieldInFieldSet(fieldSet, CONTACT_FIELD.fieldApiName);
    }

    hasProgramEngagementField(fieldSet) {
        return this.isFieldInFieldSet(fieldSet, PROGRAM_ENGAGEMENT_FIELD.fieldApiName);
    }

    configureFieldSet(apiName, fieldSet) {
        let configuredFieldSet = [];

        fieldSet.forEach(member => {
            let field = { ...member };
            this.setSize(field);
            this.setDefaultAttributes(fieldSet, field);
            configuredFieldSet.push(field);
        });
        this.fieldSets[apiName] = configuredFieldSet;
    }

    setSize(field) {
        // Number fields are size 1
        // Program Engagment lookup is size 4
        // Client lookup is size 3
        // Everything else is size 2
        // This means that the field set we ship with is exactly 12 wide
        if (SHORT_DATA_TYPES.includes(field.type)) {
            field.size = 1;
        } else if (field.apiName === PROGRAM_ENGAGEMENT_FIELD.fieldApiName) {
            field.size = 4;
        } else if (
            field.apiName === CONTACT_FIELD.fieldApiName ||
            LONG_DATA_TYPES.includes(field.type)
        ) {
            field.size = 3;
        } else {
            field.size = 2;
        }
    }

    setDefaultAttributes(fieldSet, field) {
        let hasContactField = this.isFieldInFieldSet(
            fieldSet,
            CONTACT_FIELD.fieldApiName
        );
        let hasProgramEngagementField = this.isFieldInFieldSet(
            fieldSet,
            PROGRAM_ENGAGEMENT_FIELD.fieldApiName
        );

        field.disabled = true;
        field.isQuantityField = false;

        if (field.apiName === SERVICE_FIELD.fieldApiName) {
            field.required = true;
            field.disabled = hasProgramEngagementField;
            field.isCombobox = hasProgramEngagementField;
            field.placeholder = selectService;
        } else if (field.apiName === CONTACT_FIELD.fieldApiName) {
            field.isRequired = true;
            field.disabled = false;
        } else if (field.apiName === PROGRAM_ENGAGEMENT_FIELD.fieldApiName) {
            field.isRequired = true;
            field.disabled = hasContactField;
            field.isCombobox = hasContactField;
            field.placeholder = selectEngagement;
        } else if (field.apiName === QUANTITY_FIELD.fieldApiName) {
            field.isQuantityField = true;
        }
    }
}
