import { LightningElement, api } from "lwc";
import { format, handleError } from "c/util";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import deleteSessionsAfter from "@salesforce/apex/ServiceScheduleCreatorController.deleteSessionsAfter";
import getToday from "@salesforce/apex/ServiceScheduleCreatorController.getToday";

import HEADER_LABEL from "@salesforce/label/c.Delete_Future_Sessions";
import MESSAGE_LABEL from "@salesforce/label/c.Delete_Sessions_After";
import DELETE from "@salesforce/label/c.Delete";
import CANCEL from "@salesforce/label/c.Cancel";
import SUCCESS_LABEL from "@salesforce/label/c.Success";
import DELETE_SUCCESS from "@salesforce/label/c.Delete_Sessions_Success";
import INVALID_DATE from "@salesforce/label/c.Delete_Sessions_Invalid_Date";

export default class FutureSessionDeleter extends LightningElement {
    @api recordId;
    startDate;
    today;
    errorMessage;
    isValid = true;

    labels = {
        header: HEADER_LABEL,
        success: SUCCESS_LABEL,
        message: MESSAGE_LABEL,
        delete: DELETE,
        cancel: CANCEL,
        successMessage: DELETE_SUCCESS,
        invalidDate: INVALID_DATE,
    };

    connectedCallback() {
        getToday()
            .then(result => {
                this.startDate = result;
                this.today = result;
            })
            .catch(error => {
                handleError(error);
            });
    }

    handleDelete() {
        if (this.isValid) {
            deleteSessionsAfter({ scheduleId: this.recordId, startDate: this.startDate })
                .then(result => {
                    this.showSuccessToast(result);
                    this.dispatchEvent(new CustomEvent("close"));
                })
                .catch(error => {
                    handleError(error);
                });
        }
    }

    checkValidity() {
        let startDate = new Date(this.startDate);
        let today = new Date(this.today);
        this.isValid = startDate >= today;
        if (this.isValid) {
            this.errorMessage = undefined;
        } else {
            this.errorMessage = this.labels.invalidDate;
        }
    }

    handleCancel() {
        this.dispatchEvent(new CustomEvent("close"));
    }

    handleStartDateChange(event) {
        this.startDate = event.detail.value;
        this.checkValidity();
    }

    showSuccessToast(numDeleted) {
        const event = new ShowToastEvent({
            title: this.labels.success,
            variant: "success",
            message: format(this.labels.successMessage, [numDeleted]),
        });
        this.dispatchEvent(event);
    }

    get isDisabled() {
        return !this.isValid;
    }
}
