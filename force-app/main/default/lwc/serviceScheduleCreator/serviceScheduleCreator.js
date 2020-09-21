import { LightningElement, wire, api } from "lwc";
import { NavigationMixin } from "lightning/navigation";
import { ProgressSteps } from "./progressSteps";
import { NavigationItems } from "./navigationItems";
import getServiceScheduleModel from "@salesforce/apex/ServiceScheduleCreatorController.getServiceScheduleModel";
import persist from "@salesforce/apex/ServiceScheduleCreatorController.persist";

import SAVE_LABEL from "@salesforce/label/c.Save";
import SAVE_NEW_LABEL from "@salesforce/label/c.Save_New";
import SERVICE_FIELD from "@salesforce/schema/ServiceSchedule__c.Service__c";

export default class ServiceScheduleCreator extends NavigationMixin(LightningElement) {
    @api serviceId;
    isLoaded = false;
    serviceScheduleModel;
    originalModel;
    labels = {
        save: SAVE_LABEL,
        saveNew: SAVE_NEW_LABEL,
    };

    // TODO: fix labels for each step
    _steps = new ProgressSteps()
        .addStep("", this.labels.newSchedule, new NavigationItems().addNext())
        .addStep(
            "",
            this.labels.reviewSessions,
            new NavigationItems().addNext().addBack()
        )
        .addStep(
            "",
            this.labels.addParticipants,
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
    _currentStep;

    @wire(getServiceScheduleModel)
    wireServiceScheduleModel(result) {
        if (!result) {
            return;
        }

        if (result.data) {
            this.originalModel = result;
            this.init();
            this.extractLabels(this.serviceScheduleModel.labels.serviceSchedule);
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
            // Set next will only happen in the processNewServiceSchedule if the record is valid and we can proceed.
        } else if (this.isStep2) {
            this.processSessions();
        } else if (this.isStep3) {
            this.setNextStep();
        } else if (this.isStep4) {
            this.save();
        }
    }

    save() {
        persist({ model: this.serviceScheduleModel })
            .then(() => {
                this.init();
            })
            .catch(error => {
                // TODO: throw error
                console.log(JSON.stringify(error));
            });
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

        this.serviceScheduleModel.serviceSchedule = newServiceSchedule.serviceSchedule;
        this.serviceId = this.serviceScheduleModel.serviceSchedule[
            SERVICE_FIELD.fieldApiName
        ];
        this.setNextStep();
    }

    processSessions() {
        let reviewSessionsCmp = this.template.querySelector("c-review-sessions");

        if (!reviewSessionsCmp) {
            return;
        }

        this.serviceScheduleModel.serviceSessions = reviewSessionsCmp.serviceSessions;
        this.setNextStep();
    }

    handleBack() {
        this._steps.back();
        this._currentStep = this._steps.currentStep;
    }

    handleFinish() {
        this.save();
        this.handleClose();
    }

    handleClose() {
        this.hideModal();
        this.navigateToList();
    }

    init() {
        this.isLoading = false;
        this._steps.restart();
        this._currentStep = undefined;
        this.serviceScheduleModel = { ...this.originalModel.data };
        this.serviceScheduleModel.serviceSchedule = {
            ...this.originalModel.data.serviceSchedule,
        };
        this.serviceScheduleModel.serviceSchedule[
            SERVICE_FIELD.fieldApiName
        ] = this.serviceId;
        this.isLoaded = true;
    }

    showModal() {
        const modal = this.template.querySelector("c-modal");
        modal.show();
    }

    hideModal() {
        const modal = this.template.querySelector("c-modal");
        modal.hide();
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
}
