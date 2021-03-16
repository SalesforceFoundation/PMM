import CONTACT_FIELD from "@salesforce/schema/ServiceDelivery__c.Contact__c";
import SERVICE_FIELD from "@salesforce/schema/ServiceDelivery__c.Service__c";
import QUANTITY_FIELD from "@salesforce/schema/ServiceDelivery__c.Quantity__c";
import PROGRAM_ENGAGEMENT_FIELD from "@salesforce/schema/ServiceDelivery__c.ProgramEngagement__c";

const DEFAULT_FIELD_SET = "Bulk_Service_Deliveries";
const SHORT_DATA_TYPES = ["DOUBLE", "INTEGER", "BOOLEAN"];
const LONG_DATA_TYPES = ["TEXTAREA"];

export class ServiceDeliveryFieldSets {
    fieldSets = {};
    fieldSetsWithContactField = [];
    fieldSetsWithProgrameEngagementField = [];

    constructor(data) {
        this.setFieldSets(data);
    }

    setFieldSets(fieldSets) {
        for (const [apiName, fieldSet] of Object.entries(fieldSets)) {
            this.trackSpecialFields(apiName, fieldSet);
            this.configureFieldSet(apiName, fieldSet);
        }
    }

    getFieldSet(apiName) {
        return this.fieldSets[apiName]
            ? this.fieldSets[apiName]
            : this.fieldSets[DEFAULT_FIELD_SET];
    }

    hasContactField(fieldSetApiName) {
        return this.fieldSetsWithContactField.includes(fieldSetApiName);
    }

    hasProgramEngagementField(fieldSetApiName) {
        return this.fieldSetsWithProgrameEngagementField.includes(fieldSetApiName);
    }

    trackSpecialFields(fieldSetApiName, fieldSet) {
        fieldSet.forEach(member => {
            if (member.apiName === CONTACT_FIELD.fieldApiName) {
                this.fieldSetsWithContactField.push(fieldSetApiName);
            }
            if (member.apiName === PROGRAM_ENGAGEMENT_FIELD.fieldApiName) {
                this.fieldSetsWithProgrameEngagementField.push(fieldSetApiName);
            }
        });
    }

    configureFieldSet(apiName, fieldSet) {
        let configuredFieldSet = [];

        fieldSet.forEach(member => {
            let field = { ...member };
            // Number fields are size 1
            // Program Engagment lookup is size 4
            // Client lookup is size 3
            // Everything else is size 2
            // This means that the field set we ship with is exactly 12 wide
            this.setSize(field);
            this.setAttributes(apiName, field);
            configuredFieldSet.push(field);
        });
        this.fieldSets[apiName] = configuredFieldSet;
    }

    setSize(field) {
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

    setAttributes(fieldSetApiName, field) {
        field.disabled = true;
        field.isQuantityField = false;

        if (field.apiName === CONTACT_FIELD.fieldApiName) {
            field.disabled = false;
            field.isRequired = true;
        } else if (
            field.apiName === PROGRAM_ENGAGEMENT_FIELD.fieldApiName &&
            !this.hasContactField(fieldSetApiName)
        ) {
            field.disabled = false;
            field.isRequired = true;
        } else if (
            field.apiName === SERVICE_FIELD.fieldApiName &&
            !this.hasContactField(fieldSetApiName) &&
            !this.hasProgramEngagementField(fieldSetApiName)
        ) {
            field.disabled = false;
            field.isRequired = true;
        } else if (field.apiName === QUANTITY_FIELD.fieldApiName) {
            field.isQuantityField = true;
        }
    }
}
