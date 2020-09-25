import { LightningElement, api, track } from "lwc";
import { format } from "c/util";
import REVIEW_RECORDS from "@salesforce/label/c.Review_Records";
import TOTAL_SESSIONS_LABEL from "@salesforce/label/c.Total_Sessions";
import DATE_AND_TIME from "@salesforce/label/c.Service_Schedule_Date_Time";
import TIME_ZONE from "@salesforce/i18n/timeZone";
import CONTACT_OBJECT from "@salesforce/schema/Contact";

export default class ServiceScheduleReview extends LightningElement {
    _serviceScheduleModel;
    timeZone = TIME_ZONE;
    @track sessionFields;

    @api
    get serviceScheduleModel() {
        return this._serviceScheduleModel;
    }
    set serviceScheduleModel(value) {
        // This is a nested object so the inner objects are still read only when using spread alone
        this._serviceScheduleModel = JSON.parse(JSON.stringify(value));
        this.sessionFields = this._serviceScheduleModel.sessionFields;
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
        this._serviceScheduleModel.scheduleInformationFields.forEach(field => {
            field.icon = this.getIcon(field.referenceTo);
            field.value = this._serviceScheduleModel.serviceSchedule[
                field.relationshipName
            ]
                ? this._serviceScheduleModel.serviceSchedule[field.relationshipName][
                      field.referenceNameField
                  ]
                : this._serviceScheduleModel.serviceSchedule[field.apiName];
        });
    }

    getIcon(referenceTo) {
        switch (referenceTo) {
            case CONTACT_OBJECT.objectApiName:
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

    get servicePartcipantsLabel() {
        return `${
            this.serviceScheduleModel.labels.serviceParticipant.objectPluralLabel
        } (${
            this._serviceScheduleModel.selectedParticipants
                ? this._serviceScheduleModel.selectedParticipants.length
                : 0
        })`;
    }

    get serviceSessionsLabel() {
        return `${this.serviceScheduleModel.labels.serviceSession.objectPluralLabel} (${
            this._serviceScheduleModel.serviceSessions
                ? this._serviceScheduleModel.serviceSessions.length
                : 0
        })`;
    }

    get lastSessionEndDateTime() {
        return this._serviceScheduleModel.serviceSessions.length
            ? [...this._serviceScheduleModel.serviceSessions].pop()[
                  this.sessionFields.sessionEnd.apiName
              ]
            : undefined;
    }

    get firstSessionStartDateTime() {
        return this._serviceScheduleModel.serviceSessions.length
            ? this._serviceScheduleModel.serviceSessions[0][
                  this.sessionFields.sessionStart.apiName
              ]
            : undefined;
    }

    get activeSections() {
        return ["participants", "sessions"];
    }
}
