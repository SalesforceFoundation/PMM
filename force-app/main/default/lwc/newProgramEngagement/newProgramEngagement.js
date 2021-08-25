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
import getCohortsForProgram from "@salesforce/apex/ProgramController.getCohortsForProgram";
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
const FIELD_NAME_KEY = "fieldName";
const API_NAME_KEY = "apiName";

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
    @api peFieldSet;
    @track localPeFieldSet = [];
    @track contactFieldSet;
    @track cohorts;
    @track cohortOptions = [];
    selectedCohortId;
    hasCohortField = false;
    allowNewContact = false;
    isSaving = false;
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
    objectApiName = PROGRAMENGAGEMENT_OBJECT;
    contactObjectApiName = CONTACT_OBJECT;
    newContactMode = false;

    @wire(CurrentPageReference) pageRef;

    @wire(getFieldSet, {
        objectName: PROGRAMENGAGEMENT_OBJECT.objectApiName,
        fieldSetName: CREATE_PROGRAM_ENGAGEMENT_FIELD_SET,
    })
    wiredPeFields({ error, data }) {
        if (data) {
            this.peFieldSet = data;
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

    @wire(getCohortsForProgram, {
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
        this.handleLoad();
        this.template.querySelector("c-modal").show();
        setTimeout(this.focusPEForm.bind(this), 400);
    }

    @api
    hideModal() {
        this.template.querySelector("c-modal").hide();
        this.resetForm();
    }

    handleCancel() {
        if (this.newContactMode) {
            this.newContactMode = false;
            this.focusPEForm();
        } else {
            this.handleClose();
        }
    }

    handleClose() {
        this.hideModal();
        this.dispatchEvent(new CustomEvent("cancel"));
    }

    handleSuccess(event) {
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
        }
    }

    setCohortOptions() {
        // can't do this since the handleLoad function isn't done running and we don't yet know if the cohort field is present.
        // leaving it here for further discussion.
        // if (!this.hasCohortField) {
        //     return;
        // }
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

    handleSubmit(event) {
        this.isSaving = true;
        let fields = event.detail.fields;

        if (this.selectedCohortId) {
            fields[COHORT_FIELD.fieldApiName] = this.selectedCohortId;
        }

        this.template.querySelector("lightning-record-edit-form").submit(fields);
    }

    get cohortIsDisabled() {
        return !this.selectedProgramId;
    }

    handleSaveClick() {
        this.isSaving = true;
        let submitButton = this.newContactMode
            ? this.template.querySelector(".contact-submit")
            : this.template.querySelector(".pe-submit");
        if (submitButton) {
            submitButton.click();
        }
    }

    handleNewContactSuccess(event) {
        this.selectedContactId = event.detail.id;
        this.isSaving = false;
        this.newContactMode = false;
        this.focusPEForm();
    }

    handleNewContactClick() {
        this.newContactMode = true;
        setTimeout(this.focusContactForm.bind(this), 500);
    }

    focusPEForm() {
        let contactSelect = this.template.querySelector(".contactSelect");
        let firstField = contactSelect
            ? contactSelect
            : this.template.querySelector(".yesfocus");

        firstField.focus();
    }

    focusContactForm() {
        this.template.querySelector(".contactForm").focus();
    }

    resetForm() {
        const allInputFields = this.template.querySelectorAll("lightning-input-field");
        if (allInputFields) {
            allInputFields.forEach(field => {
                field.reset();
                this.applyFieldDefault(field, FIELD_NAME_KEY);
            });
        }
    }

    applyFieldDefault(field, key) {
        if (this.defaults[field[key]]) {
            field.value = this.defaults[field[key]];
        }
    }

    handleLoad() {
        if (this.peFieldSet) {
            this.localPeFieldSet = [];
            this.peFieldSet.forEach(field => {
                field = Object.assign({}, field);
                if (field.apiName === CONTACT_FIELD.fieldApiName) {
                    if (this.contactId) {
                        field.disabled = true;
                    } else {
                        field.skip = true;
                        this.allowNewContact = true;
                    }
                } else if (
                    field.apiName === PROGRAM_FIELD.fieldApiName &&
                    this.programId
                ) {
                    field.disabled = true;
                } else if (field.apiName === COHORT_FIELD.fieldApiName) {
                    this.hasCohortField = true;
                    field.isCohortField = true;
                }

                if (field.apiName === CONTACT_FIELD.fieldApiName && this.contactId) {
                    field.class = "nofocus";
                } else {
                    field.class = "yesfocus";
                }

                this.applyFieldDefault(field, API_NAME_KEY);

                if (!field.skip) {
                    this.localPeFieldSet.push(field);
                }
            });
        }
    }

    get defaults() {
        let defaultValues = {};
        defaultValues[PROGRAM_FIELD.fieldApiName] = this.programId;
        defaultValues[CONTACT_FIELD.fieldApiName] = this.contactId;

        return defaultValues;
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
