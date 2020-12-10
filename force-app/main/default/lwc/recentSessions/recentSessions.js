import { LightningElement, wire, track, api } from "lwc";
import getServiceSessions from "@salesforce/apex/RecentServiceSessionController.getServiceSessionsByStartDate";
import getMenuOptions from "@salesforce/apex/RecentServiceSessionController.getMenuOptions";
import { loadStyle } from "lightning/platformResourceLoader";
import { getObjectInfo } from "lightning/uiObjectInfoApi";

import RECENT_SESSIONS_LABEL from "@salesforce/label/c.RecentSessions";
import LOADING_LABEL from "@salesforce/label/c.Loading";

import SERVICE_SESSION_OBJECT from "@salesforce/schema/ServiceSession__c";
import ID_FIELD from "@salesforce/schema/ServiceSession__c.Id";
import NAME_FIELD from "@salesforce/schema/ServiceSession__c.Name";
import PRIMARY_SERVICE_PROVIDER_FIELD from "@salesforce/schema/ServiceSession__c.PrimaryServiceProvider__c";

import getFieldByFieldPath from "@salesforce/apex/FieldSetController.getFieldByFieldPath";

import pmmFolder from "@salesforce/resourceUrl/pmm";

const THIS_WEEK = "THIS_WEEK";
const FIELD_SET_NAME = "RecentSessionsView";

export default class RecentSessions extends LightningElement {
    @track sessionsData = [];
    @track menuItems = [];
    @api flexipageRegionWidth;

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
    sessionIds;

    labels = {
        recentSessions: RECENT_SESSIONS_LABEL,
        loading: LOADING_LABEL,
    };

    fields = {
        id: ID_FIELD.fieldApiName,
        name: NAME_FIELD.fieldApiName,
        primaryServiceProvider: PRIMARY_SERVICE_PROVIDER_FIELD.fieldApiName,
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
                    key === this.fields.primaryServiceProvider
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

    handleListViewSelected() {
        let listViewSelector = this.template.querySelector("c-list-view-selector");
        if (!listViewSelector) {
            return;
        }

        let records = listViewSelector.records;
        if (!records) {
            return;
        }

        this.sessionIds = listViewSelector.records.map(session => session.id);
        this.handleGetServiceSessions();
    }

    handleGetServiceSessions() {
        getServiceSessions({
            dateLiteral: this.selectedMenuItemValue,
            sessionIds: this.sessionIds,
        })
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
                                sessions: JSON.parse(
                                    JSON.stringify(sessions[sessionStartDate])
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
