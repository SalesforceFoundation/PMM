import { LightningElement, api, track } from "lwc";
import { reduceErrors } from "c/util";
import DEFAULT_FRIENDLY_MESSAGE from "@salesforce/label/c.errorPanel_DefaultMessage";
import SHOW_DETAILS from "@salesforce/label/c.Util_ShowDetails";

export default class ErrorPanel extends LightningElement {
    /** Generic / user-friendly message */
    @api friendlyMessage = DEFAULT_FRIENDLY_MESSAGE;

    @track viewDetails = false;

    /** Single or array of LDS errors */
    @api errors;

    labels = {
        showDetails: SHOW_DETAILS,
    };

    get errorMessages() {
        return reduceErrors(this.errors);
    }

    handleCheckboxChange(event) {
        this.viewDetails = event.target.checked;
    }
}
