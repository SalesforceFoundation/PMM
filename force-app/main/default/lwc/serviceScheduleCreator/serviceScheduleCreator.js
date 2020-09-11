import { LightningElement, wire, api } from "lwc";
import { NavigationMixin } from "lightning/navigation";
import { ProgressSteps } from "./progressSteps";
import { NavigationItems } from "./navigationItems";

import SAVE_LABEL from "@salesforce/label/c.Save";
import SAVE_NEW_LABEL from "@salesforce/label/c.Save_New";
import getDataModel from "@salesforce/apex/ServiceScheduleCreatorController.getDataModel";

export default class ServiceScheduleCreator extends NavigationMixin(LightningElement) {
    @api serviceId;
    isLoaded = false;
    serviceScheduleData;
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

    @wire(getDataModel)
    wireServiceScheduleData(result) {
        if (!result) {
            return;
        }

        if (result.data) {
            this.serviceScheduleData = { ...result.data };
            this.serviceScheduleData.serviceId = this.serviceId;
            this.isLoaded = true;
            this.extractLabels(this.serviceScheduleData.labels.serviceSchedule);
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
        if (this._steps.hasNext) {
            this.processNext();

            return;
        }

        this.reset();
    }

    processNext() {
        if (this.isStep1) {
            this.serviceScheduleData.serviceSchedule = this.template.querySelector(
                "c-new-service-schedule"
            ).serviceSchedule;

            console.log(JSON.stringify(this.serviceScheduleData.serviceSchedule));
        }
        this._steps.next();
        this._currentStep = this._steps.currentStep;
    }

    handleBack() {
        this._steps.back();
        this._currentStep = this._steps.currentStep;
    }

    handleFinish() {
        this.reset();
        this.hideModal();
        this.navigateToList();
    }

    reset() {
        this._steps.restart();
        this._currentStep = undefined;
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
                objectApiName:
                    "$serviceScheduleData.labels.serviceSchedule.objectApiName",
                actionName: "list",
            },
            state: {
                filterName: "Recent",
            },
        });
    }
}
