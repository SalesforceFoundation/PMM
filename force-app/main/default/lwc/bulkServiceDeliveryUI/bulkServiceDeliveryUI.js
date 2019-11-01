import { LightningElement, track } from 'lwc';

export default class BulkServiceDeliveryUI extends LightningElement {
    @track serviceDeliveries = [{'sdid' : 0}];
    _deliveryIndex = 1;

    addDelivery() {
        this.serviceDeliveries.push({'sdid' : this._deliveryIndex});
        this._deliveryIndex++;
    }

    handleDelete(event) {
        console.log('Handling delete');
        console.log(event.detail);
        this.serviceDeliveries = this.serviceDeliveries.filter(function( obj ) {
            console.log('Checking ' + obj.sdid, 'Against ' + event.detail, obj.sdid !== event.detail);
            return obj.sdid !== event.detail;
        });
    }
}