import { LightningElement, track } from 'lwc';
import addServiceDelivery from "@salesforce/label/c.Add_Service_Delivery";
import serviceDeliveries from "@salesforce/label/c.Service_Deliveries";

export default class BulkServiceDeliveryUI extends LightningElement {
    @track serviceDeliveries = [{'index' : 0}];
    labels = {
        addServiceDelivery,
        serviceDeliveries
    }
    _deliveryIndex = 1;

    addDelivery() {
        this.serviceDeliveries.push({'index' : this._deliveryIndex});
        this._deliveryIndex++;
    }

    handleDelete(event) {
        this.serviceDeliveries = this.serviceDeliveries.filter(function( obj ) {
            return obj.index !== event.detail;
        });
        if(this.serviceDeliveries.length <= 0) {
            this.addDelivery();
        }
    }
}