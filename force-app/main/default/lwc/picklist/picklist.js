import { LightningElement, api, wire, track } from "lwc";
import { getObjectInfo, getPicklistValues } from "lightning/uiObjectInfoApi";

const UNSELECTED_VARIANT = "neutral";
const SELECTED_VARIANT = "brand";

export default class Picklist extends LightningElement {
    @api objectApiName;
    @api fieldApiName;
    @api multiSelect = false;
    @api recordTypeId;

    fieldPath;
    field;

    @track
    options;

    get selection() {
        return this.options.filter(option => option.isSelected);
    }

    connectedCallback() {
        this.fieldPath = `${this.objectApiName}.${this.fieldApiName}`;
    }

    @wire(getObjectInfo, { objectApiName: "$objectApiName" })
    wireObject(result) {
        if (!result) {
            return;
        }

        if (result.data) {
            this.recordTypeId = this.recordTypeId
                ? this.recordTypeId
                : result.data.defaultRecordTypeId;
            this.field = result.data.fields[this.fieldApiName]
                ? result.data.fields[this.fieldApiName]
                : undefined;
        } else if (result.error) {
            console.log(JSON.stringify(result.error));
        }
    }

    @wire(getPicklistValues, {
        recordTypeId: "$recordTypeId",
        fieldApiName: "$fieldPath",
    })
    wireOptions(result) {
        if (!result || !this.fieldApiName) {
            return;
        }

        if (result.data) {
            this.extractOptions(result.data);
        } else if (result.error) {
            console.log(JSON.stringify(result.error));
        }
    }

    extractOptions(data) {
        this.options = data.values.map(value => {
            return { name: value.value, label: value.label };
        });
    }

    handleClick(event) {
        if (this.multiSelect) {
            this.handleMultiSelection(event);
        } else {
            this.handleSelection(event);
        }
        this.dispatchEvent(new CustomEvent("select", { detail: this.selection }));
    }

    handleMultiSelection(event) {
        if (!event || !event.target) {
            return;
        }

        this.options.forEach(option => {
            if (option.isSelected && option.name === event.target.name) {
                option.isSelected = false;
                option.variant = UNSELECTED_VARIANT;
            } else if (option.name === event.target.name) {
                option.isSelected = true;
                option.variant = SELECTED_VARIANT;
            }
        });
    }

    handleSelection(event) {
        if (!event || !event.target) {
            return;
        }

        this.options.forEach(option => {
            option.isSelected = option.name === event.target.name;
            option.variant =
                option.name === event.target.name ? SELECTED_VARIANT : UNSELECTED_VARIANT;
        });
    }
}
