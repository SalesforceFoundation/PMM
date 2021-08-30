/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

/* eslint-disable @lwc/lwc/no-async-operation */

import { LightningElement, wire, api, track } from "lwc";
import { CurrentPageReference } from "lightning/navigation";
import { handleError, showToast } from "c/util";
import getFieldSet from "@salesforce/apex/FieldSetController.getFieldSetForLWC";
import getProgramCohortsFromProgramId from "@salesforce/apex/ProgramController.getProgramCohortsFromProgramId";
import PROGRAMENGAGEMENT_OBJECT from "@salesforce/schema/ProgramEngagement__c";
import CONTACT_OBJECT from "@salesforce/schema/Contact";
import CONTACT_FIELD from "@salesforce/schema/ProgramEngagement__c.Contact__c";
import PROGRAM_FIELD from "@salesforce/schema/ProgramEngagement__c.Program__c";
import COHORT_FIELD from "@salesforce/schema/ProgramEngagement__c.ProgramCohort__c";
import COHORT_ID_FIELD from "@salesforce/schema/ProgramCohort__c.Id";
import COHORT_NAME_FIELD from "@salesforce/schema/ProgramCohort__c.Name";
import newProgramEngagement from "@salesforce/label/c.New_Program_Engagement";
import cancel from "@salesforce/label/c.Cancel";
import success from "@salesforce/label/c.Success";
import saveMessage from "@salesforce/label/c.SaveMessage";
import save from "@salesforce/label/c.Save";
import loading from "@salesforce/label/c.Loading";
import newContact from "@salesforce/label/c.New_Contact";
import cancelAndBack from "@salesforce/label/c.Cancel_and_Back";
import cantFindContact from "@salesforce/label/c.Cant_Find_Contact";

const CREATE_PROGRAM_ENGAGEMENT_FIELD_SET = "CreateProgramEngagement";
const CREATE_CONTACT_FIELD_SET = "CreateContact";

export default class NewProgramEngagement extends LightningElement {
    contactField = CONTACT_FIELD;
    @api recordId;
    @api contactId;
    @api
    set programId(value) {
        this._programId = value;
        this.selectedProgramId = value;
    }
    get programId() {
        return this._programId;
    }
    _programId;
    @api engagementFieldSet;
    @track localEngagementFieldSet = [];
    @track contactFieldSet;
    @track cohorts;
    @track cohortOptions = [];
    selectedCohortId;
    allowNewContact = false;
    isSaving = false;
    newContactMode = false;
    showEngagementForm = false;
    selectedProgramId;
    labels = {
        newProgramEngagement,
        cancel,
        success,
        saveMessage,
        save,
        loading,
        newContact,
        cancelAndBack,
        cantFindContact,
    };
    engagementObjectApiName = PROGRAMENGAGEMENT_OBJECT;
    contactObjectApiName = CONTACT_OBJECT;

    @wire(CurrentPageReference) pageRef;

    @wire(getFieldSet, {
        objectName: PROGRAMENGAGEMENT_OBJECT.objectApiName,
        fieldSetName: CREATE_PROGRAM_ENGAGEMENT_FIELD_SET,
    })
    wiredEngagementFields({ error, data }) {
        if (data) {
            this.engagementFieldSet = data;
        } else if (error) {
            handleError(error);
        }
    }

    @wire(getFieldSet, {
        objectName: CONTACT_OBJECT.objectApiName,
        fieldSetName: CREATE_CONTACT_FIELD_SET,
    })
    wiredContactFields({ error, data }) {
        if (data) {
            this.contactFieldSet = data;
        } else if (error) {
            handleError(error);
        }
    }

    @wire(getProgramCohortsFromProgramId, {
        programId: "$selectedProgramId",
    })
    wiredCohorts({ error, data }) {
        if (data) {
            this.cohorts = data;
            this.setCohortOptions();
        } else if (error) {
            handleError(error);
        }
    }

    @api
    showModal() {
        this.loadForm();
        this.template.querySelector("c-modal").show();
        setTimeout(this.focusForm.bind(this), 400);
    }

    @api
    hideModal() {
        this.template.querySelector("c-modal").hide();
        this.resetForm();
    }

    handleCancel() {
        if (this.newContactMode) {
            this.newContactMode = false;
            this.focusForm();
        } else {
            this.handleClose();
        }
    }

    handleClose() {
        this.hideModal();
        this.dispatchEvent(new CustomEvent("cancel"));
    }

    handleEngagementSuccess(event) {
        this.isSaving = false;
        showToast(this.labels.success, this.labels.saveMessage, "success", "dismissible");
        this.hideModal();
        this.dispatchEvent(new CustomEvent("save", { detail: event.detail.id }));
    }

    handleFormError() {
        this.isSaving = false;
    }

    handleFieldChange(event) {
        if (event.target.fieldName === PROGRAM_FIELD.fieldApiName) {
            this.selectedProgramId = event.detail.value[0];
            this.selectedCohortId = undefined;
        }
    }

    setCohortOptions() {
        this.cohortOptions = [];
        this.cohorts.forEach(cohort => {
            this.cohortOptions.push({
                value: cohort[COHORT_ID_FIELD.fieldApiName],
                label: cohort[COHORT_NAME_FIELD.fieldApiName],
            });
        });
    }

    handleCohortChange(event) {
        this.selectedCohortId = event.detail.value;
    }

    handleSubmitEngagement(event) {
        this.isSaving = true;
        let fields = event.detail.fields;

        if (this.selectedCohortId) {
            fields[COHORT_FIELD.fieldApiName] = this.selectedCohortId;
        }

        this.template.querySelector("lightning-record-edit-form").submit(fields);
    }

    get cohortIsDisabled() {
        return !this.selectedProgramId || !this.cohorts || this.cohorts.length === 0;
    }

    get form() {
        let index = this.newContactMode ? 1 : 0;
        return this.template.querySelectorAll("lightning-record-edit-form")[index];
    }

    handleSaveClick() {
        if (!this.reportValidity()) {
            return;
        }

        this.isSaving = true;
        this.form.querySelector(".submit").click();
    }

    reportValidity() {
        return [...this.form.querySelectorAll("lightning-input-field")].reduce(
            (validSoFar, inputField) => {
                return validSoFar && inputField.reportValidity();
            },
            true
        );
    }

    handleNewContactSuccess(event) {
        this.selectedContactId = event.detail.id;
        this.isSaving = false;
        this.newContactMode = false;
    }

    handleNewContactClick() {
        this.newContactMode = true;

        setTimeout(this.focusForm.bind(this), 500);
    }

    focusForm() {
        this.form.querySelector("lightning-input-field").focus();
    }

    resetForm() {
        this.newContactMode = false;
        this.showEngagementForm = false;
        this.selectedContactId = undefined;
        this.selectedCohortId = undefined;
        this.selectedProgramId = this.programId;
    }

    loadForm() {
        if (this.engagementFieldSet) {
            this.localEngagementFieldSet = [];
            this.engagementFieldSet.forEach(field => {
                field = Object.assign({}, field);
                if (field.apiName === CONTACT_FIELD.fieldApiName) {
                    if (this.contactId) {
                        field.disabled = true;
                        field.value = this.contactId;
                    } else {
                        field.skip = true;
                        this.allowNewContact = true;
                    }
                } else if (
                    field.apiName === PROGRAM_FIELD.fieldApiName &&
                    this.programId
                ) {
                    field.disabled = true;
                    field.value = this.programId;
                } else if (field.apiName === COHORT_FIELD.fieldApiName) {
                    field.isCohortField = true;
                }

                if (!field.skip) {
                    this.localEngagementFieldSet.push(field);
                }
            });
        }
        this.showEngagementForm = true;
    }

    get rightClass() {
        return this.newContactMode ? "inner right" : "inner right slide";
    }

    get leftClass() {
        return this.newContactMode ? "inner left slide" : "inner left";
    }

    get modalHeader() {
        return this.newContactMode
            ? this.labels.newContact
            : this.labels.newProgramEngagement;
    }

    get cancelButtonLabel() {
        return this.newContactMode ? this.labels.cancelAndBack : this.labels.cancel;
    }
}
