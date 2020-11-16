import { LightningElement, wire, track, api } from "lwc";
import getServiceSessions from "@salesforce/apex/RecentServiceSessionController.getServiceSessionsByStartDate";
import getMenuOptions from "@salesforce/apex/RecentServiceSessionController.getMenuOptions";
import { loadStyle } from "lightning/platformResourceLoader";
import { getObjectInfo } from "lightning/uiObjectInfoApi";

import RECENT_SESSIONS_LABEL from "@salesforce/label/c.RecentSessions";
import LOADING_LABEL from "@salesforce/label/c.Loading";

import SERVICE_SESSION_OBJECT from "@salesforce/schema/ServiceSession__c";
import SERVICE_SCHEDULE_OBJECT from "@salesforce/schema/ServiceSchedule__c";
import SESSION_START_DATE from "@salesforce/schema/ServiceSession__c.SessionStart__c";
import SERVICE_SCHEDULE_FIELD from "@salesforce/schema/ServiceSession__c.ServiceSchedule__c";
import SERVICE_FIELD from "@salesforce/schema/ServiceSchedule__c.Service__c";
import STATUS_FIELD from "@salesforce/schema/ServiceSession__c.Status__c";
import PRIMARY_SERVICE_PROVIDER_FIELD from "@salesforce/schema/ServiceSession__c.PrimaryServiceProvider__c";

import pmmFolder from "@salesforce/resourceUrl/pmm";

const THIS_WEEK = "THIS_WEEK";
const COMPLETE = "Complete";

export default class RecentSessions extends LightningElement {
    @track sessionsData = [];
    @track menuItems = [];
    @api flexipageRegionWidth;

    hasLoaded = false;
    isAccordionSectionOpen = false;
    objectLabel;
    objectLabelPlural;
    serviceScheduleRelationshipName;
    serviceRelationshipName;
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
    };

    fields = {
        sessionStartDate: SESSION_START_DATE.fieldApiName,
        serviceSchedule: SERVICE_SCHEDULE_FIELD.fieldApiName,
        service: SERVICE_FIELD.fieldApiName,
        status: STATUS_FIELD.fieldApiName,
        primaryServiceProvider: PRIMARY_SERVICE_PROVIDER_FIELD.fieldApiName,
    };

    HOME = "Home";
    END = "End";

    @wire(getObjectInfo, { objectApiName: SERVICE_SESSION_OBJECT })
    serviceSessionInfo(result, error) {
        if (!result) {
            return;
        }
        if (result.data) {
            this.objectLabel = result.data.label;
            this.objectLabelPlural = result.data.labelPlural;
            this.serviceScheduleRelationshipName =
                result.data.fields[this.fields.serviceSchedule].relationshipName;
        } else if (error) {
            console.log(error);
        }
    }
    @wire(getObjectInfo, { objectApiName: SERVICE_SCHEDULE_OBJECT })
    serviceScheduleInfo(result, error) {
        if (!result) {
            return;
        }
        if (result.data) {
            this.serviceRelationshipName =
                result.data.fields[this.fields.service].relationshipName;
        } else if (error) {
            console.log(error);
        }
    }

    @wire(getMenuOptions)
    wiredmenuOptions(result, error) {
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

    processSessions(records) {
        if (!records) {
            return records;
        }

        let sessions = JSON.parse(JSON.stringify(records));

        sessions.forEach(element => {
            let serviceSchedule = element[this.serviceScheduleRelationshipName];

            element.showCompleteIcon = element[this.fields.status] === COMPLETE;
            element.showPrimaryServiceProviderIcon =
                element[this.fields.primaryServiceProvider] !== undefined ? true : false;
            element.sessionStartDate = element[this.fields.sessionStartDate];
            element.serviceName = serviceSchedule[this.serviceRelationshipName].Name;
        });

        return sessions;
    }

    connectedCallback() {
        loadStyle(this, pmmFolder + "/recentSessionsOverrides.css");

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

    handleGetServiceSessions() {
        getServiceSessions({ dateLiteral: this.selectedMenuItemValue })
            .then(result => {
                if (!result) {
                    return;
                }

                if (result) {
                    if (!this.hasLoaded) {
                        this.sessionsData = [];
                        let sessions = result;

                        // eslint-disable-next-line guard-for-in
                        for (let sessionStartDate in sessions) {
                            //Here we are creating the array to iterate on UI.
                            let currentDate = new Date();
                            this.sessionsData.push({
                                sessionStartDate: sessionStartDate,
                                sessions: this.processSessions(
                                    sessions[sessionStartDate]
                                ),
                                openCurrentSection:
                                    new Date(sessionStartDate).getDate() ===
                                    currentDate.getDate(),
                                totalSessions:
                                    sessions[sessionStartDate].length === 1
                                        ? sessions[sessionStartDate].length +
                                          " " +
                                          this.objectLabel
                                        : sessions[sessionStartDate].length +
                                          " " +
                                          this.objectLabelPlural,
                            });
                        }
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
