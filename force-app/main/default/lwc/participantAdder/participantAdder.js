/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { LightningElement, api, wire, track } from "lwc";
import { format } from "c/util";
import { getRecord } from "lightning/uiRecordApi";
import { refreshApex } from "@salesforce/apex";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import getExistingParticipantContactIds from "@salesforce/apex/ServiceScheduleCreatorController.getExistingParticipantContactIds";
import getServiceScheduleModel from "@salesforce/apex/ServiceScheduleCreatorController.getServiceScheduleModel";
import addParticipants from "@salesforce/apex/ServiceScheduleCreatorController.addParticipants";
import checkPermissions from "@salesforce/apex/ServiceScheduleCreatorController.checkAddParticipantsPermissions";

import SUCCESS_LABEL from "@salesforce/label/c.Success";
import SAVE_LABEL from "@salesforce/label/c.Save";
import BACK_WARNING_LABEL from "@salesforce/label/c.Clicking_Back_Button_In_Modal_Warning";
import CANCEL_LABEL from "@salesforce/label/c.Cancel";
import LOADING_LABEL from "@salesforce/label/c.Loading";
import SERVICE_FIELD from "@salesforce/schema/ServiceSchedule__c.Service__c";
import SAVE_SUCCESS from "@salesforce/label/c.Add_Service_Participants_Success";
import NO_PERMISSIONS_MESSAGE_LABEL from "@salesforce/label/c.No_Permission_Message";

export default class ParticipantAdder extends LightningElement {
    @api recordId;
    @track serviceScheduleModel;
    @track existingParticipants;
    serviceId;
    errorMessage;
    hasPermissions;
    labels = {
        save: SAVE_LABEL,
        success: SUCCESS_LABEL,
        backWarning: BACK_WARNING_LABEL,
        cancel: CANCEL_LABEL,
        loading: LOADING_LABEL,
        successMessage: SAVE_SUCCESS,
        noPermissions: NO_PERMISSIONS_MESSAGE_LABEL,
    };

    @wire(checkPermissions, {})
    wiredPermissions(result) {
        if (!(result.data || result.error)) {
            return;
        }
        if (result.data) {
            this.hasPermissions = result.data;
        }
    }

    @wire(getRecord, {
        recordId: "$recordId",
        fields: [SERVICE_FIELD],
    })
    wiredSchedule(result) {
        if (!(result.data || result.error)) {
            return;
        }
        if (result.data) {
            this.serviceId = result.data.fields[SERVICE_FIELD.fieldApiName].value;
        }
    }

    @wire(getServiceScheduleModel, { recordTypeId: null })
    wireServiceScheduleModel(result) {
        if (!result) {
            return;
        }

        if (result.data) {
            this.serviceScheduleModel = JSON.parse(JSON.stringify(result.data));
            this.extractLabels(this.serviceScheduleModel.labels.serviceParticipant);
        } else if (result.error) {
            console.log(JSON.stringify(result.error));
        }
    }

    @wire(getExistingParticipantContactIds, { scheduleId: "$recordId" })
    wiredExistingParticipants(result) {
        if (!(result.data || result.error)) {
            return;
        }

        if (result.data) {
            this.existingParticipants = result; //cache for refreshing
        } else {
            console.log(JSON.stringify(result.error));
        }
    }

    get isLoaded() {
        return (
            this.hasPermissions !== undefined &&
            this.existingParticipants &&
            this.serviceScheduleModel &&
            this.serviceId
        );
    }

    get isSaveDisabled() {
        return !this.isLoaded || !this.hasPermissions;
    }

    handleSave() {
        let participantSelector = this.template.querySelector("c-participant-selector");

        if (
            !(
                participantSelector &&
                participantSelector.newParticipantsProgramEngagements
            )
        ) {
            return;
        }

        addParticipants({
            engagements: participantSelector.newParticipantsProgramEngagements,
            scheduleId: this.recordId,
        })
            .then(() => {
                this.showSuccessToast(
                    participantSelector.newParticipantsProgramEngagements.length
                );
                refreshApex(this.existingParticipants);
                this.closeModal();
            })
            .catch(error => {
                this.error = error;
            });
    }

    handleCancel() {
        this.closeModal();
    }

    extractLabels(labels) {
        if (!labels) {
            return;
        }

        Object.keys(labels).forEach(label => {
            let value = labels[label];
            this.labels[label] = value;
        });
    }

    closeModal() {
        this.reset();
        this.dispatchEvent(new CustomEvent("close"));
    }

    reset() {
        this.hasPermissions = undefined;
        this.serviceScheduleModel = undefined;
        this.existingParticipants = undefined;
        this.serviceId = undefined;
    }

    showSuccessToast(numSaved) {
        const event = new ShowToastEvent({
            title: this.labels.success,
            variant: "success",
            message: format(this.labels.successMessage, [numSaved]),
        });
        this.dispatchEvent(event);
    }
}
