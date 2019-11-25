import { LightningElement, wire, api } from "lwc";
import { registerListener } from "c/pubsub";
import { CurrentPageReference } from "lightning/navigation";
import serviceDeliveries from "@salesforce/label/c.Service_Deliveries";

export default class ServiceDeliveryModal extends LightningElement {
    @wire(CurrentPageReference) pageRef;

    labels = {
        serviceDeliveries,
    };

    connectedCallback() {
        registerListener("OpenPmdmBulkServiceDelivery", this.handleOpenModal, this);
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
}
