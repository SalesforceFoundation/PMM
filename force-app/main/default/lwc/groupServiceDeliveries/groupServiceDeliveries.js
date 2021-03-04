import { LightningElement } from "lwc";

import { ProgressSteps } from "c/progressSteps";
import { NavigationItems } from "c/navigationItems";

export default class GroupServiceDeliveries extends LightningElement {
    _steps;
    _currentStep;

    get steps() {
        if (this._steps) {
            return this._steps.all;
        }
        this.createSteps();
        return this._steps.all;
    }

    get currentStep() {
        if (this._currentStep) {
            return this._currentStep;
        }

        this._currentStep = this._steps.currentStep;
        return this._currentStep;
    }

    get isStep1() {
        return this.currentStep && this.currentStep.value === 0;
    }

    get isStep2() {
        return this.currentStep && this.currentStep.value === 1;
    }

    get isStep3() {
        return this.currentStep && this.currentStep.value === 2;
    }

    createSteps() {
        this._steps = new ProgressSteps();
        this._steps
            .addStep("", "Selection")
            .addStep("", "Service Selections", new NavigationItems().addNext())
            .addStep("", "Select Contacts", new NavigationItems().addNext().addBack());
    }

    handleOption1() {
        // nav to step 2
    }

    handleOption2() {
        this.dispatchEvent(new CustomEvent("hide"));
    }
}
