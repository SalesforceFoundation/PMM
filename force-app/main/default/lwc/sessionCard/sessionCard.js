import { LightningElement, api, track } from "lwc";
import { NavigationMixin } from "lightning/navigation";

import SERVICE_SESSION_OBJECT from "@salesforce/schema/ServiceSession__c";
import SUCCESS_LABEL from "@salesforce/label/c.Success";
import STATUS_FIELD from "@salesforce/schema/ServiceSession__c.Status__c";
import PRIMARY_SERVICE_PROVIDER_FIELD from "@salesforce/schema/ServiceSession__c.PrimaryServiceProvider__c";
import TIME_ZONE from "@salesforce/i18n/timeZone";

export default class SessionCard extends NavigationMixin(LightningElement) {
    serviceSessionObject = SERVICE_SESSION_OBJECT;
    timeZone = TIME_ZONE;

    @api session;
    @track sessionURL;

    labels = {
        sucess: SUCCESS_LABEL,
    };

    fields = {
        status: STATUS_FIELD.fieldApiName,
        primaryServiceProvider: PRIMARY_SERVICE_PROVIDER_FIELD.fieldApiName,
    };

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
        if (
            (event.key && event.key === " ") ||
            event.key === this.ENTER ||
            event.key === 13 ||
            event.key === 32
        ) {
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
