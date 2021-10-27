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
import { getObjectInfo, getPicklistValues } from "lightning/uiObjectInfoApi";
import { handleError, showToast } from "c/util";
import getProgramCohortsFromProgramId from "@salesforce/apex/ProgramController.getProgramCohortsFromProgramId";
import getFieldSetByObjectKey from "@salesforce/apex/ProgramController.getFieldSetByObjectKey";
import PROGRAM_ENGAGEMENT_OBJECT from "@salesforce/schema/ProgramEngagement__c";
import CONTACT_OBJECT from "@salesforce/schema/Contact";
import CONTACT_FIELD from "@salesforce/schema/ProgramEngagement__c.Contact__c";
import PROGRAM_FIELD from "@salesforce/schema/ProgramEngagement__c.Program__c";
import COHORT_FIELD from "@salesforce/schema/ProgramEngagement__c.ProgramCohort__c";
import STAGE_FIELD from "@salesforce/schema/ProgramEngagement__c.Stage__c";
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

const ACTIVE = "Active";
const ENROLLED = "Enrolled";
const ALLOWED_STAGES = [ACTIVE, ENROLLED];
const INNER_RIGHT_CLASS = "inner right";
const INNER_LEFT_CLASS = "inner left";
const SLIDE_CLASS = "slide";

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
    @track engagementFieldSet;
    @track localEngagementFieldSet = [];
    @track contactFieldSet;
    @track cohorts;
    @track cohortOptions = [];
    @track stageOptions = [];
    recordTypeId;
    selectedCohortId;
    selectedStage;
    defaultStage;
    allowNewContact = false;
    isSaving = false;
    hasError = false;
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
    engagementObjectApiName = PROGRAM_ENGAGEMENT_OBJECT;
    contactObjectApiName = CONTACT_OBJECT;

    @wire(CurrentPageReference) pageRef;

    @wire(getFieldSetByObjectKey)
    wireFieldSets({ data, error }) {
        if (data) {
            this.engagementFieldSet = data.engagementFieldSet;
            this.contactFieldSet = data.contactFieldSet;
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

    @wire(getObjectInfo, { objectApiName: PROGRAM_ENGAGEMENT_OBJECT })
    wiredEngagementInfo({ error, data }) {
        if (data) {
            this.recordTypeId = data.defaultRecordTypeId;
        }
        if (error) {
            console.log(error);
        }
    }

    @wire(getPicklistValues, {
        recordTypeId: "$recordTypeId",
        fieldApiName: STAGE_FIELD,
    })
    wiredStageValues({ error, data }) {
        if (data && data.values) {
            let defaultValue = data.defaultValue;
            if (data.defaultValue && ALLOWED_STAGES.includes(defaultValue.value)) {
                this.defaultStage = defaultValue.value;
            } else {
                // If the customer removes the Active status then we will fall back
                // to enrolled. If they do not have enrolled the record will fail to
                // save. This is working as designed until we allow custom statuses
                // for this component. It most be either Active or Enrolled.
                this.defaultStage = data.values.includes(ALLOWED_STAGES[0])
                    ? ALLOWED_STAGES[0]
                    : ALLOWED_STAGES[1];
            }
            this.selectedStage = this.defaultStage;

            data.values.forEach(entry => {
                this.stageOptions.push({ label: entry.label, value: entry.value });
            });
        } else if (error) {
            console.log(error);
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
        this.hasError = true;
    }

    handleFieldChange(event) {
        if (event.target.fieldName === PROGRAM_FIELD.fieldApiName) {
            this.selectedProgramId = event.detail.value[0];
            this.selectedCohortId = undefined;
        }
    }

    handleFormChange() {
        if (!this.hasError) {
            return;
        }

        this.form.querySelector("lightning-messages").setError(undefined);
        this.hasError = false;
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

    handleStageChange(event) {
        this.selectedStage = event.detail.value;
    }

    handleSubmitEngagement(event) {
        this.isSaving = true;
        let fields = event.detail.fields;

        fields[COHORT_FIELD.fieldApiName] = this.selectedCohortId;
        fields[STAGE_FIELD.fieldApiName] = this.selectedStage;

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
        this.handleFormChange();
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
        this.selectedStage = this.defaultStage;
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
                    field.isCombobox = true;
                } else if (field.apiName === STAGE_FIELD.fieldApiName) {
                    // allowNewContact will be false when creating individual Service delivery records from BSDT.
                    // This will be true when using the participant selector component from group BSDT and service schedule wizard.
                    if (this.allowNewContact) {
                        field.isStageField = true;
                        field.isCombobox = true;
                        this.stageOptions = this.stageOptions.filter(stage =>
                            ALLOWED_STAGES.includes(stage.value)
                        );
                    }
                }

                if (!field.skip) {
                    this.localEngagementFieldSet.push(field);
                }
            });
        }
        this.showEngagementForm = true;
    }

    get rightClass() {
        return this.newContactMode
            ? INNER_RIGHT_CLASS
            : `${INNER_RIGHT_CLASS} ${SLIDE_CLASS}`;
    }

    get leftClass() {
        return this.newContactMode
            ? `${INNER_LEFT_CLASS} ${SLIDE_CLASS}`
            : INNER_LEFT_CLASS;
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
