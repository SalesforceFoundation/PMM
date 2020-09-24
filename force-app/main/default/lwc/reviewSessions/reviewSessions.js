import { LightningElement, track, api } from "lwc";
import processSchedule from "@salesforce/apex/ServiceScheduleCreatorController.processSchedule";
import TOTAL_SESSIONS_LABEL from "@salesforce/label/c.Total_Sessions";
import ADD_RECORD_LABEL from "@salesforce/label/c.Add_Record";
import REVIEW_RECORDS from "@salesforce/label/c.Review_Records";
import TIME_ZONE from "@salesforce/i18n/timeZone";

export default class ReviewSessions extends LightningElement {
    @track columns = [];
    @track objectName;
    _serviceScheduleModel;

    @api sessionNameLabel;
    @api sessionStartLabel;
    @api sessionEndLabel;

    @track _serviceSessions = [];

    @api
    get serviceScheduleModel() {
        return this._serviceScheduleModel;
    }
    set serviceScheduleModel(value) {
        // This is a nested object so the inner objects are still read only when using spread alone
        this._serviceScheduleModel = JSON.parse(JSON.stringify(value));
        this.setLabels();
        this.setDataTableColumns();

        this._serviceSessions = [...this._serviceScheduleModel.serviceSessions];

        if (!this._serviceSessions.length) {
            this.getSessions();
        }
    }

    @api
    get serviceSessions() {
        return this._serviceSessions;
    }

    @api
    get serviceSchedule() {
        return this._serviceScheduleModel.serviceSchedule;
    }

    labels = {
        totalSessions: TOTAL_SESSIONS_LABEL,
        addSession: ADD_RECORD_LABEL,
        reviewSessions: REVIEW_RECORDS,
    };

    getSessions() {
        processSchedule({ model: this._serviceScheduleModel })
            .then(result => {
                this._serviceScheduleModel = JSON.parse(JSON.stringify(result));
                this._serviceSessions = this._serviceScheduleModel.serviceSessions;
            })
            .catch(error => {
                // TODO: throw error
                console.log(JSON.stringify(error));
            });
    }

    get totalServiceSessions() {
        return this.labels.totalSessions + ": " + this._serviceSessions.length;
    }

    setLabels() {
        this.objectName = this._serviceScheduleModel.labels.serviceSession.objectPluralLabel;
        this.labels.addSession = this._serviceScheduleModel.labels.serviceSession.addSession;
        this.labels.reviewSessions = this._serviceScheduleModel.labels.serviceSession.reviewSessions;
        this.sessionNameLabel = this._serviceScheduleModel.sessionFields.name.label;
        this.sessionStartLabel = this._serviceScheduleModel.sessionFields.sessionStart.label;
        this.sessionEndLabel = this._serviceScheduleModel.sessionFields.sessionEnd.label;
    }

    setDataTableColumns() {
        const COLUMNS = [
            {
                label: this.sessionNameLabel,
                fieldName: this._serviceScheduleModel.sessionFields.name.apiName,
                hideDefaultActions: true,
            },
            {
                label: this.sessionStartLabel,
                fieldName: this._serviceScheduleModel.sessionFields.sessionStart.apiName,
                hideDefaultActions: true,
                type: "date",
                typeAttributes: {
                    year: "numeric",
                    month: "short",
                    day: "2-digit",
                    hour: "numeric",
                    minute: "numeric",
                    weekday: "long",
                    timeZoneName: "short",
                    timeZone: TIME_ZONE,
                },
            },
            {
                label: this.sessionEndLabel,
                fieldName: this._serviceScheduleModel.sessionFields.sessionEnd.apiName,
                hideDefaultActions: true,
                type: "date",
                typeAttributes: {
                    year: "numeric",
                    month: "short",
                    day: "2-digit",
                    hour: "numeric",
                    minute: "numeric",
                    weekday: "long",
                    timeZoneName: "short",
                    timeZone: TIME_ZONE,
                },
            },
            {
                label: "",
                name: "delete",
                type: "button-icon",
                hideDefaultActions: true,
                typeAttributes: {
                    iconName: "utility:clear",
                    variant: "bare",
                    iconPosition: "left",
                    disabled: false,
                },
            },
        ];

        this.columns = COLUMNS;
    }

    // handleAddRows() {
    //     const dataId = createUUID();
    //     this._serviceScheduleModel.serviceSessions.push({
    //         id: dataId,
    //         Name: "",
    //         SessionStart__c: "",
    //         startTime: "",
    //         endTime: "",
    //     });

    //     this._serviceScheduleModel.serviceSessions = this._serviceScheduleModel.serviceSessions.slice(0);
    // }

    handleDelete(event) {
        this._serviceSessions = this.serviceSessions.filter(session =>
            Object.values(this._serviceScheduleModel.sessionFields).reduce(
                (matchesSoFar, field) =>
                    matchesSoFar &&
                    ((!session[field.apiName] && !event.detail.row[field.apiName]) ||
                        session[field.apiName] !== event.detail.row[field.apiName]),
                true
            )
        );
    }
}
