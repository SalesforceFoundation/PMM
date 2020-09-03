import { LightningElement, api, wire } from "lwc";
import getFieldSet from "@salesforce/apex/FieldSetController.getFieldSetForLWC";
import { getObjectInfo, getPicklistValuesByRecordType } from "lightning/uiObjectInfoApi";

import SERVICE_SCHEDULE_OBJECT from "@salesforce/schema/ServiceSchedule__c";

import NAME_FIELD from "@salesforce/schema/ServiceSchedule__c.Name";
import FIRST_SESSION_START_FIELD from "@salesforce/schema/ServiceSchedule__c.FirstSessionStart__c";
import FIRST_SESSION_END_FIELD from "@salesforce/schema/ServiceSchedule__c.FirstSessionEnd__c";
import FREQUENCY_FIELD from "@salesforce/schema/ServiceSchedule__c.Frequency__c";
import DAYS_OF_WEEK_FIELD from "@salesforce/schema/ServiceSchedule__c.DaysOfWeek__c";
import END_DATE_FIELD from "@salesforce/schema/ServiceSchedule__c.ServiceScheduleEndDate__c";
import NUMBER_OF_SESSIONS_FIELD from "@salesforce/schema/ServiceSchedule__c.NumberOfServiceSessions__c";
import SERVICE_SECHEDULE_ENDS_FIELD from "@salesforce/schema/ServiceSchedule__c.ServiceScheduleEnds__c";

import SERVICE_SCHEDULE_INFORMATION_LABEL from "@salesforce/label/c.Service_Schedule_Information";
import DATE_TIME_LABEL from "@salesforce/label/c.Service_Schedule_Date_Time";

const FIELD_SET_NAME = "ServiceScheduleInformation";
const WEEKLY = "Weekly";
const ONE_TIME = "One Time";
const ON = "On";
const AFTER = "After";
const LARGE_SIZE = 12;
const SMALL_SIZE = 6;

export default class NewServiceSchedule extends LightningElement {
    @api serviceId;
    @api recordTypeId;

    fields;
    fieldSet;
    objectApiName = SERVICE_SCHEDULE_OBJECT.objectApiName;
    isWeekly = false;
    isRecurring = false;
    isEndsOn = false;
    isEndsAfter = false;
    isLoaded = false;
    selectedFrequency;
    selectedDaysOfWeek;
    selectedSeriesEnds;
    picklists;

    labels = {
        scheduleInformation: SERVICE_SCHEDULE_INFORMATION_LABEL,
        dateTime: DATE_TIME_LABEL,
    };

    sizes = {
        large: LARGE_SIZE,
        small: SMALL_SIZE,
    };

    dateFields = {
        start: FIRST_SESSION_START_FIELD.fieldApiName,
        end: FIRST_SESSION_END_FIELD.fieldApiName,
        seriesEndsOn: END_DATE_FIELD.fieldApiName,
        numberOfSessions: NUMBER_OF_SESSIONS_FIELD.fieldApiName,
    };

    picklistFields = {
        frequency: FREQUENCY_FIELD.fieldApiName,
        daysOfWeek: DAYS_OF_WEEK_FIELD.fieldApiName,
        seriesEnds: SERVICE_SECHEDULE_ENDS_FIELD.fieldApiName,
    };

    @wire(getFieldSet, {
        objectName: SERVICE_SCHEDULE_OBJECT.objectApiName,
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
                return field;
            });
    }

    @wire(getObjectInfo, { objectApiName: SERVICE_SCHEDULE_OBJECT })
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
        objectApiName: SERVICE_SCHEDULE_OBJECT,
        recordTypeId: "$recordTypeId",
    })
    wiredPicklists(result) {
        if (!result) {
            return;
        }
        this.picklists = {};

        if (result.data) {
            Object.keys(this.picklistFields).forEach(field => {
                const fieldApiName = this.picklistFields[field];
                const picklistField = {
                    ...result.data.picklistFieldValues[fieldApiName],
                };

                if (picklistField && this.fields[fieldApiName]) {
                    picklistField.label = this.fields[fieldApiName].label;
                    this.picklists[field] = picklistField;
                }
            });
            this.isLoaded = this.fields !== undefined;
        }
    }

    handleFrequencyChange(event) {
        this.selectedFrequency = event.detail.length ? event.detail[0].value : undefined;
        this.isWeekly = this.selectedFrequency === WEEKLY;
        this.isRecurring = this.selectedFrequency !== ONE_TIME;
    }

    handleDaysOfWeekChange(event) {
        this.selectedDaysOfWeek = event.detail.length
            ? event.detail.map(selection => selection.value)
            : undefined;
    }

    handleSeriesEndsChange(event) {
        this.selectedSeriesEnds = event.detail.length ? event.detail[0].value : undefined;
        this.isEndsOn = this.selectedSeriesEnds === ON;
        this.isEndsAfter = this.selectedSeriesEnds === AFTER;
    }
}
