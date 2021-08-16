/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { LightningElement, wire, api, track } from "lwc";
import { CurrentPageReference } from "lightning/navigation";
import { handleError, showToast, formatShortISODateString } from "c/util";
import getFieldSet from "@salesforce/apex/FieldSetController.getFieldSetForLWC";
import PROGRAMENGAGEMENT_OBJECT from "@salesforce/schema/ProgramEngagement__c";
import CONTACT_FIELD from "@salesforce/schema/ProgramEngagement__c.Contact__c";
import PROGRAM_FIELD from "@salesforce/schema/ProgramEngagement__c.Program__c";
import ROLE_FIELD from "@salesforce/schema/ProgramEngagement__c.Role__c";
import START_DATE_FIELD from "@salesforce/schema/ProgramEngagement__c.StartDate__c";
import STAGE_FIELD from "@salesforce/schema/ProgramEngagement__c.Stage__c";
import newProgramEngagement from "@salesforce/label/c.New_Program_Engagement";
import cancel from "@salesforce/label/c.Cancel";
import success from "@salesforce/label/c.Success";
import saveMessage from "@salesforce/label/c.SaveMessage";
import save from "@salesforce/label/c.Save";

const CREATE_PROGRAM_ENGAGEMENT_FIELD_SET = "CreateProgramEngagement";

export default class NewProgramEngagement extends LightningElement {
    contactField = CONTACT_FIELD;
    @api recordId;
    @api contactId;
    @api programId;
    @api fieldSet;
    @track localFieldSet = [];
    allowNewContact = false;

    @wire(CurrentPageReference) pageRef;

    @wire(getFieldSet, {
        objectName: PROGRAMENGAGEMENT_OBJECT.objectApiName,
        fieldSetName: CREATE_PROGRAM_ENGAGEMENT_FIELD_SET,
    })
    wiredFields({ error, data }) {
        if (data) {
            this.fieldSet = data;
        } else if (error) {
            handleError(error);
        }
    }

    labels = { newProgramEngagement, cancel, success, saveMessage, save };
    objectApiName = PROGRAMENGAGEMENT_OBJECT;

    @api
    showModal() {
        this.handleLoad();
        this.template.querySelector("c-modal").show();
    }

    @api
    hideModal() {
        this.template.querySelector("c-modal").hide();
        this.clearAllValues();
    }

    handleClose() {
        this.hideModal();
        this.dispatchEvent(new CustomEvent("cancel"));
    }

    handleSuccess(event) {
        showToast(this.labels.success, this.labels.saveMessage, "success", "dismissible");
        this.hideModal();
        this.dispatchEvent(new CustomEvent("save", { detail: event.detail.id }));
    }

    clearAllValues() {
        const allInputFields = this.template.querySelectorAll("lightning-input-field");
        if (allInputFields) {
            allInputFields.forEach(field => {
                if (field.value !== this.contactId) {
                    field.reset();
                }
            });
        }
    }

    handleLoad() {
        if (this.fieldSet) {
            this.localFieldSet = [];
            this.fieldSet.forEach(field => {
                field = Object.assign({}, field);
                if (field.apiName === CONTACT_FIELD.fieldApiName) {
                    if (this.contactId) {
                        field.disabled = true;
                    } else {
                        field.skip = true;
                        this.allowNewContact = true;
                    }
                }
                field.value = this.defaults[field.apiName];

                if (!field.skip) {
                    this.localFieldSet.push(field);
                }
            });
        }
    }

    get today() {
        return formatShortISODateString(new Date());
    }

    get defaults() {
        let defaultValues = {};
        defaultValues[ROLE_FIELD.fieldApiName] = "Client";
        defaultValues[START_DATE_FIELD.fieldApiName] = this.today;
        defaultValues[STAGE_FIELD.fieldApiName] = "Enrolled";
        defaultValues[PROGRAM_FIELD.fieldApiName] = this.programId;
        defaultValues[CONTACT_FIELD.fieldApiName] = this.contactId;

        return defaultValues;
    }

    handleFormError(value) {
        handleError(value);
    }
}
