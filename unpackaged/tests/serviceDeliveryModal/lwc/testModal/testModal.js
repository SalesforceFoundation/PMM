import { LightningElement, wire } from "lwc";
import { CurrentPageReference } from "lightning/navigation";
import { fireEvent } from "c/pubsub";

export default class TestModal extends LightningElement {
    @wire(CurrentPageReference) pageRef;

    handleOpenModal() {
        fireEvent(this.pageRef, "OpenPmdmBulkServiceDelivery", "", true);
    }
}