import { LightningElement, api, track } from "lwc";

const WEEKLY = "Weekly";
const ONE_TIME = "One Time";
const ON = "On";
const AFTER = "After";
const LARGE_SIZE = 12;
const SMALL_SIZE = 6;

import NO_END_LABEL from "@salesforce/label/c.Select_Service_Schedule_End_Date_Or_Service_Session_Number_Warning";
import START_BEFORE_END_LABEL from "@salesforce/label/c.First_Session_End_After_Start";
import DAY_REQUIRED_LABEL from "@salesforce/label/c.Day_Required_When_Weekly_Selected";

export default class NewServiceSchedule extends LightningElement {
    @api recordTypeId;
    errorMessage;
    isValid = true;
    objectApiName;
    labels;
    sizes = {
        large: LARGE_SIZE,
        small: SMALL_SIZE,
    };

    _serviceScheduleModel;
    @track
    picklistFields;
    @track
    requiredFields;
    @track
    dateFields;
    fieldSet;
    isLoaded = false;
    duration = 1;

    @api
    get serviceScheduleModel() {
        return this._serviceScheduleModel;
    }

    set serviceScheduleModel(value) {
        this.isLoaded = false;
        // This is a nested object so the inner objects are still read only when using spread alone
        this._serviceScheduleModel = JSON.parse(JSON.stringify(value));

        this.labels = this._serviceScheduleModel.labels.serviceSchedule;
        this.objectApiName = this._serviceScheduleModel.labels.serviceSchedule.objectApiName;
        this.requiredFields = this._serviceScheduleModel.scheduleRequiredFields;
        this.dateFields = this._serviceScheduleModel.scheduleRecurrenceDateFields;
        this.picklistFields = this._serviceScheduleModel.scheduleRecurrencePicklistFields;
        this.fieldSet = this._serviceScheduleModel.scheduleInformationFields;

        this.processFields();
        this.isLoaded = true;
    }

    @api reportValidity() {
        let errMessages = [];

        let isFormValid = [
            ...this.template.querySelectorAll("lightning-input-field"),
        ].reduce((validSoFar, inputField) => {
            return validSoFar && inputField.reportValidity();
        }, true);

        console.log(this.dateFields.start.value);
        console.log(this.dateFields.end.value);
        let datesValid = this.dateFields.start.value < this.dateFields.end.value;
        console.log(datesValid);
        // todo: figure out how to clean this up. falsy wasn't working as expected.
        let hasEndCondition =
            (this.dateFields.numberOfSessions !== undefined &&
                this.dateFields.numberOfSessions.value !== undefined) ||
            (this.dateFields.seriesEndsOn !== undefined &&
                this.dateFields.seriesEndsOn.value !== undefined);
        console.log(hasEndCondition);
        console.log(JSON.stringify(this.picklistFields.daysOfWeek));
        let hasDayOfWeek =
            this.picklistFields.frequency.value === WEEKLY
                ? this.picklistFields.daysOfWeek.value
                : true;
        console.log(hasDayOfWeek);

        // input-fields handle their own error display, so no additional error message needed for !isFormValid
        if (!datesValid) {
            errMessages.push(START_BEFORE_END_LABEL);
        }
        if (!hasEndCondition) {
            errMessages.push(NO_END_LABEL);
        }
        if (!hasDayOfWeek) {
            errMessages.push(DAY_REQUIRED_LABEL);
        }

        this.errorMessage = errMessages.join("\n"); // this should inject a line break but it doesn't seem to be working.
        console.log(this.errorMessage);

        this.isValid = isFormValid && datesValid && hasEndCondition && hasDayOfWeek;

        return this.isValid;
    }

    @api
    get serviceSchedule() {
        let serviceSchedule = this._serviceScheduleModel.serviceSchedule;

        [...this.template.querySelectorAll("lightning-input-field")].forEach(field => {
            serviceSchedule[field.fieldName] = field.value;
        });

        Object.keys(this.picklistFields).forEach(field => {
            const apiName = this.picklistFields[field].apiName;
            const value = this.picklistFields[field].value;

            serviceSchedule[apiName] = value;
        });

        return serviceSchedule;
    }

    processFields() {
        let fieldsToSkip = [];
        let self = this;
        let updateValue = function(field) {
            field.value = self._serviceScheduleModel.serviceSchedule[field.apiName];
            fieldsToSkip.push(field.apiName);
        };

        Object.values(this.dateFields).forEach(field => updateValue(field));
        Object.values(this.picklistFields).forEach(field => updateValue(field));
        Object.values(this.requiredFields).forEach(field => updateValue(field));

        this.fieldSet = this.fieldSet
            .filter(member => !fieldsToSkip.includes(member.apiName))
            .map(member => {
                let field = { ...member };
                field.size = SMALL_SIZE;
                field.value = this._serviceScheduleModel.serviceSchedule[field.apiName];
                return field;
            });
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

    handleFrequencyChange(event) {
        this.picklistFields.frequency.value = event.detail.length
            ? event.detail[0].value
            : undefined;
    }

    handleDaysOfWeekChange(event) {
        this.picklistFields.daysOfWeek.value = event.detail.length
            ? event.detail.map(selection => selection.value).join(";")
            : undefined;
    }

    handleSeriesEndsChange(event) {
        this.picklistFields.seriesEnds.value = event.detail.length
            ? event.detail[0].value
            : undefined;
    }

    handleStartChange(event) {
        if (!event.detail.value) {
            this.dateFields.end.value = null;
            return;
        }
        this.dateFields.start.value = event.detail.value;
        let startTime = new Date(event.detail.value);
        let endTime = new Date(event.detail.value);
        endTime.setHours(startTime.getHours() + this.duration);
        endTime.setMinutes(startTime.getMinutes() + (this.duration % 1) * 60);
        this.dateFields.end.value = new Date(endTime).toISOString();
    }

    handleEndChange(event) {
        this.dateFields.end.value = event.detail.value;
        let startTime = new Date(this.dateFields.start.value);
        let endTime = new Date(event.detail.value);
        this.duration =
            endTime.getHours() -
            startTime.getHours() +
            (endTime.getMinutes() - startTime.getMinutes()) / 60;
    }

    get disableSessionEnd() {
        return !this.dateFields.start.value;
    }
}
