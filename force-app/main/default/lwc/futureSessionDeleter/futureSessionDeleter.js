import { LightningElement, api } from "lwc";
import { format, handleError } from "c/util";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import deleteSessionsAfter from "@salesforce/apex/ServiceScheduleCreatorController.deleteSessionsAfter";

import HEADER_LABEL from "@salesforce/label/c.Delete_Future_Sessions";
import MESSAGE_LABEL from "@salesforce/label/c.Delete_Sessions_After";
import DELETE from "@salesforce/label/c.Delete";
import CANCEL from "@salesforce/label/c.Cancel";
import SUCCESS_LABEL from "@salesforce/label/c.Success";
import DELETE_SUCCESS from "@salesforce/label/c.Delete_Sessions_Success";

export default class FutureSessionDeleter extends LightningElement {
    @api recordId;
    startDate = new Date().toISOString();

    labels = {
        header: HEADER_LABEL,
        success: SUCCESS_LABEL,
        message: MESSAGE_LABEL,
        delete: DELETE,
        cancel: CANCEL,
        successMessage: DELETE_SUCCESS,
    };

    handleDelete() {
        deleteSessionsAfter({ scheduleId: this.recordId, startDate: this.startDate })
            .then(result => {
                this.showSuccessToast(result);
                this.dispatchEvent(new CustomEvent("close"));
            })
            .catch(error => {
                handleError(error);
            });
    }

    handleCancel() {
        this.dispatchEvent(new CustomEvent("close"));
    }

    handleStartDateChange(event) {
        this.startDate = event.detail.value;
    }

    showSuccessToast(numDeleted) {
        const event = new ShowToastEvent({
            title: this.labels.success,
            variant: "success",
            message: format(this.labels.successMessage, [numDeleted]),
        });
        this.dispatchEvent(event);
    }
}
