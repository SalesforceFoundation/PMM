import { LightningElement, api } from "lwc";

export default class ProgressNavigator extends LightningElement {
    @api steps;
    @api currentStep;
    @api isPreviousDisabled;
    @api isNextDisabled;
    @api isFinishDisabled;

    handleButtonClick(event) {
        this.dispatchEvent(new CustomEvent("navigate", { detail: event.target.name }));
    }
}
