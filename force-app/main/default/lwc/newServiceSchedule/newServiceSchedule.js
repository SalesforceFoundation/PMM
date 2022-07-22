/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { LightningElement, api, track, wire } from "lwc";
import { format, formatTime } from "c/util";
import { getRecord } from "lightning/uiRecordApi";
import { loadStyle } from "lightning/platformResourceLoader";
import getDayNum from "@salesforce/apex/ServiceScheduleCreatorController.getDayNum";
import pmmFolder from "@salesforce/resourceUrl/pmm";
import TIME_ZONE from "@salesforce/i18n/timeZone";
import LOCALE from "@salesforce/i18n/locale";

import NO_END_LABEL from "@salesforce/label/c.Select_Service_Schedule_End_Date_Or_Service_Session_Number_Warning";
import START_BEFORE_END_LABEL from "@salesforce/label/c.End_Date_After_Start_Date";
import START_AFTER_LAST_SESSION_LABEL from "@salesforce/label/c.Start_Date_After_Last_Session";
import START_AFTER_TODAY_LABEL from "@salesforce/label/c.Start_Date_After_Today";
import DAY_REQUIRED_LABEL from "@salesforce/label/c.Day_Required_When_Weekly_Selected";
import DEFAULT_SERVICE_QUANTITY from "@salesforce/schema/ServiceSchedule__c.DefaultServiceQuantity__c";
import FREQUENCY from "@salesforce/schema/ServiceSchedule__c.Frequency__c";
import DAYS_OF_WEEK from "@salesforce/schema/ServiceSchedule__c.DaysOfWeek__c";
import SESSION_START from "@salesforce/schema/ServiceSession__c.SessionStart__c";
import SESSION_END from "@salesforce/schema/ServiceSession__c.SessionEnd__c";
import UNIT_MEASUREMENT_FIELD from "@salesforce/schema/Service__c.UnitOfMeasurement__c";
import EVERY_LABEL from "@salesforce/label/c.Every_Custom";
import DAY_LABEL from "@salesforce/label/c.Day";
import DAYS_LABEL from "@salesforce/label/c.Days";
import WEEK_LABEL from "@salesforce/label/c.Week";
import WEEKS_LABEL from "@salesforce/label/c.Weeks";
import MONTH_LABEL from "@salesforce/label/c.Month";
import MONTHS_LABEL from "@salesforce/label/c.Months";
import LAST_DAY_OF_MONTH_LABEL from "@salesforce/label/c.Last_Day_Of_Month";
import MONTHLY_ON_DAY_LABEL from "@salesforce/label/c.Monthly_On_Day";
import MONTHLY_ON_THE_LABEL from "@salesforce/label/c.Monthly_On_The";
import ADD_SESSIONS_MESSAGE from "@salesforce/label/c.Add_Sessions_Message";

const WEEKLY = "Weekly";
const MONTHLY = "Monthly";
const DAILY = "Daily";
const ONE_TIME = "One Time";
const ON = "On";
const AFTER = "After";
const LASTDAY = "LastDayOfMonth";

const LARGE_SIZE = 12;
const SMALL_SIZE = 6;
const DAYS = ["SU", "MO", "TU", "WE", "TH", "FR", "SA"];
const MULTI_SELECT_DELIM = ";";
const TIME = "TIME";

export default class NewServiceSchedule extends LightningElement {
    @api recordTypeId;
    @api serviceId;
    errorMessage;
    isValid = true;
    objectApiName;
    selectedMonthlyRecurrenceValue = "";
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
        monthlyOnDay: MONTHLY_ON_DAY_LABEL,
        monthlyOnThe: MONTHLY_ON_THE_LABEL,
        addSessionsMessage: ADD_SESSIONS_MESSAGE,
    };
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

    get editingExistingSchedule() {
        if (this._serviceScheduleModel.serviceSchedule.Id) {
            return true;
        }
        return false;
    }

    get useMinimumStartAfterLastSession() {
        if (
            this.editingExistingSchedule &&
            this._serviceScheduleModel.serviceSessions &&
            this._serviceScheduleModel.serviceSessions.length > 0
        ) {
            return true;
        }
        return false;
    }

    get minimumStartDate() {
        let minStartDatetime = new Date();
        if (this.useMinimumStartAfterLastSession) {
            let lastSession = this._serviceScheduleModel.serviceSessions.reduce(function(
                prev,
                curr
            ) {
                return prev[SESSION_END.fieldApiName] > curr[SESSION_END.fieldApiName]
                    ? prev
                    : curr;
            });
            // use the date values from session end in case session spans more than one calendar date
            minStartDatetime = new Date(lastSession[SESSION_END.fieldApiName]);
            minStartDatetime.setHours(
                new Date(lastSession[SESSION_START.fieldApiName]).getHours()
            );
            minStartDatetime.setMinutes(
                new Date(lastSession[SESSION_START.fieldApiName]).getMinutes()
            );
        }
        return minStartDatetime;
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
        this.picklistFields = {
            ...this._serviceScheduleModel.scheduleRecurrencePicklistFields,
        };
        this.fieldSet = this._serviceScheduleModel.scheduleInformationFields;

        // Write values from service schedule to local properties
        if (this.editingExistingSchedule) {
            if (this._serviceScheduleModel.serviceSchedule[FREQUENCY.fieldApiName]) {
                this.picklistFields.frequency.value = this._serviceScheduleModel.serviceSchedule[
                    FREQUENCY.fieldApiName
                ];
            }
            if (this._serviceScheduleModel.serviceSchedule[DAYS_OF_WEEK.fieldApiName]) {
                this.picklistFields.daysOfWeek.value = this._serviceScheduleModel.serviceSchedule[
                    DAYS_OF_WEEK.fieldApiName
                ];
                let selectedValues = this.picklistFields.daysOfWeek.picklistValues.filter(
                    option =>
                        this._serviceScheduleModel.serviceSchedule[
                            DAYS_OF_WEEK.fieldApiName
                        ]
                            .split(MULTI_SELECT_DELIM)
                            .includes(option.value)
                );
                selectedValues.forEach(element => {
                    element.isSelected = true;
                });
            }
        }

        this.processFields();

        this.isLoaded = true;
    }

    @api reportValidity() {
        let errMessages = [];
        let datesValid = true;
        let startDateAfterLastSession = true;
        let startDateAfterTodayWhenRequired = true;

        let isFormValid = [
            ...this.template.querySelectorAll("lightning-input-field"),
        ].reduce((validSoFar, inputField) => {
            return validSoFar && inputField.reportValidity();
        }, true);

        if (this.dateFields.start.value) {
            datesValid = this.dateFields.start.value < this.dateFields.end.value;
            if (this.useMinimumStartAfterLastSession) {
                startDateAfterLastSession =
                    new Date(this.dateFields.start.value) >
                    new Date(this.minimumStartDate);
            }
            if (this.editingExistingSchedule) {
                startDateAfterTodayWhenRequired =
                    new Date(this.dateFields.start.value) >= new Date();
            }
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

        if (!startDateAfterLastSession) {
            errMessages.push(
                format(START_AFTER_LAST_SESSION_LABEL, [
                    this.dateFields.start.label,
                    new Date(this.minimumStartDate).toDateString(),
                ])
            );
        }

        if (!startDateAfterTodayWhenRequired) {
            errMessages.push(
                format(START_AFTER_TODAY_LABEL, [this.dateFields.start.label])
            );
        }

        if (!hasEndCondition) {
            errMessages.push(NO_END_LABEL);
        }

        if (!hasDayOfWeek) {
            errMessages.push(DAY_REQUIRED_LABEL);
        }

        this.errorMessage = errMessages.join("\n");

        this.isValid =
            isFormValid &&
            datesValid &&
            startDateAfterLastSession &&
            startDateAfterTodayWhenRequired &&
            hasEndCondition &&
            hasDayOfWeek;

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
        if (this._serviceScheduleModel.serviceSchedule.Id) {
            serviceSchedule.Id = this._serviceScheduleModel.serviceSchedule.Id;
        }
        return serviceSchedule;
    }

    connectedCallback() {
        this.syncDefaultServiceQuantity();
        loadStyle(this, pmmFolder + "/hideHelpIcons.css");
    }

    syncDefaultServiceQuantity() {
        this.fieldSet.forEach(field => {
            if (field.apiName === DEFAULT_SERVICE_QUANTITY.fieldApiName && field.value) {
                this.defaultServiceQuantity = field.value;
            }
        });
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
                if (field.type === TIME && field.value !== null && field.value >= 0) {
                    field.value = formatTime(field.value);
                }

                return field;
            });

        this.fieldSet.forEach(field => {
            if (field.apiName === DEFAULT_SERVICE_QUANTITY.fieldApiName) {
                field.isQuantityField = true;
                this.defaultServiceQuantityLabel = field.label;
                this.defaultServiceQuantityLabelWithUnit = field.label;
            }
        });

        this.handleMonthlyRecurrenceOptions();
    }

    handleLoad() {
        if (this.dateFields.end.value && !this.editingExistingSchedule) {
            return;
        }

        this.template.querySelectorAll("lightning-input-field").forEach(field => {
            if (field.fieldName === this.dateFields.start.apiName) {
                let initialStartDate = new Date(field.value);
                if (this.editingExistingSchedule) {
                    let today = new Date();
                    initialStartDate.setMonth(today.getMonth());
                    initialStartDate.setDate(today.getDate());
                    initialStartDate.setFullYear(today.getFullYear());
                    if (this.isMonthly) {
                        this.handleMonthlyRecurrenceOptions(initialStartDate);
                    }
                }
                if (this.useMinimumStartAfterLastSession) {
                    let minimumStartDateValue = new Date(
                        Date.parse(this.minimumStartDate) + 86400 * 1000
                    );
                    initialStartDate =
                        initialStartDate > minimumStartDateValue
                            ? initialStartDate
                            : minimumStartDateValue;
                }

                this.setFirstSessionStartTimeAndEndTime(initialStartDate);
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

    handleServiceChange(event) {
        this.serviceId = event.detail.value.length ? event.detail.value[0] : undefined; // lookup values come back as arrays
        if (!this.serviceId) {
            this.defaultServiceQuantityLabelWithUnit = this.defaultServiceQuantityLabel;
        }
    }

    handleDefaultServiceQuantityChange(event) {
        this.defaultServiceQuantity = event.detail.value;
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

        if (!this.picklistFields.daysOfWeek.value) {
            await getDayNum({ fullDateTime: this.dateFields.start.value }).then(
                result => (this.picklistFields.daysOfWeek.value = result.toString())
            );
        }
    }

    handleDaysOfWeekChange(event) {
        this.picklistFields.daysOfWeek.value = event.detail.length
            ? event.detail.map(selection => selection.value).join(MULTI_SELECT_DELIM)
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
            this.setFirstSessionStartTimeAndEndTime(event.detail.value);
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

    async handleMonthlyRecurrenceOptions() {
        if (this.picklistFields.monthlyOption.value !== undefined) {
            this.selectedMonthlyRecurrenceValue = this.picklistFields.monthlyOption.value;
        }

        let sessionStartDay = new Date(this.dateFields.start.value).toLocaleString(
            LOCALE,
            {
                timeZone: TIME_ZONE,
                day: "numeric",
            }
        );

        let weekNum = this.handleGetWeekDay(sessionStartDay);
        let day;

        await getDayNum({ fullDateTime: this.dateFields.start.value }).then(result => {
            day = DAYS[result - 1]; //Weekdays are 1 index in apex
        });

        let monthlyOptionApiValue = weekNum + day;

        let monthlyOptionLabel = this.picklistFields.monthlyOption.picklistValues.find(
            option => option.value === monthlyOptionApiValue
        ).label;

        let options = [
            {
                label: format(this.labels.monthlyOnDay, [sessionStartDay]),
                value: "",
            },
            {
                label: monthlyOptionLabel,
                value: monthlyOptionApiValue,
            },
        ];

        if (sessionStartDay >= 28) {
            let startDate = new Date(this.dateFields.start.value);
            startDate.setDate(startDate.getDate() + 1);
            let nextDay = startDate.toLocaleString(LOCALE, {
                timeZone: TIME_ZONE,
                day: "numeric",
            });

            if (Number(nextDay) === 1) {
                options.push({
                    label: this.labels.lastDayOfMonth,
                    value: LASTDAY,
                });
            }
        }

        this.monthlyRecurrenceOptions = options;
    }

    handleGetWeekDay(sessionStartDay) {
        let weekNum;

        weekNum = Math.ceil(sessionStartDay / 7);

        return weekNum;
    }

    handleMonthlyRecurrenceOptionsChange(event) {
        this.selectedMonthlyRecurrenceValue = event.detail.value;
        if (event.detail.value !== "") {
            this.picklistFields.monthlyOption.value = this.selectedMonthlyRecurrenceValue;
        } else {
            this.picklistFields.monthlyOption.value = undefined;
        }
    }
}
