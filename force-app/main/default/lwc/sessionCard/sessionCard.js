import { LightningElement, api } from "lwc";
import { NavigationMixin } from "lightning/navigation";

import TIME_ZONE from "@salesforce/i18n/timeZone";
import LOCALE from "@salesforce/i18n/locale";

import SERVICE_SESSION_OBJECT from "@salesforce/schema/ServiceSession__c";
import SUCCESS_LABEL from "@salesforce/label/c.Success";
import NO_PRIMARY_SERVICE_PROVIDER_LABEL from "@salesforce/label/c.Not_Available";
import PRIMARY_SERVICE_PROVIDER_FIELD from "@salesforce/schema/ServiceSession__c.PrimaryServiceProvider__c";
import SESSION_START_DATE from "@salesforce/schema/ServiceSession__c.SessionStart__c";
import SERVICE_SCHEDULE_FIELD from "@salesforce/schema/ServiceSession__c.ServiceSchedule__c";
import SERVICE_FIELD from "@salesforce/schema/ServiceSchedule__c.Service__c";
import STATUS_FIELD from "@salesforce/schema/ServiceSession__c.Status__c";
import SERVICE_LINK_FIELD from "@salesforce/schema/ServiceSession__c.ServiceLink__c";

const COMPLETE = "Complete";
const STRING = "STRING";

export default class SessionCard extends NavigationMixin(LightningElement) {
    @api displayPrimaryServiceProvider;
    serviceSessionObject = SERVICE_SESSION_OBJECT;
    sessionURL;
    populatedFields = [];
    separator = "|";

    _session;
    _outputFields;

    labels = {
        sucess: SUCCESS_LABEL,
        noPrimaryServiceProvider: NO_PRIMARY_SERVICE_PROVIDER_LABEL,
    };

    fields = {
        sessionStartDate: SESSION_START_DATE.fieldApiName,
        serviceSchedule: SERVICE_SCHEDULE_FIELD.fieldApiName,
        service: SERVICE_FIELD.fieldApiName,
        status: STATUS_FIELD.fieldApiName,
        primaryServiceProvider: PRIMARY_SERVICE_PROVIDER_FIELD.fieldApiName,
        serviceLink: SERVICE_LINK_FIELD.fieldApiName,
    };

    @api
    set outputFields(value) {
        this._outputFields = value;

        this.processFields();
    }

    get outputFields() {
        return this._outputFields;
    }

    @api
    set session(value) {
        this._session = { ...value };
        for (const [key, val] of Object.entries(value)) {
            if (key === this.fields.status) {
                this._session.showCompleteIcon =
                    val.toLowerCase() === COMPLETE.toLowerCase();
            } else if (
                this.displayPrimaryServiceProvider &&
                key === this.fields.primaryServiceProvider
            ) {
                this._session.hasServiceProviderValue = val !== undefined;
            } else if (key === this.fields.serviceLink) {
                this._session[key] = this._session[key].replace(
                    /<a[^>]*>(.*?)<\/a>/g,
                    function(match, group1) {
                        return group1;
                    }
                );
            }
        }

        this.processFields();
    }

    get session() {
        return this._session;
    }

    processFields() {
        if (!(this.session && this.outputFields)) {
            return;
        }

        this.outputFields.forEach(field => {
            let relationshipField =
                field.path && field.path.includes(".")
                    ? field.path.split(".")[0]
                    : undefined;
            if (
                (!relationshipField && this.session[field.apiName] !== undefined) ||
                (relationshipField &&
                    this.session[relationshipField] &&
                    this.session[relationshipField][field.apiName] !== undefined)
            ) {
                let populatedField = { ...field };
                if (populatedField.apiName === this.fields.sessionStartDate) {
                    populatedField.type = STRING;
                    this._session[populatedField.apiName] = new Date(
                        this._session[populatedField.apiName]
                    ).toLocaleString(LOCALE, {
                        timeZone: TIME_ZONE,
                        hour: "numeric",
                        minute: "numeric",
                    });
                }

                this.populatedFields.push(populatedField);
            }
        });
    }

    generateSessionURL() {
        if (!this.session) {
            this.sessionURL = "";
            return;
        }
        this[NavigationMixin.GenerateUrl]({
            type: "standard__recordPage",
            attributes: {
                recordId: this.session.Id,
                actionName: "view",
            },
        }).then(url => {
            this.sessionURL = url;
        });
    }

    handleSessionClick(event) {
        let key = event.key || event.keyCode;
        if ((key && key === " ") || key === this.ENTER || key === 13 || key === 32) {
            this[NavigationMixin.Navigate]({
                type: "standard__recordPage",
                attributes: {
                    recordId: this.session.Id,
                    actionName: "view",
                },
            });
        }
    }

    connectedCallback() {
        this.generateSessionURL();
    }
}
