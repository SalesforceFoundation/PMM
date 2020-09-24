import { LightningElement, api } from "lwc";
import { format } from "c/util";
import REVIEW_RECORDS from "@salesforce/label/c.Review_Records";
import TOTAL_SESSIONS_LABEL from "@salesforce/label/c.Total_Sessions";
import DATE_AND_TIME from "@salesforce/label/c.Service_Schedule_Date_Time";
import TIME_ZONE from "@salesforce/i18n/timeZone";
import CONTACT_OBJECT from "@salesforce/schema/Contact";

export default class ServiceScheduleReview extends LightningElement {
    _serviceScheduleModel;
    timeZone = TIME_ZONE;

    @api
    get serviceScheduleModel() {
        return this._serviceScheduleModel;
    }
    set serviceScheduleModel(value) {
        // This is a nested object so the inner objects are still read only when using spread alone
        this._serviceScheduleModel = JSON.parse(JSON.stringify(value));
        this.setLabels();
        this.processScheduleInfoFieldSet();
    }

    labels = {
        totalSessions: TOTAL_SESSIONS_LABEL,
        dateAndTime: DATE_AND_TIME,
    };

    get reviewLabel() {
        return format(REVIEW_RECORDS, [
            this._serviceScheduleModel.labels.serviceSchedule.objectLabel,
        ]);
    }

    setLabels() {
        this.objectName = this._serviceScheduleModel.labels.serviceSession.objectPluralLabel;
        this.sessionNameLabel = this._serviceScheduleModel.sessionFields.name.label;
        this.sessionStartLabel = this._serviceScheduleModel.sessionFields.sessionStart.label;
        this.sessionEndLabel = this._serviceScheduleModel.sessionFields.sessionEnd.label;
    }

    processScheduleInfoFieldSet() {
        console.log(JSON.stringify(this._serviceScheduleModel.serviceSchedule));
        this._serviceScheduleModel.scheduleInformationFields.forEach(field => {
            field.icon = this.getIcon(field.referenceTo);
            field.value =
                field.type === "REFERENCE" &&
                this._serviceScheduleModel.serviceSchedule[field.relationshipName]
                    ? this._serviceScheduleModel.serviceSchedule[field.relationshipName][
                          field.referenceNameField
                      ]
                    : this._serviceScheduleModel.serviceSchedule[field.apiName];
        });
    }

    getIcon(referenceTo) {
        switch (referenceTo) {
            case CONTACT_OBJECT.objectName:
                return "utility:user";
            default:
                return null;
        }
    }

    get sessionDataTableColumns() {
        return [
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
        ];
    }

    get participantDataTableColumns() {
        let columns = [];
        this._serviceScheduleModel.engagementFields.forEach(field => {
            columns.push({
                label: field.label,
                fieldName: field.apiName,
                type: field.type,
                hideDefaultActions: true,
            });
        });
        return columns;
    }

    get lastSessionEndDateTime() {
        return [...this._serviceScheduleModel.serviceSessions].pop().SessionEnd__c;
    }

    get firstSessionStartDateTime() {
        return this._serviceScheduleModel.serviceSessions[0].SessionStart__c;
    }

    get activeSections() {
        return ["participants", "sessions"];
    }
}
