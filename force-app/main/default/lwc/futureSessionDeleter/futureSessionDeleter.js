import { LightningElement, api } from "lwc";
import { format } from "c/util";

import HEADER_LABEL from "@salesforce/label/c.Delete_All_Future_Sessions";
import BODY_TEMPLATE from "@salesforce/label/c.Delete_X_Future_Sessions";

export default class FutureSessionDeleter extends LightningElement {
    @api recordId;
    header = HEADER_LABEL;

    get message() {
        return format(BODY_TEMPLATE, [3]);
    }

    handleDelete(event) {
        console.log(this.recordId);
        console.log("you clicked delete omg!");
        this.dispatchEvent(new CustomEvent("close"));
    }

    handleCancel(event) {
        this.dispatchEvent(new CustomEvent("close"));
    }
}
