/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { LightningElement, api, track, wire } from "lwc";
import { format } from "c/util";
import { getRecord } from "lightning/uiRecordApi";
import getDayNum from "@salesforce/apex/ServiceScheduleCreatorController.getDayNum";

import NO_END_LABEL from "@salesforce/label/c.Select_Service_Schedule_End_Date_Or_Service_Session_Number_Warning";
import START_BEFORE_END_LABEL from "@salesforce/label/c.End_Date_After_Start_Date";
import DAY_REQUIRED_LABEL from "@salesforce/label/c.Day_Required_When_Weekly_Selected";
import DEFAULT_SERVICE_QUANTITY from "@salesforce/schema/ServiceSchedule__c.DefaultServiceQuantity__c";
import UNIT_MEASUREMENT_FIELD from "@salesforce/schema/Service__c.UnitOfMeasurement__c";

const WEEKLY = "Weekly";
const ONE_TIME = "One Time";
const ON = "On";
const AFTER = "After";
const LARGE_SIZE = 12;
const SMALL_SIZE = 6;

export default class NewServiceSchedule extends LightningElement {
    @api recordTypeId;
    @api serviceId;
    errorMessage;
    isValid = true;
    objectApiName;
    labels;
    sizes = {
        large: LARGE_SIZE,
        small: SMALL_SIZE,
    };

    _serviceScheduleModel;
    @track picklistFields;
    @track requiredFields;
    @track dateFields;
    fieldSet;
    isLoaded = false;
    duration = 3600000; // milliseconds, defaults to 1 hour
    defaultServiceQuantity;
    defaultServiceQuantityLabel;
    defaultServiceQuantityLabelWithUnit;

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

        if (!this.isValid) {
            let layout = this.template.querySelector("lightning-layout");
            layout.scrollIntoView({ behavior: "smooth", block: "start" });
        }

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

        if (this.defaultServiceQuantity) {
            serviceSchedule[
                DEFAULT_SERVICE_QUANTITY.fieldApiName
            ] = this.defaultServiceQuantity;
        }

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

        this.fieldSet.forEach(field => {
            if (field.apiName === DEFAULT_SERVICE_QUANTITY.fieldApiName) {
                field.isQuantityField = true;
                this.defaultServiceQuantityLabel = field.label;
                this.defaultServiceQuantityLabelWithUnit = field.label;
            }
        });
    }

    handleLoad() {
        if (this.dateFields.end.value) {
            return;
        }

        this.template.querySelectorAll("lightning-input-field").forEach(field => {
            if (field.fieldName === this.dateFields.start.apiName) {
                this.setFirstSessionStartTimeAndEndTime(field.value);
            }
        });

        this.defaultDayOfWeek();
    }

    @wire(getRecord, {
        recordId: "$serviceId",
        fields: [UNIT_MEASUREMENT_FIELD],
    })
    wiredSession(result) {
        if (
            result.data &&
            result.data.fields &&
            result.data.fields[UNIT_MEASUREMENT_FIELD.fieldApiName] &&
            result.data.fields[UNIT_MEASUREMENT_FIELD.fieldApiName].value
        ) {
            this.defaultServiceQuantityLabelWithUnit =
                this.defaultServiceQuantityLabel +
                " (" +
                result.data.fields[UNIT_MEASUREMENT_FIELD.fieldApiName].value +
                ")";
        }
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

    handleServiceChange(event) {
        this.serviceId = event.detail.value.length ? event.detail.value[0] : undefined; // lookup values come back as arrays
        if (!this.serviceId) {
            this.defaultServiceQuantityLabelWithUnit = this.defaultServiceQuantityLabel;
        }
    }

    handleDefaultServiceQuantityChange(event) {
        this.defaultServiceQuantity = event.detail.value;
    }

    handleFrequencyChange(event) {
        this.picklistFields.frequency.value = event.detail.length
            ? event.detail[0].value
            : undefined;

        this.defaultDayOfWeek();
    }

    async defaultDayOfWeek() {
        if (!(this.isWeekly && this.dateFields.start.value)) {
            this.picklistFields.daysOfWeek.value = undefined;

            return;
        }

        await getDayNum({ fullDateTime: this.dateFields.start.value }).then(
            result => (this.picklistFields.daysOfWeek.value = result.toString())
        );
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
        } else {
            this.dateFields.start.value = event.detail.value;
            this.setFirstSessionStartTimeAndEndTime(this.dateFields.start.value);
        }
        this.defaultDayOfWeek();
    }

    handleEndChange(event) {
        this.dateFields.end.value = event.detail.value;
        let startTime = new Date(this.dateFields.start.value);
        let endTime = new Date(this.dateFields.end.value);
        this.duration = endTime.getTime() - startTime.getTime();
    }

    setFirstSessionStartTimeAndEndTime(startDate) {
        if (!startDate) {
            return;
        }

        let startTime = new Date(startDate);
        let endTime = new Date(startTime.getTime() + this.duration);
        this.dateFields.start.value = new Date(startTime).toISOString();
        this.dateFields.end.value = new Date(endTime).toISOString();
    }

    get disableSessionEnd() {
        return !this.dateFields.start.value;
    }

    validateServiceScheduleOnOrAfter() {
        let noError = true;
        if (this.picklistFields.frequency.value === ONE_TIME) {
            return noError;
        }

        let seriesEndsOnElement = this.template.querySelector(
            '[data-element="seriesEndsOn"]'
        );

        let numberOfSessionsElement = this.template.querySelector(
            '[data-element="numberOfSessions"]'
        );

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
