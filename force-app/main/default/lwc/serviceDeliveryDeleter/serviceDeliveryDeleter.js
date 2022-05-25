/*
 *
 *  * Copyright (c) 2022, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { LightningElement, api, wire } from "lwc";
import { format, handleError } from "c/util";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import deleteSessionsAfter from "@salesforce/apex/ServiceScheduleCreatorController.deleteSessionsAfter";
import getNumberOfDeliveries from "@salesforce/apex/ServiceDeliveryController.getNumberOfServiceDeliveriesForSession";

import HEADER_LABEL from "@salesforce/label/c.Delete_Service_Deliveries";
import MESSAGE_LABEL from "@salesforce/label/c.Delete_Service_Deliveries_Confirm";
import DELETE from "@salesforce/label/c.Delete";
import CANCEL from "@salesforce/label/c.Cancel";
import SUCCESS_LABEL from "@salesforce/label/c.Success";
import DELETE_SUCCESS from "@salesforce/label/c.Delete_Sessions_Success";

export default class ServiceDeliveryDeleter extends LightningElement {
    @api recordId;
    errorMessage;
    isValid = true;
    numberOfDeliveries;

    labels = {
        header: HEADER_LABEL,
        success: SUCCESS_LABEL,
        message: MESSAGE_LABEL,
        delete: DELETE,
        cancel: CANCEL,
        successMessage: DELETE_SUCCESS,
    };

    @wire(getNumberOfDeliveries, { sessionId: "$recordId" })
    wiredNumberOfDeliveries(result) {
        if (!result) {
            return;
        }

        if (result.data) {
            this.numberOfDeliveries = result.data;
        } else if (result.error) {
            console.log(result.error);
        }
    }

    handleDelete() {
        if (this.isValid) {
            deleteSessionsAfter({ scheduleId: this.recordId, startDate: null })
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
        this.isValid = true;

        if (this.isValid) {
            this.errorMessage = undefined;
        } else {
            this.errorMessage = "error"; //this.labels.invalidDate;
        }
    }

    handleCancel() {
        this.dispatchEvent(new CustomEvent("close"));
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
