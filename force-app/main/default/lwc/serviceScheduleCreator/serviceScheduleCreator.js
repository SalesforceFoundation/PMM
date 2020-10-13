/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { LightningElement, wire, api, track } from "lwc";
import { NavigationMixin } from "lightning/navigation";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { handleError } from "c/util";
import { ProgressSteps } from "./progressSteps";
import { NavigationItems } from "./navigationItems";
import getServiceScheduleModel from "@salesforce/apex/ServiceScheduleCreatorController.getServiceScheduleModel";
import persist from "@salesforce/apex/ServiceScheduleCreatorController.persist";

import SAVE_LABEL from "@salesforce/label/c.Save";
import SAVE_NEW_LABEL from "@salesforce/label/c.Save_New";
import SUCCESS_LABEL from "@salesforce/label/c.Success";
import BACK_WARNING_LABEL from "@salesforce/label/c.Clicking_Back_Button_In_Modal_Warning";
import GO_BACK_LABEL from "@salesforce/label/c.Go_Back";
import BACK_LABEL from "@salesforce/label/c.Back";
import CANCEL_LABEL from "@salesforce/label/c.Cancel";
import LOADING_LABEL from "@salesforce/label/c.Loading";
import SERVICE_FIELD from "@salesforce/schema/ServiceSchedule__c.Service__c";

export default class ServiceScheduleCreator extends NavigationMixin(LightningElement) {
    @track hideSpinner = false;
    isLoaded = false;
    serviceScheduleModel;
    originalModel;
    labels = {
        save: SAVE_LABEL,
        saveNew: SAVE_NEW_LABEL,
        success: SUCCESS_LABEL,
        backWarning: BACK_WARNING_LABEL,
        goBack: GO_BACK_LABEL,
        back: BACK_LABEL,
        cancel: CANCEL_LABEL,
        loading: LOADING_LABEL,
    };

    _serviceId;
    _currentStep;
    _steps = new ProgressSteps();
    _serviceSchedules = [];

    @wire(getServiceScheduleModel)
    wireServiceScheduleModel(result) {
        if (!result) {
            return;
        }

        if (result.data) {
            this.originalModel = result.data;
            this.init();
            this.extractLabels(this.serviceScheduleModel.labels.serviceSchedule);
            this.addSteps();
            this.isLoaded = true;
            this.hideSpinner = true;
        } else if (result.error) {
            console.log(JSON.stringify(result.error));
        }
    }

    extractLabels(labels) {
        if (!labels) {
            return;
        }

        Object.keys(labels).forEach(label => {
            let value = labels[label];
            this.labels[label] = value;
        });

        for (const key in labels) {
            if ({}.hasOwnProperty.call(labels, key)) {
                let value = labels[key];
                this.labels[key] = value;
            }
        }
    }

    addSteps() {
        this._steps
            .addStep("", this.labels.newSchedule, new NavigationItems().addNext())
            .addStep(
                "",
                this.serviceScheduleModel.labels.serviceSession.reviewSessions,
                new NavigationItems().addNext().addBack()
            )
            .addStep(
                "",
                this.serviceScheduleModel.labels.serviceParticipant
                    .addServiceParticipants,
                new NavigationItems().addNext().addBack()
            )
            .addStep(
                "",
                this.labels.reviewSchedule,
                new NavigationItems()
                    .addNext(this.labels.saveNew, "neutral")
                    .addBack()
                    .addFinish(this.labels.save)
            );
    }

    @api
    get serviceId() {
        return this._serviceId;
    }

    set serviceId(value) {
        this._serviceId = value;

        if (!this.serviceScheduleModel) {
            return;
        }

        this.serviceScheduleModel.serviceSchedule[
            SERVICE_FIELD.fieldApiName
        ] = this._serviceId;
    }

    get steps() {
        return this._steps.all;
    }

    get currentStep() {
        if (!this._steps) {
            return undefined;
        }

        if (!this._currentStep) {
            this._currentStep = this._steps.currentStep;
        }

        return this._currentStep;
    }

    get isStep1() {
        return this.isLoaded && this.currentStep.value === 0;
    }

    get isStep2() {
        return this.currentStep.value === 1;
    }

    get isStep3() {
        return this.currentStep.value === 2;
    }

    get isStep4() {
        return this.currentStep.value === 3;
    }

    handleNext() {
        if (this.isStep1) {
            this.processNewServiceSchedule();
        } else if (this.isStep2) {
            this.processSessions();
        } else if (this.isStep3) {
            this.processServiceParticipants();
        } else if (this.isStep4) {
            this.save(true);
        }
    }

    save(isSaveAndNew) {
        persist({ model: this.serviceScheduleModel })
            .then(result => {
                this._serviceSchedules.push(result.serviceSchedule);
                this.showSuccessToast();

                if (isSaveAndNew) {
                    this.init();
                    this.isLoaded = true;
                    this.hideSpinner = true;
                } else {
                    this.handleClose();
                }
            })
            .catch(error => {
                handleError(error);
            });
    }

    showSuccessToast() {
        const event = new ShowToastEvent({
            title: this.labels.success,
            variant: "success",
        });
        this.dispatchEvent(event);
    }

    setNextStep() {
        this._steps.next();
        this._currentStep = this._steps.currentStep;
    }

    processNewServiceSchedule() {
        let newServiceSchedule = this.template.querySelector("c-new-service-schedule");

        if (!(newServiceSchedule && newServiceSchedule.reportValidity())) {
            return;
        }

        this.hideSpinner = false;
        this.serviceScheduleModel.serviceSchedule = newServiceSchedule.serviceSchedule;
        this._serviceId = this.serviceScheduleModel.serviceSchedule[
            SERVICE_FIELD.fieldApiName
        ];

        this.setNextStep();
    }

    processSessions() {
        let reviewSessionsCmp = this.template.querySelector("c-review-sessions");

        if (!reviewSessionsCmp) {
            return;
        }

        this.hideSpinner = false;
        this.serviceScheduleModel.serviceSessions =
            reviewSessionsCmp.serviceScheduleModel.serviceSessions;
        this.serviceScheduleModel.serviceSchedule =
            reviewSessionsCmp.serviceScheduleModel.serviceSchedule;
        this.setNextStep();
    }

    processServiceParticipants() {
        let participantSelector = this.template.querySelector("c-participant-selector");

        if (!(participantSelector && participantSelector.selectedParticipants)) {
            return;
        }

        this.hideSpinner = false;
        this.serviceScheduleModel.selectedParticipants =
            participantSelector.selectedParticipants;

        this.setNextStep();
    }

    handleBack() {
        if (this.isStep2 || this.isStep3) {
            this.showBackWarning();
            return;
        }
        this.setBackStep();
    }

    handleContinueBack() {
        this.closeBackWarningModal();
        if (this.isStep2) {
            this.serviceScheduleModel.serviceSessions = this.originalModel.serviceSessions;
        } else if (this.isStep3) {
            this.hideSpinner = false;
            this.serviceScheduleModel.selectedParticipants = this.originalModel.selectedParticipants;
        }

        this.setBackStep();
    }

    setBackStep() {
        this._steps.back();
        this._currentStep = this._steps.currentStep;
    }

    showBackWarning() {
        const modal = this.template.querySelector("c-modal c-modal");
        modal.show();
    }

    closeBackWarningModal() {
        const modal = this.template.querySelector("c-modal c-modal");
        modal.hide();
    }

    handleFinish() {
        this.save(false);
    }

    handleClose() {
        this.hideModal();
        this.navigate();
    }

    init() {
        this.isLoaded = false;
        this.hideSpinner = false;
        this._steps.restart();
        this._currentStep = undefined;
        this.serviceScheduleModel = JSON.parse(JSON.stringify(this.originalModel));
        this.serviceScheduleModel.serviceSchedule[
            SERVICE_FIELD.fieldApiName
        ] = this.serviceId;
    }

    showModal() {
        const modal = this.template.querySelector("c-modal");
        modal.show();
    }

    hideModal() {
        const modal = this.template.querySelector("c-modal");
        modal.hide();
    }

    navigate() {
        if (this._serviceSchedules.length) {
            this.navigateToRecord(
                this._serviceSchedules[this._serviceSchedules.length - 1].Id,
                this.labels.objectApiName
            );
        } else if (this._serviceId) {
            this.navigateToRecord(this._serviceId, this.labels.serviceObjectApiName);
        } else {
            this.navigateToList();
        }
    }

    navigateToRecord(recordId, objectApiName) {
        this[NavigationMixin.Navigate]({
            type: "standard__recordPage",
            attributes: {
                recordId: recordId,
                objectApiName: objectApiName,
                actionName: "view",
            },
        });
    }

    navigateToList() {
        this[NavigationMixin.Navigate]({
            type: "standard__objectPage",
            attributes: {
                objectApiName: this.labels.objectApiName,
                actionName: "list",
            },
            state: {
                filterName: "Recent",
            },
        });
    }

    handleLoaded(event) {
        this.hideSpinner = event.detail;
    }
}
