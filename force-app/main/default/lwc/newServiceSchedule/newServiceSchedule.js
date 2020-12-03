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
import { loadStyle } from "lightning/platformResourceLoader";
import getDayNum from "@salesforce/apex/ServiceScheduleCreatorController.getDayNum";
import pmmFolder from "@salesforce/resourceUrl/pmm";
import TIME_ZONE from "@salesforce/i18n/timeZone";
import LOCALE from "@salesforce/i18n/locale";

import NO_END_LABEL from "@salesforce/label/c.Select_Service_Schedule_End_Date_Or_Service_Session_Number_Warning";
import START_BEFORE_END_LABEL from "@salesforce/label/c.End_Date_After_Start_Date";
import DAY_REQUIRED_LABEL from "@salesforce/label/c.Day_Required_When_Weekly_Selected";
import EVERY_LABEL from "@salesforce/label/c.Every_Custom";
import DAY_LABEL from "@salesforce/label/c.Day";
import DAYS_LABEL from "@salesforce/label/c.Days";
import WEEK_LABEL from "@salesforce/label/c.Week";
import WEEKS_LABEL from "@salesforce/label/c.Weeks";
import MONTH_LABEL from "@salesforce/label/c.Month";
import MONTHS_LABEL from "@salesforce/label/c.Months";
import WEEK_ORDINAL_OF_MONTH_LABEL from "@salesforce/label/c.Week_Ordinal_Of_Month";
import LAST_DAY_OF_MONTH_LABEL from "@salesforce/label/c.Last_Day_Of_Month";
import MONTHLY_OF_DAY_LABEL from "@salesforce/label/c.Monthly_Of_Day";
import MONTHLY_ON_THE_LABEL from "@salesforce/label/c.Monthly_On_The";

const WEEKLY = "Weekly";
const MONTHLY = "Monthly";
const DAILY = "Daily";
const ONE_TIME = "One Time";
const ON = "On";
const AFTER = "After";
const BYWEEKDAY = "byWeekDay";
const BYMONTHDAY = "byMonthDay";
const LASTDAY = "lastDay";

const LARGE_SIZE = 12;
const SMALL_SIZE = 6;

export default class NewServiceSchedule extends LightningElement {
    @api recordTypeId;
    errorMessage;
    isValid = true;
    objectApiName;
    selectedMonthlyRecurrenceValue;
    sessionStartWeek;
    sessionStartDayOfWeek;
    sessionStartDay;
    @track monthlyRecurrenceOptions = [];

    @track labels = {
        day: DAY_LABEL,
        days: DAYS_LABEL,
        week: WEEK_LABEL,
        weeks: WEEKS_LABEL,
        month: MONTH_LABEL,
        months: MONTHS_LABEL,
        every: EVERY_LABEL,
        lastDayOfMonth: LAST_DAY_OF_MONTH_LABEL,
        monthlyOfDay: MONTHLY_OF_DAY_LABEL,
        monthlyOnThe: MONTHLY_ON_THE_LABEL,
        weekOrdinal: WEEK_ORDINAL_OF_MONTH_LABEL,
    };
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
    duration = 3600000; // milliseconds, defaults to 1 hour

    @api
    get serviceScheduleModel() {
        return this._serviceScheduleModel;
    }

    set serviceScheduleModel(value) {
        // This is a nested object so the inner objects are still read only when using spread alone
        this._serviceScheduleModel = JSON.parse(JSON.stringify(value));

        this.labels = {
            ...this.labels,
            ...this._serviceScheduleModel.labels.serviceSchedule,
        };
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

        return serviceSchedule;
    }

    connectedCallback() {
        loadStyle(this, pmmFolder + "/hideHelpIcons.css");
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
                this.setFirstSessionStartTimeAndEndTime(field.value);
            }
        });

        this.defaultDayOfWeek();
    }

    get isWeekly() {
        return this.picklistFields.frequency.value === WEEKLY;
    }

    get isMonthly() {
        return this.picklistFields.frequency.value === MONTHLY;
    }

    get isDaily() {
        return this.picklistFields.frequency.value === DAILY;
    }

    get isOneTime() {
        return this.picklistFields.frequency.value === ONE_TIME;
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

    get units() {
        let interval = this.dateFields.interval.value;
        if (this.isDaily) {
            return interval > 1 ? this.labels.days : this.labels.day;
        } else if (this.isWeekly) {
            return interval > 1 ? this.labels.weeks : this.labels.week;
        } else if (this.isMonthly) {
            return interval > 1 ? this.labels.months : this.labels.month;
        }

        return "";
    }

    handleIntervalChange(event) {
        this.dateFields.interval.value = event.detail.value ? event.detail.value : 1;
    }

    handleFrequencyChange(event) {
        this.picklistFields.frequency.value = event.detail.length
            ? event.detail[0].value
            : undefined;

        this.defaultDayOfWeek();
        if (this.isOneTime) {
            this.dateFields.interval.value = 1;
        }

        if (event.detail[0].value === MONTHLY) {
            this.handleMonthlyRecurrenceOptions();
        }
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

        if (this.picklistFields.frequency.value === MONTHLY) {
            this.handleMonthlyRecurrenceOptions();
        }
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

    handleMonthlyRecurrenceOptions() {
        let sessionStartDay = new Date(this.dateFields.start.value).toLocaleString(
            LOCALE,
            {
                timeZone: TIME_ZONE,
                day: "numeric",
            }
        );

        this.selectedMonthlyRecurrenceValue = BYWEEKDAY;

        this.handleGetWeekDay(sessionStartDay);

        this.monthlyRecurrenceOptions = [
            {
                label: format(this.labels.monthlyOfDay, [sessionStartDay]),
                value: BYWEEKDAY,
            },
            {
                label: this.sessionStartDay,
                value: BYMONTHDAY,
            },
        ];

        if (sessionStartDay >= 28) {
            this.monthlyRecurrenceOptions.push({
                label: this.labels.lastDayOfMonth,
                value: LASTDAY,
            });
        }
    }

    handleGetWeekDay(sessionStartDay) {
        let sessionStartDateDiff = sessionStartDay - 7;
        let weekOrdinal = this.labels.weekOrdinal.split(",");

        if (sessionStartDateDiff <= 0) {
            this.handleDayOfWeek(weekOrdinal[0]);
        } else if (sessionStartDateDiff >= 1 && sessionStartDateDiff < 7) {
            this.handleDayOfWeek(weekOrdinal[1]);
        } else if (sessionStartDateDiff >= 7 && sessionStartDateDiff < 15) {
            this.handleDayOfWeek(weekOrdinal[2]);
        } else if (sessionStartDateDiff >= 15 && sessionStartDateDiff < 21) {
            this.handleDayOfWeek(weekOrdinal[3]);
        } else if (sessionStartDateDiff >= 21) {
            this.handleDayOfWeek(weekOrdinal[4]);
        }
    }

    handleDayOfWeek(dayOfWeek) {
        let sessionDay = new Date(this.dateFields.start.value).toLocaleString(LOCALE, {
            timeZone: TIME_ZONE,
            weekday: "long",
        });

        this.sessionStartDay = format(this.labels.monthlyOnThe, [dayOfWeek, sessionDay]);
    }
}
