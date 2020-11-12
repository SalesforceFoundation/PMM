import { LightningElement, api } from "lwc";
import skipToStartLink from "@salesforce/label/c.SkipToStartLink";
import skipToEndLink from "@salesforce/label/c.SkipToEndLink";

export default class SkipLinks extends LightningElement {
    labels = {
        skipToEndLink,
        skipToStartLink,
    };

    ENTER = "Enter"; // keyboard constant, not label

    @api
    handleSkipToEndClick() {
        this.template.querySelector(".end-link").focus();
    }

    @api
    handleSkipToStartClick() {
        this.template.querySelector(".start-link").focus();
    }

    handleSkipToStartKeyboard(event) {
        let key = event.key || event.keyCode;
        if (key === this.ENTER || key === " " || key === 13 || key === 32) {
            this.handleSkipToStartClick();
        }
    }

    handleSkipToEndKeyboard(event) {
        let key = event.key || event.keyCode;
        if (key === this.ENTER || key === " " || key === 13 || key === 32) {
            this.handleSkipToEndClick();
        }
    }
}
