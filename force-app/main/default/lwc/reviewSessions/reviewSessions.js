/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { LightningElement, track, api } from "lwc";
import { format, reduceErrors } from "c/util";
import processSchedule from "@salesforce/apex/ServiceScheduleCreatorController.processSchedule";
import createSession from "@salesforce/apex/ServiceScheduleCreatorController.createSession";
import TOTAL_SESSIONS_LABEL from "@salesforce/label/c.Total_Sessions";
import ADD_RECORD_LABEL from "@salesforce/label/c.Add_Record";
import REVIEW_RECORDS from "@salesforce/label/c.Review_Records";
import CANCEL_LABEL from "@salesforce/label/c.Cancel";
import SAVE_LABEL from "@salesforce/label/c.Save";
import SAVE_NEW_LABEL from "@salesforce/label/c.Save_New";
import START_BEFORE_END_LABEL from "@salesforce/label/c.End_Date_After_Start_Date";
import CREATE_SESSIONS_WARNING_LABEL from "@salesforce/label/c.Select_Create_Service_Session_Warning";
import MAX_SESSIONS_WARNING_LABEL from "@salesforce/label/c.Creating_Service_Session_Warning";
import TIME_ZONE from "@salesforce/i18n/timeZone";

export default class ReviewSessions extends LightningElement {
    isLoaded = false;
    @track columns = [];
    @track objectName;
    _serviceScheduleModel;

    emptyMessage;
    limitMessage;
    sessionNameLabel;
    sessionStartLabel;
    sessionEndLabel;
    addSessionError;

    @track _serviceSessions = [];

    @api
    get serviceScheduleModel() {
        this._serviceScheduleModel.serviceSessions = [...this._serviceSessions];

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
        this.setEmptyMessage();
        this.setLabels();
        this.setDataTableColumns();

        this._serviceSessions = [...this._serviceScheduleModel.serviceSessions];

        if (!this._serviceSessions.length) {
            this.getSessions();
        } else {
            this.handleDispatchLoadedEvent();
        }
    }

    get serviceSessions() {
        this._serviceSessions.sort((a, b) => {
            return a[this.sessionStartFieldName] > b[this.sessionStartFieldName] ? 1 : -1;
        });

        return this._serviceSessions.map((session, index) => ({
            ...session,
            index: index,
        }));
    }

    get serviceSchedule() {
        return this._serviceScheduleModel.serviceSchedule;
    }

    get limitReached() {
        return this._serviceSessions.length >= this._serviceScheduleModel.maxSessions;
    }

    get saveNewLimitReached() {
        return this._serviceSessions.length >= this._serviceScheduleModel.maxSessions - 1;
    }

    labels = {
        totalSessions: TOTAL_SESSIONS_LABEL,
        addSession: ADD_RECORD_LABEL,
        reviewSessions: REVIEW_RECORDS,
        cancel: CANCEL_LABEL,
        save: SAVE_LABEL,
        saveNew: SAVE_NEW_LABEL,
    };

    getSessions() {
        processSchedule({ model: this._serviceScheduleModel })
            .then(result => {
                this._serviceScheduleModel.serviceSchedule = result.serviceSchedule;
                this._serviceSessions = [...result.serviceSessions];
            })
            .catch(error => {
                // TODO: throw error
                console.log(JSON.stringify(error));
            })
            .finally(() => {
                this.handleDispatchLoadedEvent();
            });
    }

    get totalServiceSessions() {
        return this.labels.totalSessions + ": " + this._serviceSessions.length;
    }

    get sessionStartFieldName() {
        return this._serviceScheduleModel.sessionFields.sessionStart.apiName;
    }

    get sessionEndFieldName() {
        return this._serviceScheduleModel.sessionFields.sessionEnd.apiName;
    }

    setLabels() {
        this.objectName = this._serviceScheduleModel.labels.serviceSession.objectApiName;
        this.labels.addSession = this._serviceScheduleModel.labels.serviceSession.addSession;
        this.labels.reviewSessions = this._serviceScheduleModel.labels.serviceSession.reviewSessions;
        this.sessionNameLabel = this._serviceScheduleModel.sessionFields.name.label;
        this.sessionStartLabel = this._serviceScheduleModel.sessionFields.sessionStart.label;
        this.sessionEndLabel = this._serviceScheduleModel.sessionFields.sessionEnd.label;
        this.limitMessage = format(MAX_SESSIONS_WARNING_LABEL, [
            this._serviceScheduleModel.maxSessions,
        ]);
    }

    setEmptyMessage() {
        if (this.serviceSessions.length) {
            this.emptyMessage = undefined;
            return;
        }

        this.emptyMessage = this._serviceScheduleModel.serviceSchedule[
            this._serviceScheduleModel.scheduleRequiredFields.autoGenerateSessions.apiName
        ]
            ? undefined
            : CREATE_SESSIONS_WARNING_LABEL;
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
                fieldName: this.sessionStartFieldName,
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
                fieldName: this.sessionEndFieldName,
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

    handleSaveNewSession() {
        this.save(true);
    }

    handleSaveSession() {
        this.save(false);
    }

    save(isSaveAndNew) {
        let inputFields = this.template.querySelectorAll("lightning-input-field");
        let startDateTime = inputFields[0];
        let endDateTime = inputFields[1];

        let allValid = [...inputFields].reduce((validSoFar, inputField) => {
            return validSoFar && inputField.reportValidity();
        }, true);

        if (!allValid || !this.isSessionValid(startDateTime.value, endDateTime.value)) {
            return;
        }

        createSession({
            schedule: this._serviceScheduleModel.serviceSchedule,
            startDateTime: startDateTime.value,
            endDateTime: endDateTime.value,
        })
            .then(result => {
                this._serviceSessions = [...this._serviceSessions, result];
                this.setEmptyMessage();
                inputFields.forEach(field => field.reset());

                if (isSaveAndNew) {
                    return;
                }

                this.closeModal();
            })
            .catch(error => {
                this.addSessionError = reduceErrors(error);
            });
    }

    isSessionValid(startDateTime, endDateTime) {
        this.addSessionError = undefined;
        this.addSessionErrorTheme = undefined;

        if (endDateTime < startDateTime) {
            this.addSessionError = format(START_BEFORE_END_LABEL, [
                this.sessionStartLabel,
                this.sessionEndLabel,
            ]);

            this.addSessionErrorTheme = "error";

            return false;
        }

        return true;
    }

    closeModal() {
        const modal = this.template.querySelector("c-modal");
        modal.hide();
    }

    handleAddSession() {
        const modal = this.template.querySelector("c-modal");
        modal.show();
    }

    handleDelete(event) {
        this._serviceSessions.splice(event.detail.row.index, 1);

        this.setEmptyMessage();
    }

    handleDispatchLoadedEvent() {
        this.isLoaded = true;
        this.dispatchEvent(new CustomEvent("loaded", { detail: this.isLoaded }));
    }
}
