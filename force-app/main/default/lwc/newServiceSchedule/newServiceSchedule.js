import { LightningElement, api, wire } from "lwc";
import getFieldSet from "@salesforce/apex/FieldSetController.getFieldSetForLWC";

import SERVICE_SCHEDULE_OBJECT from "@salesforce/schema/ServiceSchedule__c";

import NAME_FIELD from "@salesforce/schema/ServiceSchedule__c.Name";
import FIRST_SESSION_START_FIELD from "@salesforce/schema/ServiceSchedule__c.FirstSessionStart__c";
import FIRST_SESSION_END_FIELD from "@salesforce/schema/ServiceSchedule__c.FirstSessionEnd__c";
import FREQUENCY_FIELD from "@salesforce/schema/ServiceSchedule__c.Frequency__c";
import DAYS_OF_WEEK_FIELD from "@salesforce/schema/ServiceSchedule__c.DaysOfWeek__c";
import END_DATE_FIELD from "@salesforce/schema/ServiceSchedule__c.EndDate__c";

import SERVICE_SCHEDULE_INFORMATION_LABEL from "@salesforce/label/c.Service_Schedule_Information";
import DATE_TIME_LABEL from "@salesforce/label/c.Service_Schedule_Date_Time";

const FIELD_SET_NAME = "ServiceScheduleInformation";
const WEEKLY = "Weekly";
const LARGE_SIZE = 12;
const SMALL_SIZE = 6;

export default class NewServiceSchedule extends LightningElement {
    @api serviceId;
    fieldSet;
    objectApiName;
    isWeekly = false;
    selectedFrequency;
    selectedDaysOfWeek;

    labels = {
        scheduleInformation: SERVICE_SCHEDULE_INFORMATION_LABEL,
        dateTime: DATE_TIME_LABEL,
    };

    sizes = {
        large: LARGE_SIZE,
        small: SMALL_SIZE,
    };

    fields = {
        start: FIRST_SESSION_START_FIELD.fieldApiName,
        end: FIRST_SESSION_END_FIELD.fieldApiName,
        frequency: FREQUENCY_FIELD.fieldApiName,
        daysOfWeek: DAYS_OF_WEEK_FIELD.fieldApiName,
        seriesEnd: END_DATE_FIELD.fieldApiName,
    };

    @wire(getFieldSet, {
        objectName: SERVICE_SCHEDULE_OBJECT.objectApiName,
        fieldSetName: FIELD_SET_NAME,
    })
    wiredFields({ error, data }) {
        if (data) {
            this.setFieldSet(data);
            this.objectApiName = SERVICE_SCHEDULE_OBJECT.objectApiName;
        } else if (error) {
            console.log(JSON.stringify(error));
        }
    }

    setFieldSet(data) {
        const recurranceFields = Object.values(this.fields);

        this.fieldSet = data
            .filter(obj => !recurranceFields.includes(obj.apiName))
            .map(obj => {
                let field = { ...obj };
                field.size =
                    obj.apiName === NAME_FIELD.fieldApiName ? LARGE_SIZE : SMALL_SIZE;
                return field;
            });
    }

    handleFrequencyChange(event) {
        if (!event || !event.detail) {
            return;
        }

        this.selectedFrequency = event.detail.length ? event.detail[0].name : undefined;
        this.isWeekly = this.selectedFrequency === WEEKLY;
    }

    handleDaysOfWeekChange(event) {
        if (!event || !event.detail) {
            return;
        }

        this.selectedDaysOfWeek = event.detail.length
            ? event.detail.map(selection => selection.name)
            : undefined;
    }
}
