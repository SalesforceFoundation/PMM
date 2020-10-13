/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { LightningElement, api, track } from "lwc";
import { format } from "c/util";

const WEEKLY = "Weekly";
const ONE_TIME = "One Time";
const ON = "On";
const AFTER = "After";
const LARGE_SIZE = 12;
const SMALL_SIZE = 6;

import NO_END_LABEL from "@salesforce/label/c.Select_Service_Schedule_End_Date_Or_Service_Session_Number_Warning";
import START_BEFORE_END_LABEL from "@salesforce/label/c.End_Date_After_Start_Date";
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
        let datesValid = true;

        let isFormValid = [
            ...this.template.querySelectorAll("lightning-input-field"),
        ].reduce((validSoFar, inputField) => {
            return validSoFar && inputField.reportValidity();
        }, true);

        if (this.dateFields.start.value) {
            datesValid = this.dateFields.start.value < this.dateFields.end.value;
        }

        let hasEndCondition = this.validateServiceScheduleOnOrAfter();

        let hasDayOfWeek =
            this.picklistFields.frequency.value === WEEKLY
                ? this.picklistFields.daysOfWeek.value
                : true;

        // input-fields handle their own error display, so no additional error message needed for !isFormValid
        if (!datesValid) {
            errMessages.push(
                format(START_BEFORE_END_LABEL, [
                    this.dateFields.start.label,
                    this.dateFields.end.label,
                ])
            );
        }

        if (!hasEndCondition) {
            errMessages.push(NO_END_LABEL);
        }

        if (!hasDayOfWeek) {
            errMessages.push(DAY_REQUIRED_LABEL);
        }

        this.errorMessage = errMessages.join("\n");

        this.isValid = isFormValid && datesValid && hasEndCondition && hasDayOfWeek;

        return this.isValid;
    }

    @api
    get serviceSchedule() {
        let serviceSchedule = {};

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

    handleLoad() {
        if (this.dateFields.end.value) {
            return;
        }

        this.template.querySelectorAll("lightning-input-field").forEach(field => {
            if (field.fieldName === this.dateFields.start.apiName) {
                if (!this.dateFields.end.value) {
                    this.setFirstSessionStartTimeAndEndTime(field.value);
                }
            }
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
        this.handleSeriesEndsOnNumberOfSessionsChange(
            this.picklistFields.seriesEnds.value
        );
    }

    handleStartChange(event) {
        if (!event.detail.value) {
            this.dateFields.end.value = null;
            return;
        }
        this.dateFields.start.value = event.detail.value;

        this.setFirstSessionStartTimeAndEndTime(this.dateFields.start.value);
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

    setFirstSessionStartTimeAndEndTime(startDate) {
        if (!startDate) {
            return;
        }

        let startTime = new Date(startDate);
        let endTime = new Date(startDate);

        this.dateFields.start.value = new Date(startTime).toISOString();
        endTime.setHours(startTime.getHours() + this.duration);
        endTime.setMinutes(startTime.getMinutes() + (this.duration % 1) * 60);
        this.dateFields.end.value = new Date(endTime).toISOString();
    }

    get disableSessionEnd() {
        return !this.dateFields.start.value;
    }

    validateServiceScheduleOnOrAfter() {
        let noError = true;
        let seriesEndsOnElement = this.template.querySelector(
            '[data-element="seriesEndsOn"]'
        );

        let numberOfSessionsElement = this.template.querySelector(
            '[data-element="numberOfSessions"]'
        );

        if (this.picklistFields.frequency.value === ONE_TIME) {
            return noError;
        }

        noError =
            (seriesEndsOnElement === null || !seriesEndsOnElement.value) &&
            (numberOfSessionsElement === null || !numberOfSessionsElement.value)
                ? false
                : true;

        return noError;
    }

    handleSeriesEndsOnNumberOfSessionsChange(seriesEndsOn) {
        if (
            !this._serviceScheduleModel.scheduleRecurrenceDateFields.numberOfSessions
                .value &&
            !this._serviceScheduleModel.scheduleRecurrenceDateFields.seriesEndsOn.value
        ) {
            return;
        }

        if (seriesEndsOn === ON) {
            this._serviceScheduleModel.scheduleRecurrenceDateFields.numberOfSessions.value =
                "";
        }

        if (seriesEndsOn === AFTER) {
            this._serviceScheduleModel.scheduleRecurrenceDateFields.seriesEndsOn.value =
                "";
        }
    }
}
