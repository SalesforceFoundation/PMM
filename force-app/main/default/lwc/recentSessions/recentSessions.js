import { LightningElement, wire, track } from "lwc";
import getServiceSessions from "@salesforce/apex/RecentServiceSessionController.getServiceSessions";
import { loadStyle } from "lightning/platformResourceLoader";
import { getObjectInfo } from "lightning/uiObjectInfoApi";
import { prefixNamespace } from "c/util";

import RECENT_SESSIONS_LABEL from "@salesforce/label/c.RecentSessions";
import SUCCESS_LABEL from "@salesforce/label/c.Success";
import USER_LABEL from "@salesforce/label/c.User";

import SERVICESESSION_OBJECT from "@salesforce/schema/ServiceSession__c";
import NAME_FIELD from "@salesforce/schema/ServiceSession__c.Name";
import STATUS_FIELD from "@salesforce/schema/ServiceSession__c.Status__c";
import PRIMARYSERVICEPROVIDER_FIELD from "@salesforce/schema/ServiceSession__c.PrimaryServiceProvider__c";

import pmmFolder from "@salesforce/resourceUrl/pmm";

const THIS_WEEK = "THIS_WEEK";
const COMPLETE = "Complete";

export default class RecentSessions extends LightningElement {
    @track isAccordionSectionOpen = false;
    @track sessionsData = [];
    @track listViewNames = [];
    serviceSessionObject = SERVICESESSION_OBJECT;
    objectLabel;
    objectLabelPlural;

    labels = {
        recentSessions: RECENT_SESSIONS_LABEL,
        sucess: SUCCESS_LABEL,
        user: USER_LABEL,
    };

    fields = {
        name: NAME_FIELD,
        status: STATUS_FIELD,
        primaryServiceProvider: PRIMARYSERVICEPROVIDER_FIELD,
    };

    @wire(getObjectInfo, { objectApiName: SERVICESESSION_OBJECT })
    objectInfo(result, error) {
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

    @wire(getServiceSessions, { dateRange: THIS_WEEK })
    wiredServiceSessions(result, error) {
        if (!result.data) {
            return;
        }

        if (result.data) {
            let sessions = result.data;

            // eslint-disable-next-line guard-for-in
            for (let sessionStartDate in sessions) {
                //Here we are creating the array to iterate on UI.
                this.sessionsData.push({
                    sessionStartDate: sessionStartDate,
                    sessions: this.processSessions(sessions[sessionStartDate]),
                    totalSessions:
                        sessions[sessionStartDate].length === 1
                            ? sessions[sessionStartDate].length + " " + this.objectLabel
                            : sessions[sessionStartDate].length +
                              " " +
                              this.objectLabelPlural,
                });
            }
        } else if (error) {
            console.log(error);
        }
    }

    handleOpenFirstAccordion() {
        let accordionSection = this.template.querySelector("c-accordion-section");
        if (accordionSection) {
            accordionSection.open();
        }
    }

    renderedCallback() {
        if (!this.isAccordionSectionOpen) {
            if (this.sessionsData) {
                this.sessionsData.forEach(element => {
                    let sessionStart = new Date(element.sessionStartDate);
                    let currentDate = new Date();

                    //get just the date to compare and if the dates are the same open the accordion
                    if (sessionStart.getUTCDate() === currentDate.getUTCDate()) {
                        this.handleOpenFirstAccordion();
                    }
                });
            }
            this.isAccordionSectionOpen = false;
        }
    }

    processSessions(records) {
        if (!records) {
            return records;
        }

        let sessions = JSON.parse(JSON.stringify(records));

        sessions.forEach(element => {
            element.showCompleteIcon = element[prefixNamespace("Status__c")] === COMPLETE;
        });

        return sessions;
    }

    connectedCallback() {
        loadStyle(this, pmmFolder + "/recentSessionsOverrides.css");
    }
}
