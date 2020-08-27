import { LightningElement, wire, track, api } from "lwc";
import { NavigationMixin } from "lightning/navigation";
import { getObjectInfo } from "lightning/uiObjectInfoApi";
import { ProgressSteps } from "./progressSteps";
import { NavigationItems } from "./navigationItems";
import { format } from "c/util";

import SCHEDULE_OBJECT from "@salesforce/schema/ServiceSchedule__c";

import NEW_RECORD_LABEL from "@salesforce/label/c.New_Record";
import NEXT_LABEL from "@salesforce/label/c.Next";
import PREVIOUS_LABEL from "@salesforce/label/c.Previous";
import SAVE_LABEL from "@salesforce/label/c.Save";
import SAVE_NEW_LABEL from "@salesforce/label/c.Save_New";
import REVIEW_RECORD_LABEL from "@salesforce/label/c.Review_Record";
import SCHEDULE_INFORMATION_LABEL from "@salesforce/label/c.Service_Schedule_Information";
import SCHEDULE_DATE_TIME_LABEL from "@salesforce/label/c.Service_Schedule_Date_Time";

export default class ServiceScheduleCreator extends NavigationMixin(LightningElement) {
    @track
    labels = {
        newSchedule: NEW_RECORD_LABEL,
        next: NEXT_LABEL,
        previous: PREVIOUS_LABEL,
        save: SAVE_LABEL,
        saveNew: SAVE_NEW_LABEL,
        reviewSchedule: REVIEW_RECORD_LABEL,
        scheduleInfo: SCHEDULE_INFORMATION_LABEL,
        scheduleDateTime: SCHEDULE_DATE_TIME_LABEL,
    };

    @api serviceId;

    _steps = new ProgressSteps()
        .addStep("", this.labels.newSchedule, new NavigationItems().addNext())
        .addStep(
            "",
            this.labels.reviewSessions,
            new NavigationItems().addNext().addPrevious()
        )
        .addStep(
            "",
            this.labels.addParticipants,
            new NavigationItems().addNext().addPrevious()
        )
        .addStep(
            "",
            this.labels.reviewSchedule,
            new NavigationItems()
                .addNext(this.labels.saveNew, "neutral")
                .addPrevious()
                .addFinish(this.labels.save)
        );
    _currentStep;

    @wire(getObjectInfo, { objectApiName: SCHEDULE_OBJECT })
    wireSchedule(result) {
        if (!result) {
            return;
        }
        if (result.data) {
            this.formatLabels(result.data);
        } else if (result.error) {
            console.log(JSON.stringify(result.error));
        }
    }

    formatLabels(data) {
        this.labels.newSchedule = format(this.labels.newSchedule, [data.labelPlural]);
        this.labels.reviewSchedule = format(this.labels.reviewSchedule, [data.label]);
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

    get showStep1() {
        return this.currentStep.value === 0;
    }

    get showStep2() {
        return this.currentStep.value === 1;
    }

    get showStep3() {
        return this.currentStep.value === 2;
    }

    get showStep4() {
        return this.currentStep.value === 3;
    }

    handleNext() {
        if (this._steps.hasNext) {
            this._steps.next();
            this._currentStep = this._steps.currentStep;

            return;
        }

        this.reset();
    }

    handlePrevious() {
        this._steps.previous();
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
                objectApiName: SCHEDULE_OBJECT.objectApiName,
                actionName: "list",
            },
            state: {
                filterName: "Recent",
            },
        });
    }
}
