import { LightningElement, api } from "lwc";

import NEXT_LABEL from "@salesforce/label/c.Next";
import PREVIOUS_LABEL from "@salesforce/label/c.Previous";
import SAVE_LABEL from "@salesforce/label/c.Save";
import SAVE_NEW_LABEL from "@salesforce/label/c.Save_New";

const BRAND = "brand";
const NEUTRAL = "neutral";

export default class Footer extends LightningElement {
    @api stages;
    @api currentStage;
    @api availableActions;

    get currentStep() {
        return this.currentStage && this.currentStage.name
            ? this.currentStage.name
            : undefined;
    }

    get showBack() {
        return (
            this.availableActions &&
            this.availableActions.find(action => action === "BACK")
        );
    }

    get showNext() {
        return (
            this.availableActions &&
            this.availableActions.find(action => action === "NEXT" || action === "FINISH")
        );
    }

    get showFinish() {
        return (
            this.availableActions &&
            this.availableActions.find(action => action === "FINISH")
        );
    }

    get back() {
        return { label: PREVIOUS_LABEL, variant: NEUTRAL };
    }

    get next() {
        return {
            label: this.showFinish ? SAVE_NEW_LABEL : NEXT_LABEL,
            variant: this.showFinish ? NEUTRAL : BRAND,
        };
    }

    get finish() {
        return { label: SAVE_LABEL, variant: BRAND };
    }

    handleNavigate(event) {
        this.dispatchEvent(
            new CustomEvent("navigate", { detail: { name: event.target.name } })
        );
    }
}
