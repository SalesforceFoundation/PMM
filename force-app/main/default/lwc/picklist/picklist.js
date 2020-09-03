import { LightningElement, api, track } from "lwc";

const UNSELECTED_VARIANT = "neutral";
const SELECTED_VARIANT = "brand";

export default class Picklist extends LightningElement {
    // Expects an object with a label and the salesforce picklistValue object
    @api picklist;
    @api type = "radio";
    @api multiSelect = false;

    @track _options;

    get options() {
        if (this._options) {
            return this._options;
        }

        if (!this.picklist) {
            return undefined;
        }

        this._options = this.picklist.values.map(value => {
            return { value: value.value, label: value.label };
        });

        return this._options;
    }

    get label() {
        return this.picklist && this.picklist.label ? this.picklist.label : undefined;
    }

    get selection() {
        return this._options.filter(option => option.isSelected);
    }

    handleChange(event) {
        this._options.forEach(option => {
            option.isSelected = option.value === event.detail.value;
        });

        this.dispatchSelection();
    }

    handleMultiSelectClick(event) {
        this._options.forEach(option => {
            if (option.value === event.target.name) {
                option.isSelected = !option.isSelected;
                option.variant = option.isSelected
                    ? SELECTED_VARIANT
                    : UNSELECTED_VARIANT;
            }
        });

        this.dispatchSelection();
    }

    dispatchSelection() {
        this.dispatchEvent(new CustomEvent("select", { detail: this.selection }));
    }
}
