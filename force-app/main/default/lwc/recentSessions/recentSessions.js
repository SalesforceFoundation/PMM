import { LightningElement, wire, track } from "lwc";
import getServiceSessions from "@salesforce/apex/RecentServiceSessionController.getServiceSessionsByStartDate";
import { loadStyle } from "lightning/platformResourceLoader";
import { getObjectInfo } from "lightning/uiObjectInfoApi";

import RECENT_SESSIONS_LABEL from "@salesforce/label/c.RecentSessions";
import SUCCESS_LABEL from "@salesforce/label/c.Success";
import USER_LABEL from "@salesforce/label/c.User";

import SERVICE_SESSION_OBJECT from "@salesforce/schema/ServiceSession__c";
import STATUS_FIELD from "@salesforce/schema/ServiceSession__c.Status__c";
import PRIMARY_SERVICE_PROVIDER_FIELD from "@salesforce/schema/ServiceSession__c.PrimaryServiceProvider__c";
import SESSION_START_DATE from "@salesforce/schema/ServiceSession__c.SessionStart__c";

import pmmFolder from "@salesforce/resourceUrl/pmm";

const THIS_WEEK = "THIS_WEEK";
const COMPLETE = "Complete";

export default class RecentSessions extends LightningElement {
    @track isAccordionSectionOpen = false;
    @track sessionsData = [];
    @track listViewNames = [];
    serviceSessionObject = SERVICE_SESSION_OBJECT;
    objectLabel;
    objectLabelPlural;

    labels = {
        recentSessions: RECENT_SESSIONS_LABEL,
        sucess: SUCCESS_LABEL,
        user: USER_LABEL,
    };

    fields = {
        status: STATUS_FIELD.fieldApiName,
        primaryServiceProvider: PRIMARY_SERVICE_PROVIDER_FIELD.fieldApiName,
        sessionStartDate: SESSION_START_DATE.fieldApiName,
    };

    @wire(getObjectInfo, { objectApiName: SERVICE_SESSION_OBJECT })
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
                let currentDate = new Date();
                this.sessionsData.push({
                    sessionStartDate: sessionStartDate,
                    sessions: this.processSessions(sessions[sessionStartDate]),
                    openCurrentSection:
                        new Date(sessionStartDate).getDate() === currentDate.getDate(),
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

    processSessions(records) {
        if (!records) {
            return records;
        }

        let sessions = JSON.parse(JSON.stringify(records));

        sessions.forEach(element => {
            element.showCompleteIcon = element[this.fields.status] === COMPLETE;
            element.showPrimaryServiceProviderIcon =
                element[this.fields.primaryServiceProvider] !== undefined ? true : false;
            element.sessionStartDate = element[this.fields.sessionStartDate];
        });

        return sessions;
    }

    connectedCallback() {
        loadStyle(this, pmmFolder + "/recentSessionsOverrides.css");
    }
}
