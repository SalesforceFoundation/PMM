/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { LightningElement, api, track } from "lwc";
import { getChildObjectByName, formatTime } from "c/util";
import { getRecordNotifyChange } from "lightning/uiRecordApi";

import SERVICE_DELIVERY_OBJECT from "@salesforce/schema/ServiceDelivery__c";
import QUANTITY_FIELD from "@salesforce/schema/ServiceDelivery__c.Quantity__c";
import ATTENDANCE_STATUS_FIELD from "@salesforce/schema/ServiceDelivery__c.AttendanceStatus__c";
import SKIP_LABEL from "@salesforce/label/c.Dont_Track_Attendance";

// TODO: design parameter for "Allow users to skip logging attendance for selected participants."

// TODO: create design parameters for default status and "present" statuses
const PRESENT_STATUS = "Present";
const TIME = "TIME";

export default class AttendanceRow extends LightningElement {
    @track localRecord;
    @track localFieldSet;

    @api unitOfMeasurement;
    @api presentStatus = PRESENT_STATUS;
    @api readOnly = false;

    name;
    _isEdited;
    recordId;

    labels = {
        skip: SKIP_LABEL,
    };

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

    get style() {
        return (
            "slds-box slds-var-m-around_x-small slds-var-p-horizontal_medium " +
            (this.localRecord.rowDisabled ? "shaded-box" : "small-box")
        );
    }

    setValues() {
        if (this.localFieldSet && this.localFieldSet.length && this.record) {
            this.localFieldSet = this.localFieldSet.map(a => ({ ...a }));
            this.localFieldSet.forEach(field => {
                field.value = this.record[field.apiName];
                if (field.type === TIME && field.value !== null && field.value >= 0) {
                    field.value = formatTime(field.value);
                }
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

    get showSkip() {
        return !this.recordId && !this.readOnly;
    }

    handleToggleButton() {
        this.localRecord.rowDisabled =
            this.localRecord.rowDisabled === true ? false : true;
    }
}
