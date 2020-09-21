import { LightningElement, api, track } from "lwc";

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
        return [...this.template.querySelectorAll("lightning-input-field")].reduce(
            (validSoFar, inputField) => {
                return validSoFar && inputField.reportValidity();
            },
            true
        );
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
}
