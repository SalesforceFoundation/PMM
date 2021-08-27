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
import { handleError, showToast } from "c/util";
import getFieldSet from "@salesforce/apex/FieldSetController.getFieldSetForLWC";
import getProgramCohortsFromProgramId from "@salesforce/apex/ProgramController.getProgramCohortsFromProgramId";
import PROGRAMENGAGEMENT_OBJECT from "@salesforce/schema/ProgramEngagement__c";
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

const CREATE_PROGRAM_ENGAGEMENT_FIELD_SET = "CreateProgramEngagement";
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
    @api fieldSet;
    @track localFieldSet = [];
    @track cohorts;
    @track cohortOptions = [];
    selectedCohortId;
    allowNewContact = false;
    isSaving = false;
    selectedProgramId;
    labels = { newProgramEngagement, cancel, success, saveMessage, save };
    objectApiName = PROGRAMENGAGEMENT_OBJECT;

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
        this.handleLoad();
        this.template.querySelector("c-modal").show();
    }

    @api
    hideModal() {
        this.template.querySelector("c-modal").hide();
        this.resetForm();
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

    handleSubmit(event) {
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
                } else if (
                    field.apiName === PROGRAM_FIELD.fieldApiName &&
                    this.programId
                ) {
                    field.disabled = true;
                } else if (field.apiName === COHORT_FIELD.fieldApiName) {
                    field.isCohortField = true;
                }

                this.applyFieldDefault(field, API_NAME_KEY);

                if (!field.skip) {
                    this.localFieldSet.push(field);
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
}
