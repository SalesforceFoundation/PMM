/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { LightningElement, wire, api, track } from "lwc";
import { registerListener, unregisterListener } from "c/pubsub";
import { CurrentPageReference } from "lightning/navigation";
import serviceDeliveries from "@salesforce/label/c.Service_Deliveries";

export default class ServiceDeliveryModal extends LightningElement {
    @wire(CurrentPageReference) pageRef;

    @api hideFooter;

    @track defaultValues;

    labels = {
        serviceDeliveries,
    };

    connectedCallback() {
        registerListener("serviceDeliveryUpsert", this.handleServiceDeliveryUpsert, this);
        registerListener("serviceDeliveryDelete", this.handleServiceDeliveryDelete, this);
    }

    disconnectedCallback() {
        unregisterListener(
            "serviceDeliveryUpsert",
            this.handleServiceDeliveryUpsert,
            this
        );
        unregisterListener(
            "serviceDeliveryDelete",
            this.handleServiceDeliveryDelete,
            this
        );
    }

    handleOpenModal() {
        this.showModal();
    }

    @api
    showModal(value) {
        this.defaultValues = value;
        this.template.querySelector("c-modal").show();
    }

    @api
    showNewModal(value) {
        this.defaultValues = value;
        const bulkUI = this.template.querySelector("c-bulk-service-delivery-u-i");
        bulkUI.resetUI();
        this.template.querySelector("c-modal").show();
    }

    @api
    hideModal() {
        this.template.querySelector("c-modal").hide();
    }

    handleServiceDeliveryUpsert(serviceDelivery) {
        this.dispatchEvent(
            new CustomEvent("servicedeliveryupsert", {
                detail: {
                    serviceDelivery: serviceDelivery,
                },
            })
        );
    }

    handleServiceDeliveryDelete(serviceDeliveryId) {
        this.dispatchEvent(
            new CustomEvent("servicedeliverydelete", {
                detail: {
                    serviceDeliveryId: serviceDeliveryId,
                },
            })
        );
    }
}
