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
import { refreshApex } from "@salesforce/apex";
import deleteServiceDeliveries from "@salesforce/apex/ServiceDeliveryController.deleteServiceDeliveriesForSession";
import getNumberOfDeliveries from "@salesforce/apex/ServiceDeliveryController.getNumberOfServiceDeliveriesForSession";
import canDeleteServiceDeliveries from "@salesforce/apex/ServiceDeliveryController.canDeleteServiceDeliveries";

import HEADER_LABEL from "@salesforce/label/c.Delete_Service_Deliveries";
import MESSAGE_LABEL from "@salesforce/label/c.Delete_Service_Deliveries_Confirm";
import DELETE from "@salesforce/label/c.Delete";
import CANCEL from "@salesforce/label/c.Cancel";
import SUCCESS_LABEL from "@salesforce/label/c.Success";
import DELETE_SUCCESS from "@salesforce/label/c.Delete_Sessions_Success";
import NO_DELETE_PERMS from "@salesforce/label/c.Delete_Operation_Exception";

export default class ServiceDeliveryDeleter extends LightningElement {
    @api recordId;
    errorMessage;
    numberOfDeliveries = 0;
    hasAccessToDelete = false;
    wiredNumberOfDeliveriesResult;
    permsLoaded = false;
    numberOfDeliveriesLoaded = false;

    labels = {
        header: HEADER_LABEL,
        success: SUCCESS_LABEL,
        message: MESSAGE_LABEL,
        delete: DELETE,
        cancel: CANCEL,
        successMessage: DELETE_SUCCESS,
        noDeleteAccessMessage: NO_DELETE_PERMS,
    };

    get confirmationMessage() {
        return format(MESSAGE_LABEL, [this.numberOfDeliveries]);
    }

    @wire(canDeleteServiceDeliveries)
    wiredCanDeleteServiceDeliveries(result) {
        this.permsLoaded = false;
        if (!result) {
            return;
        }

        if (result.data !== undefined) {
            this.hasAccessToDelete = result.data;
            if (this.hasAccessToDelete !== true) {
                this.errorMessage = this.labels.noDeleteAccessMessage;
            }
        } else if (result.error && result.error.body) {
            this.errorMessage = result.error.body;
        } else if (result.error) {
            console.log(result.error);
        }
        this.permsLoaded = true;
    }

    @wire(getNumberOfDeliveries, { sessionId: "$recordId" })
    wiredNumberOfDeliveries(result) {
        this.numberOfDeliveriesLoaded = false;
        if (!result) {
            return;
        }
        this.wiredNumberOfDeliveriesResult = result;

        if (result.data) {
            this.numberOfDeliveries = result.data;
        } else if (result.error) {
            console.log(result.error);
        }
        this.numberOfDeliveriesLoaded = true;
    }

    handleDelete() {
        if (this.hasServiceDeliveries) {
            deleteServiceDeliveries({ sessionId: this.recordId })
                .then(result => {
                    this.showSuccessToast(result);
                    this.dispatchEvent(new CustomEvent("close"));
                    refreshApex(this.wiredNumberOfDeliveriesResult);
                })
                .catch(error => {
                    handleError(error);
                });
        }
    }

    handleCancel() {
        this.dispatchEvent(new CustomEvent("cancel"));
    }

    showSuccessToast(numDeleted) {
        const event = new ShowToastEvent({
            title: this.labels.success,
            variant: "success",
            message: format(this.labels.successMessage, [numDeleted]),
        });
        this.dispatchEvent(event);
    }

    get hasServiceDeliveries() {
        return this.numberOfDeliveries > 0 ? true : false;
    }

    get isDisabled() {
        return !this.isLoadingComplete || !this.hasServiceDeliveries;
    }

    get isLoadingComplete() {
        return this.permsLoaded && this.numberOfDeliveriesLoaded;
    }
}
