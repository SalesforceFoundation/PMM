import { LightningElement, track } from "lwc";

export default class BulkServiceDeliveryEntry extends LightningElement {
    @track serviceDeliveries = [{ Id: null }];

    createNewServiceDelivery() {
        this.serviceDeliveries.push({ Id: null });
    }
}
