import { api, LightningElement } from "lwc";

export default class VisualPicker extends LightningElement {
    @api title;
    @api content;
    @api buttonLabel;
    @api buttonName;
    @api iconName;

    handleClick(event) {
        this.dispatchEvent(new CustomEvent("select", { detail: event.target.name }));
    }
}
