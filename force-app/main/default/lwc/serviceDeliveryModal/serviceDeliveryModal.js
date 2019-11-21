import { LightningElement, wire } from "lwc";
import { registerListener } from "c/pubsub";
import { CurrentPageReference } from "lightning/navigation";
import serviceDeliveries from "@salesforce/label/c.Service_Deliveries";

export default class serviceDeliveryModal extends LightningElement {
    @wire(CurrentPageReference) pageRef;

    labels = {
        serviceDeliveries,
    };

    connectedCallback() {
        registerListener("OpenPmdmBulkServiceDelivery", this.handleOpenModal, this);
    }

    handleOpenModal() {
        this.template.querySelector("c-modal").show();
    }
}
