import { LightningElement, api, track } from "lwc";

const WEEKLY = "Weekly";
const ONE_TIME = "OneTime";
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

        let datesValid = this.dateFields.start.value < this.dateFields.end.value;

        let hasEndCondition = this.validateServiceScheduleOnOrAfter();

        let hasDayOfWeek =
            this.picklistFields.frequency.value === WEEKLY
                ? this.picklistFields.daysOfWeek.value
                : true;

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

        this.isValid = isFormValid && datesValid && hasEndCondition && hasDayOfWeek;

        return this.isValid;
    }

    validateServiceScheduleOnOrAfter() {
        let noError = true;

        this.template.querySelectorAll("lightning-input-field").forEach(field => {
            if (this.picklistFields.frequency.value !== ONE_TIME) {
                if (
                    field.fieldName === this.dateFields.seriesEndsOn.apiName ||
                    field.fieldName === this.dateFields.numberOfSessions.apiName
                ) {
                    if (field.value === undefined || field.value === null) {
                        noError = false;
                    }
                }
            }
        });

        this.template.querySelectorAll(" c-picklist").forEach(field => {
            if (this.picklistFields.frequency.value !== ONE_TIME) {
                if (field.fieldName === this.dateFields.seriesEnds) {
                    if (field.value === undefined || field.value === null) {
                        noError = false;
                    }
                }
            }
        });
        return noError;
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

        this.setDefaults();
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
        this.setDayofTheWeekDefault();
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
        this.setStartTimeAndEndTime(this.dateFields.start.value);
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

    setStartTimeAndEndTime(startDate) {
        let startTime = new Date(startDate);
        let endTime = new Date(startDate);

        //Below we are setting the startTime to the top of the hour
        startTime.setMinutes(startTime.getMinutes() + (60 - startTime.getMinutes()));
        this.dateFields.start.value = new Date(startTime).toISOString();

        endTime.setHours(startTime.getHours() + this.duration);
        endTime.setMinutes(startTime.getMinutes() + (this.duration % 1) * 60);
        this.dateFields.end.value = new Date(endTime).toISOString();
    }

    setDefaults() {
        if (!this.dateFields.start.defaultValueFormula) {
            return;
        }

        if (this.dateFields.start.defaultValueFormula === "NOW()") {
            this.dateFields.start.value = new Date(Date.now()).toISOString();
        } else {
            this.dateFields.start.value = new Date(
                this.dateFields.start.defaultValueFormula.toISOString()
            );
        }
        this.setStartTimeAndEndTime(this.dateFields.start.value);
    }

    get disableSessionEnd() {
        return !this.dateFields.start.value;
    }

    setDayofTheWeekDefault() {
        if (!this.picklistFields.frequency === WEEKLY) {
            return;
        }

        let startDateDayValue = new Date(this.dateFields.start.value).getUTCDay();

        this.picklistFields.daysOfWeek.picklistValues.forEach(field => {
            if (Number(field.value) === startDateDayValue) {
                field.defaultValue = true;
            } else {
                field.defaultValue = false;
            }
        });
    }
}
