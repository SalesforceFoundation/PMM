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
import REVIEW_RECORDS from "@salesforce/label/c.Review_Records";
import TOTAL_SESSIONS_LABEL from "@salesforce/label/c.Total_Sessions";
import DATE_AND_TIME from "@salesforce/label/c.Service_Schedule_Date_Time";
import TIME_ZONE from "@salesforce/i18n/timeZone";
import CONTACT_OBJECT from "@salesforce/schema/Contact";

export default class ServiceScheduleReview extends LightningElement {
    _serviceScheduleModel;
    timeZone = TIME_ZONE;
    isLoaded = false;
    @track sessionFields;

    @api
    get serviceScheduleModel() {
        return this._serviceScheduleModel;
    }

    set serviceScheduleModel(value) {
        // Adding a brief timeout to allow the screen to render with spinner
        // before attempting to load the data
        // eslint-disable-next-line @lwc/lwc/no-async-operation
        setTimeout(
            function() {
                this.processModel(value);
            }.bind(this),
            0
        );
    }

    processModel(value) {
        this._serviceScheduleModel = JSON.parse(JSON.stringify(value));
        this.sessionFields = this._serviceScheduleModel.sessionFields;
        this.setLabels();
        this.processScheduleInfoFieldSet();
        this.isLoaded = true;
        this.dispatchEvent(new CustomEvent("loaded", { detail: this.isLoaded }));
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

    get serviceParticipantsLabel() {
        return `${
            this.serviceScheduleModel.labels.serviceParticipant.objectPluralLabel
        } (${
            this.hasServiceParticipants
                ? this._serviceScheduleModel.selectedParticipants.length
                : 0
        })`;
    }

    get serviceSessionsLabel() {
        return `${this.serviceScheduleModel.labels.serviceSession.objectPluralLabel} (${
            this.hasServiceSessions
                ? this._serviceScheduleModel.serviceSessions.length
                : 0
        })`;
    }

    get hasServiceParticipants() {
        return this._serviceScheduleModel.selectedParticipants.length > 0;
    }

    get hasServiceSessions() {
        return this._serviceScheduleModel.serviceSessions.length > 0;
    }

    get firstSessionStartDateTime() {
        return this._serviceScheduleModel.serviceSessions.length
            ? this._serviceScheduleModel.serviceSessions[0][
                  this.sessionFields.sessionStart.apiName
              ]
            : this._serviceScheduleModel.serviceSchedule[
                  this._serviceScheduleModel.scheduleRecurrenceDateFields.start.apiName
              ];
    }

    get lastSessionEndDateTime() {
        return this._serviceScheduleModel.serviceSessions.length
            ? [...this._serviceScheduleModel.serviceSessions].pop()[
                  this.sessionFields.sessionEnd.apiName
              ]
            : this._serviceScheduleModel.serviceSchedule[
                  this._serviceScheduleModel.scheduleRecurrenceDateFields.end.apiName
              ];
    }

    get showEndDate() {
        // NOTE: Using browser locale. Results may vary if the browser locale is not the same
        // as running user salesforce locale. There is no better work around without going
        // back to Apex to get the date portions of the date times. Worst case scenario is that
        // UI will render the date twice eg: Oct 16 - Oct 16.
        let startDate = new Date(this.firstSessionStartDateTime);
        let endDate = new Date(this.lastSessionEndDateTime);

        return !(
            startDate.getFullYear() === endDate.getFullYear() &&
            startDate.getMonth() === endDate.getMonth() &&
            startDate.getDate() === endDate.getDate()
        );
    }

    get activeSections() {
        return ["participants", "sessions"];
    }
}
