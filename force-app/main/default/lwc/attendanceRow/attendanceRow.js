import { LightningElement, api, track, wire } from "lwc";
import { getRecord } from "lightning/uiRecordApi";
import SERVICEDELIVERY_OBJECT from "@salesforce/schema/ServiceDelivery__c";
import QUANTITY_FIELD from "@salesforce/schema/ServiceDelivery__c.Quantity__c";
import CONTACT_NAME_FIELD from "@salesforce/schema/Contact.Name";
import ATTENDANCE_STATUS_FIELD from "@salesforce/schema/ServiceDelivery__c.AttendanceStatus__c";

// TODO: create design parameters for default status and "present" statuses
const PRESENT_STATUS = "Present";

export default class AttendanceRow extends LightningElement {
    @track localRecord;
    @track localFieldSet;

    @api unitOfMeasurement;
    @api contactId;
    @api presentStatus = PRESENT_STATUS;
    oldStatus;
    name;

    @api
    get record() {
        return this.localRecord;
    }
    set record(value) {
        this.localRecord = Object.assign({}, value);
    }

    @api
    get fieldSet() {
        return this.localFieldSet;
    }
    set fieldSet(value) {
        this.localFieldSet = value;
        if (value && value.length) {
            this.setValues();
        }
    }

    fields = {
        quantity: QUANTITY_FIELD,
        status: ATTENDANCE_STATUS_FIELD,
    };

    serviceDeliveryObject = SERVICEDELIVERY_OBJECT;

    get recordId() {
        return this.record.Id;
    }

    get quantity() {
        return this.record[this.fields.quantity.fieldApiName];
    }

    @wire(getRecord, {
        recordId: "$contactId",
        fields: [CONTACT_NAME_FIELD],
    })
    wiredDelivery(result) {
        if (!(result.data || result.error)) {
            return;
        }
        if (result.data) {
            this.name = result.data.fields.Name.value;
        }
    }

    setValues() {
        this.localFieldSet = this.localFieldSet.map(a => ({ ...a }));

        this.localFieldSet.forEach(field => {
            field.value = this.record[field.apiName];
        });
    }

    handleInputChange(event) {
        if (
            event.target.fieldName === this.fields.status.fieldApiName && // status is changing
            this.record[this.fields.status.fieldApiName] === this.presentStatus && // status was present
            event.detail.value !== this.presentStatus // new status is not present
        ) {
            this.record[this.fields.quantity.fieldApiName] = 0; // clear out quantity
        }
        this.record[event.target.fieldName] = event.detail.value;
    }

    handleQuantityChange(event) {
        this.record[this.fields.quantity.fieldApiName] = event.detail.value;
    }
}
