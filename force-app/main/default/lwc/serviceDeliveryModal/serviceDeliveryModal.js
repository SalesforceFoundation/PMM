import { LightningElement, wire } from "lwc";
import { registerListener } from "c/pubsub";
import { CurrentPageReference } from "lightning/navigation";

export default class serviceDeliveryModal extends LightningElement {
    @wire(CurrentPageReference) pageRef;

    connectedCallback() {
        registerListener("openpmdmbulkservicedelivery", this.handleOpenModal, this);
    }

    handleOpenModal() {
        this.template.querySelector("c-modal").show();
    }
}
