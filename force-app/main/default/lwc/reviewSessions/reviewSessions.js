import { LightningElement, track, wire, api } from "lwc";
import { getObjectInfo } from "lightning/uiObjectInfoApi";
import getSessions from "@salesforce/apex/ServiceScheduleCreatorController.getSessions";
import TOTAL_SESSIONS_LABEL from "@salesforce/label/c.Total_Sessions";
import ADD_RECORD_LABEL from "@salesforce/label/c.Add_Record";
import START_TIME_LABEL from "@salesforce/label/c.Start_Time";
import END_TIME_LABEL from "@salesforce/label/c.End_Time";
import REVIEW_RECORDS from "@salesforce/label/c.Review_Records";

import SERVICE_SESSION_OBJECT from "@salesforce/schema/ServiceSession__c";
import SESSION_NAME_FIELD from "@salesforce/schema/ServiceSession__c.Name";
import SESSION_START_FIELD from "@salesforce/schema/ServiceSession__c.SessionStart__c";
import SESSION_END_FIELD from "@salesforce/schema/ServiceSession__c.SessionEnd__c";

export default class ReviewSessions extends LightningElement {
    @track columns = [];
    @track objectName;
    _serviceScheduleModel;

    @api sessionNameLabel;
    @api sessionStartLabel;
    @api sessionEndLabel;

    @api
    get serviceScheduleModel() {
        return this._serviceScheduleModel;
    }
    set serviceScheduleModel(value) {
        // This is a nested object so the inner objects are still read only when using spread alone
        this._serviceScheduleModel = JSON.parse(JSON.stringify(value));
        this.labels = Object.assign(
            {},
            this.labels,
            this._serviceScheduleModel.labels.serviceSession
        );
        this.getSessions();
    }

    @api
    get serviceSessions() {
        return this._serviceScheduleModel.serviceSessions;
    }

    labels = {
        totalSessions: TOTAL_SESSIONS_LABEL,
        addSession: ADD_RECORD_LABEL,
        reviewSessions: REVIEW_RECORDS,
        startTime: START_TIME_LABEL,
        endTime: END_TIME_LABEL,
    };

    getSessions() {
        getSessions({ schedule: this._serviceScheduleModel.serviceSchedule })
            .then(result => {
                this._serviceScheduleModel.serviceSessions = [...result];
            })
            .catch(error => {
                // TODO: throw error
                console.log(JSON.stringify(error));
            });
    }

    @wire(getObjectInfo, { objectApiName: SERVICE_SESSION_OBJECT })
    wireSession(result) {
        if (!result) {
            return;
        }

        if (result.data) {
            this.setDataTableColumns(result.data);
        }
    }

    get totalServiceSessions() {
        return (
            this.labels.totalSessions +
            ": " +
            this._serviceScheduleModel.serviceSessions.length
        );
    }

    setLabels(data) {
        this.objectName = this.serviceScheduleModel.labels.serviceSession.objectPluralLabel;
        this.labels.addSession = this._serviceScheduleModel.labels.serviceSession.addSession;
        this.labels.reviewSessions = this._serviceScheduleModel.labels.serviceSession.reviewSessions;

        // Below lines of code sets the labels so these could be used while
        // setting the columns on the datatable
        Object.values(data.fields).forEach(element => {
            if (element.apiName === SESSION_NAME_FIELD.fieldApiName) {
                this.sessionNameLabel = element.label;
            }
            if (element.apiName === SESSION_START_FIELD.fieldApiName) {
                this.sessionStartLabel = element.label;
            }
            if (element.apiName === SESSION_END_FIELD.fieldApiName) {
                this.sessionEndLabel = element.label;
            }
        });
    }

    setDataTableColumns() {
        const COLUMNS = [
            {
                label: this.sessionNameLabel,
                fieldName: SESSION_NAME_FIELD.fieldApiName,
                hideDefaultActions: true,
            },
            {
                label: this.sessionStartLabel,
                fieldName: SESSION_START_FIELD.fieldApiName,
                hideDefaultActions: true,
                type: "date",
                typeAttributes: {
                    year: "numeric",
                    month: "short",
                    day: "2-digit",
                    hour: "numeric",
                    minute: "numeric",
                    weekday: "long",
                },
            },
            {
                label: this.sessionEndLabel,
                fieldName: SESSION_END_FIELD.fieldApiName,
                hideDefaultActions: true,
                type: "date",
                typeAttributes: {
                    year: "numeric",
                    month: "short",
                    day: "2-digit",
                    hour: "numeric",
                    minute: "numeric",
                    weekday: "long",
                },
            },
            {
                label: "",
                fieldName: "",
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
        this._serviceScheduleModel.serviceSessions = this._serviceScheduleModel.serviceSessions.filter(
            element =>
                element[SESSION_START_FIELD.fieldApiName] !==
                event.detail.row[SESSION_START_FIELD.fieldApiName]
        );
    }
}
