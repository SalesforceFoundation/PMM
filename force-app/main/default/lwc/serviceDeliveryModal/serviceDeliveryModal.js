import { LightningElement, wire, api } from "lwc";
import { registerListener, unregisterListener } from "c/pubsub";
import { CurrentPageReference } from "lightning/navigation";
import serviceDeliveries from "@salesforce/label/c.Service_Deliveries";

export default class ServiceDeliveryModal extends LightningElement {
    @wire(CurrentPageReference) pageRef;

    labels = {
        serviceDeliveries,
    };

    connectedCallback() {
        registerListener("OpenPmdmBulkServiceDelivery", this.handleOpenModal, this);
        registerListener("serviceDeliveryUpsert", this.handleServiceDeliveryUpsert, this);
        registerListener("serviceDeliveryDelete", this.handleServiceDeliveryDelete, this);
    }

    disconnectedCallback() {
        unregisterListener("OpenPmdmBulkServiceDelivery", this.handleOpenModal, this);
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
    showModal() {
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
