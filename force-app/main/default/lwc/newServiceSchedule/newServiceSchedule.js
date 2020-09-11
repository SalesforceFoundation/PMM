import { LightningElement, api, wire, track } from "lwc";
import getFieldSet from "@salesforce/apex/FieldSetController.getFieldSetForLWC";
import { getObjectInfo, getPicklistValuesByRecordType } from "lightning/uiObjectInfoApi";

import NAME_FIELD from "@salesforce/schema/ServiceSchedule__c.Name";
import FIRST_SESSION_START_FIELD from "@salesforce/schema/ServiceSchedule__c.FirstSessionStart__c";
import FIRST_SESSION_END_FIELD from "@salesforce/schema/ServiceSchedule__c.FirstSessionEnd__c";
import FREQUENCY_FIELD from "@salesforce/schema/ServiceSchedule__c.Frequency__c";
import DAYS_OF_WEEK_FIELD from "@salesforce/schema/ServiceSchedule__c.DaysOfWeek__c";
import END_DATE_FIELD from "@salesforce/schema/ServiceSchedule__c.ServiceScheduleEndDate__c";
import NUMBER_OF_SESSIONS_FIELD from "@salesforce/schema/ServiceSchedule__c.NumberOfServiceSessions__c";
import SERVICE_SECHEDULE_ENDS_FIELD from "@salesforce/schema/ServiceSchedule__c.ServiceScheduleEnds__c";

const FIELD_SET_NAME = "ServiceScheduleInformation";
const WEEKLY = "Weekly";
const ONE_TIME = "One Time";
const ON = "On";
const AFTER = "After";
const LARGE_SIZE = 12;
const SMALL_SIZE = 6;

export default class NewServiceSchedule extends LightningElement {
    @api recordTypeId;
    objectApiName;
    labels;
    _serviceScheduleData;

    fields;
    fieldSet;
    isLoaded = false;

    @api
    get serviceScheduleData() {
        return this._serviceScheduleData;
    }

    set serviceScheduleData(value) {
        this._serviceScheduleData = value;

        this.updateDateFieldValues(value.serviceSchedule);
        this.labels = value.labels.serviceSchedule;
        this.objectApiName = value.labels.serviceSchedule.objectApiName;
    }

    updateDateFieldValues(serviceSchedule) {
        Object.keys(this.dateFields).forEach(dateField => {
            this.dateFields[dateField].value =
                serviceSchedule[this.dateFields[dateField].fieldApiName];
        });
    }

    @api
    get serviceSchedule() {
        let serviceSchedule = { ...this._serviceScheduleData.serviceSchedule };

        [...this.template.querySelectorAll("lightning-input-field")].forEach(field => {
            serviceSchedule[field.fieldName] = field.value;
        });

        Object.keys(this.picklistFields).forEach(field => {
            const fieldApiName = this.picklistFields[field].fieldApiName;
            const value = this.picklistFields[field].value;

            serviceSchedule[fieldApiName] = value;
        });

        return serviceSchedule;
    }

    get isWeekly() {
        return this.picklistFields.frequency.value === WEEKLY;
    }

    get isRecurring() {
        return (
            this.picklistFields.frequency.value &&
            this.picklistFields.frequency.value !== ONE_TIME
        );
    }

    get isEndsAfter() {
        return this.picklistFields.seriesEnds.value === AFTER;
    }

    get isEndsOn() {
        return this.picklistFields.seriesEnds.value === ON;
    }

    sizes = {
        large: LARGE_SIZE,
        small: SMALL_SIZE,
    };

    dateFields = {
        start: { fieldApiName: FIRST_SESSION_START_FIELD.fieldApiName, value: null },
        end: { fieldApiName: FIRST_SESSION_END_FIELD.fieldApiName, value: null },
        seriesEndsOn: { fieldApiName: END_DATE_FIELD.fieldApiName, value: null },
        numberOfSessions: {
            fieldApiName: NUMBER_OF_SESSIONS_FIELD.fieldApiName,
            value: null,
        },
    };

    @track
    picklistFields = {
        frequency: { fieldApiName: FREQUENCY_FIELD.fieldApiName, value: null },
        daysOfWeek: { fieldApiName: DAYS_OF_WEEK_FIELD.fieldApiName, value: null },
        seriesEnds: {
            fieldApiName: SERVICE_SECHEDULE_ENDS_FIELD.fieldApiName,
            value: null,
        },
    };

    @wire(getFieldSet, {
        objectName: "$objectApiName",
        fieldSetName: FIELD_SET_NAME,
    })
    wiredFieldSet({ error, data }) {
        if (data) {
            this.setFieldSet(data);
        } else if (error) {
            console.log(JSON.stringify(error));
        }
    }

    setFieldSet(data) {
        // TODO: Test if this eliminates duplicate fields
        let recurrenceFields = Object.values(this.dateFields);
        recurrenceFields.push(Object.values(this.picklistFields));

        this.fieldSet = data
            .filter(obj => !recurrenceFields.includes(obj.apiName))
            .map(obj => {
                let field = { ...obj };
                field.size =
                    obj.apiName === NAME_FIELD.fieldApiName ? LARGE_SIZE : SMALL_SIZE;
                field.value = this._serviceScheduleData.serviceSchedule[field.apiName];
                return field;
            });
    }

    @wire(getObjectInfo, { objectApiName: "$objectApiName" })
    wiredObject(result) {
        if (!result) {
            return;
        }

        if (result.data) {
            // TODO: Test record types
            this.recordTypeId = this.recordTypeId
                ? this.recordTypeId
                : result.data.defaultRecordTypeId;
            this.fields = result.data.fields;
            this.isLoaded = this.wiredPicklistValues !== undefined;
        } else if (result.error) {
            console.log(JSON.stringify(result.error));
        }
    }

    @wire(getPicklistValuesByRecordType, {
        objectApiName: "$objectApiName",
        recordTypeId: "$recordTypeId",
    })
    wiredPicklists(result) {
        if (!result) {
            return;
        }

        if (result.data) {
            Object.keys(this.picklistFields).forEach(field => {
                const fieldApiName = this.picklistFields[field].fieldApiName;
                const picklistField = {
                    ...result.data.picklistFieldValues[fieldApiName],
                };

                if (picklistField && this.fields[fieldApiName]) {
                    picklistField.label = this.fields[fieldApiName].label;
                    this.picklistFields[field].picklist = picklistField;
                    this.picklistFields[
                        field
                    ].value = this._serviceScheduleData.serviceSchedule[
                        this.picklistFields[field].fieldApiName
                    ];
                }
            });
            this.isLoaded = this.fields !== undefined;
        }
    }

    handleFrequencyChange(event) {
        this.picklistFields.frequency.value = event.detail.length
            ? event.detail[0].value
            : undefined;
    }

    handleDaysOfWeekChange(event) {
        this.picklistFields.daysOfWeek.value = event.detail.length
            ? event.detail.map(selection => selection.value)
            : undefined;
    }

    handleSeriesEndsChange(event) {
        this.picklistFields.seriesEnds.value = event.detail.length
            ? event.detail[0].value
            : undefined;
    }
}
