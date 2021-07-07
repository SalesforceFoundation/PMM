/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { LightningElement, wire, track, api } from "lwc";
import getServiceSessions from "@salesforce/apex/RecentServiceSessionController.getServiceSessionsByStartDate";
import getMenuOptions from "@salesforce/apex/RecentServiceSessionController.getMenuOptions";
import { loadStyle } from "lightning/platformResourceLoader";
import { getObjectInfo } from "lightning/uiObjectInfoApi";

import RECENT_SESSIONS_LABEL from "@salesforce/label/c.RecentSessions";
import LOADING_LABEL from "@salesforce/label/c.Loading";
import LIST_VIEW_LIMIT_LABEL from "@salesforce/label/c.List_View_Limit";
import LIST_VIEW_LABEL from "@salesforce/label/c.List_View";
import TIME_FRAME_LABEL from "@salesforce/label/c.Time_Frame";

import SERVICE_SESSION_OBJECT from "@salesforce/schema/ServiceSession__c";
import ID_FIELD from "@salesforce/schema/ServiceSession__c.Id";
import NAME_FIELD from "@salesforce/schema/ServiceSession__c.Name";
import PRIMARY_SERVICE_PROVIDER_FIELD from "@salesforce/schema/ServiceSession__c.PrimaryServiceProvider__c";
import ATTENDANCE_SUMMARY_FIELD from "@salesforce/schema/ServiceSession__c.AttendanceSummary__c";
import SESSION_START_FIELD from "@salesforce/schema/ServiceSession__c.SessionStart__c";

import getFieldByFieldPath from "@salesforce/apex/FieldSetController.getFieldByFieldPath";

import pmmFolder from "@salesforce/resourceUrl/pmm";

const THIS_WEEK = "THIS_WEEK";
const FIELD_SET_NAME = "RecentSessionsView";
const MAX_LIST_VIEW_RECORDS = 2000;

export default class RecentSessions extends LightningElement {
    @track sessionsData = [];
    @track sessionIds;
    @track menuItems = [];
    @api flexipageRegionWidth;

    _sessionsData;
    hasLoaded = false;
    isAccordionSectionOpen = false;
    objectApiName = SERVICE_SESSION_OBJECT.objectApiName;
    objectLabel;
    objectLabelPlural;
    selectedMenuItemLabel;
    selectedMenuItemValue;
    sessionsContainerDefaultSize = 12;
    sessionsContainerSmallSize = 12;
    sessionsContainerMediumSize = 6;
    sessionsContainerLargeSize = 6;
    sessionsContainerPaddingAround;

    labels = {
        recentSessions: RECENT_SESSIONS_LABEL,
        loading: LOADING_LABEL,
        listViewLimit: LIST_VIEW_LIMIT_LABEL,
        listView: LIST_VIEW_LABEL,
        timeFrame: TIME_FRAME_LABEL,
    };

    fields = {
        id: ID_FIELD.fieldApiName,
        name: NAME_FIELD.fieldApiName,
        primaryServiceProvider: PRIMARY_SERVICE_PROVIDER_FIELD.fieldApiName,
        attendanceSummary: ATTENDANCE_SUMMARY_FIELD.fieldApiName,
    };

    outputFields = [];

    HOME = "Home";
    END = "End";

    @wire(getFieldByFieldPath, {
        objectName: SERVICE_SESSION_OBJECT.objectApiName,
        fieldSetName: FIELD_SET_NAME,
    })
    wiredFields({ error, data }) {
        if (data) {
            for (const [key, val] of Object.entries(data)) {
                let outputField = { ...val };
                // Special handling is done with the following fields
                // and should not be used for field set driven output
                if (
                    key === this.fields.id ||
                    key === this.fields.name ||
                    key === this.fields.status ||
                    key === this.fields.primaryServiceProvider ||
                    key === this.fields.attendanceSummary
                ) {
                    continue;
                }
                outputField.path = key;
                this.outputFields.push(outputField);
            }
        } else if (error) {
            console.log(error);
        }
    }

    @wire(getObjectInfo, { objectApiName: SERVICE_SESSION_OBJECT })
    serviceSessionInfo(result, error) {
        if (!result) {
            return;
        }
        if (result.data) {
            this.objectLabel = result.data.label;
            this.objectLabelPlural = result.data.labelPlural;
        } else if (error) {
            console.log(error);
        }
    }

    @wire(getMenuOptions)
    wiredMenuOptions(result, error) {
        if (!result.data) {
            return;
        }
        if (result.data) {
            for (const [key, value] of Object.entries(result.data)) {
                let menuItem = {};
                menuItem.label = value;
                menuItem.value = key;

                //Set the default value
                if (key === THIS_WEEK) {
                    this.selectedMenuItemLabel = value;
                    this.selectedMenuItemValue = key;
                    menuItem.isChecked = true;
                }

                this.menuItems.push(menuItem);
            }
            this.handleGetServiceSessions();
        } else if (error) {
            console.log(error);
        }
    }

    connectedCallback() {
        loadStyle(this, pmmFolder + "/recentSessionsOverrides.css");
        loadStyle(this, pmmFolder + "/listViewSelectorOverrides.css");

        if (this.flexipageRegionWidth === "SMALL") {
            this.sessionsContainerMediumSize = 12;
            this.sessionsContainerLargeSize = 12;
            this.sessionsContainerPaddingAround = "";
        } else if (this.flexipageRegionWidth === "MEDIUM") {
            this.sessionsContainerLargeSize = 6;
            this.sessionsContainerPaddingAround = "horizontal-medium";
        }
    }

    handleMenuItemSelected(event) {
        this.menuItems.forEach(element => {
            if (element.value === event.detail.value) {
                this.selectedMenuItemLabel = element.label;
                this.selectedMenuItemValue = element.value;
                element.isChecked = true;
            } else {
                element.isChecked = false;
            }
        });

        if (this.selectedMenuItemValue) {
            this.hasLoaded = false;
            this.handleGetServiceSessions();
        }
    }

    handleListViewSelected(event) {
        this.sessionIds = event.detail.map(session => session.id);
        this.filter();
    }

    get listViewLimitReached() {
        return this.sessionIds && this.sessionIds.length >= MAX_LIST_VIEW_RECORDS;
    }

    filter() {
        if (!this.sessionIds || !this._sessionsData) {
            return;
        }

        this.sessionsData = [];

        if (!this.sessionIds.length) {
            return;
        }

        this._sessionsData.forEach(_sessionData => {
            let sessionData = { ..._sessionData };
            sessionData.sessions = [...sessionData.sessions].filter(session =>
                this.sessionIds.includes(session.Id)
            );

            if (sessionData.sessions && sessionData.sessions.length) {
                sessionData.totalSessions = this.calculateTotalSessions(
                    sessionData.sessions.length
                );
                this.sessionsData.push(sessionData);
            }
        });
    }

    calculateTotalSessions(sessionCount) {
        return sessionCount === 1
            ? sessionCount + " " + this.objectLabel
            : sessionCount + " " + this.objectLabelPlural;
    }

    handleGetServiceSessions() {
        getServiceSessions({
            dateLiteral: this.selectedMenuItemValue,
        })
            .then(result => {
                if (!result) {
                    return;
                }

                if (result) {
                    if (!this.hasLoaded) {
                        this._sessionsData = [];
                        let sessions = result;

                        // eslint-disable-next-line guard-for-in
                        Object.keys(sessions).forEach(sessionStartDateValue => {
                            //Here we are creating the array to iterate on UI.
                            let currentDate = new Date();
                            this._sessionsData.push({
                                sessionStartDate:
                                    sessions[sessionStartDateValue][0][
                                        SESSION_START_FIELD.fieldApiName
                                    ],
                                sessions: JSON.parse(
                                    JSON.stringify(sessions[sessionStartDateValue])
                                ),
                                openCurrentSection:
                                    new Date(
                                        sessions[sessionStartDateValue][0][
                                            SESSION_START_FIELD.fieldApiName
                                        ]
                                    ).getDate() === currentDate.getDate(),
                                totalSessions: "",
                            });
                        });
                        this.filter();
                        this.hasLoaded = true;
                    }
                }
            })
            .catch(error => {
                console.log(error);
            });
    }

    listEscapeHandler(event) {
        let key = event.key || event.keyCode;
        if ((event.metaKey || event.ctrlKey) && key === this.HOME) {
            event.preventDefault();
            this.template.querySelector("c-skip-links").handleSkipToStartClick();
        }
        if ((event.metaKey || event.ctrlKey) && key === this.END) {
            event.preventDefault();
            this.template.querySelector("c-skip-links").handleSkipToEndClick();
        }
    }
}
