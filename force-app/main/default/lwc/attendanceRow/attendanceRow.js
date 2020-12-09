/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { LightningElement, api, track } from "lwc";
import { getChildObjectByName } from "c/util";
import { getRecordNotifyChange } from "lightning/uiRecordApi";

import SERVICE_DELIVERY_OBJECT from "@salesforce/schema/ServiceDelivery__c";
import QUANTITY_FIELD from "@salesforce/schema/ServiceDelivery__c.Quantity__c";
import ATTENDANCE_STATUS_FIELD from "@salesforce/schema/ServiceDelivery__c.AttendanceStatus__c";

// TODO: create design parameters for default status and "present" statuses
const PRESENT_STATUS = "Present";

export default class AttendanceRow extends LightningElement {
    @track localRecord;
    @track localFieldSet;

    @api unitOfMeasurement;
    @api presentStatus = PRESENT_STATUS;
    @api readOnly = false;

    name;

    _isEdited;
    recordId;

    @api
    get record() {
        return this.localRecord;
    }
    set record(value) {
        getRecordNotifyChange([{ recordId: this.recordId }]);

        this.localRecord = Object.assign({}, value);
        this.name = getChildObjectByName(this.localRecord, "Contact__r").Name;
        this.setValues();
        this._isEdited = false;
        this.recordId = this.localRecord.Id;
    }

    @api
    get fieldSet() {
        return this.localFieldSet;
    }
    set fieldSet(value) {
        this.localFieldSet = value;
        this.setValues();
    }

    @api
    getRow() {
        return this._isEdited || !this.recordId ? this.localRecord : null;
    }

    @api
    save() {
        // this function ensures the setter gets called.
        this.record = this.localRecord;
        this._isEdited = false;
    }

    fields = {
        quantity: QUANTITY_FIELD,
        status: ATTENDANCE_STATUS_FIELD,
    };

    serviceDeliveryObject = SERVICE_DELIVERY_OBJECT;

    get quantity() {
        return this.localRecord[this.fields.quantity.fieldApiName];
    }

    setValues() {
        if (this.localFieldSet && this.localFieldSet.length && this.record) {
            this.localFieldSet = this.localFieldSet.map(a => ({ ...a }));
            this.localFieldSet.forEach(field => {
                field.value = this.record[field.apiName];
            });
        }
    }

    handleInputChange(event) {
        if (
            event.target.fieldName === this.fields.status.fieldApiName && // status is changing
            this.record[this.fields.status.fieldApiName] === this.presentStatus && // status was present
            event.target.value !== this.presentStatus // new status is not present
        ) {
            this.localRecord[this.fields.quantity.fieldApiName] = 0; // clear out quantity
        }
        this.localRecord[event.target.fieldName] = event.target.value;
        this._isEdited = true;
    }

    handleQuantityChange(event) {
        this.localRecord[this.fields.quantity.fieldApiName] = event.detail.value;
        this._isEdited = true;
    }
}
