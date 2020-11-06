/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { LightningElement, track, wire, api } from "lwc";
import { handleError, getChildObjectByName } from "c/util";
import { getRecord } from "lightning/uiRecordApi";
import generateRoster from "@salesforce/apex/AttendanceController.generateRoster";
import getFieldSet from "@salesforce/apex/FieldSetController.getFieldSetForLWC";

import SERVICEDELIVERY_OBJECT from "@salesforce/schema/ServiceDelivery__c";
import CONTACT_FIELD from "@salesforce/schema/ServiceDelivery__c.Contact__c";
import QUANTITY_FIELD from "@salesforce/schema/ServiceDelivery__c.Quantity__c";
import UNITMEASUREMENT_RELATED_FIELD from "@salesforce/schema/ServiceSession__c.ServiceSchedule__r.Service__r.UnitOfMeasurement__c";
import UNITMEASUREMENT_SERVICE_FIELD from "@salesforce/schema/Service__c.UnitOfMeasurement__c";
import ATTENDANCE_STATUS_FIELD from "@salesforce/schema/ServiceDelivery__c.AttendanceStatus__c";
import CREATED_DATE_FIELD from "@salesforce/schema/ServiceDelivery__c.CreatedDate";
import CREATED_BY_FIELD from "@salesforce/schema/ServiceDelivery__c.CreatedById";

import Submit_Label from "@salesforce/label/c.Submit";
import Attendance_Label from "@salesforce/label/c.Attendance";

const FIELD_SET_NAME = "Attendance_Service_Deliveries";
const SHORT_DATA_TYPES = ["DOUBLE", "INTEGER", "BOOLEAN"];
const LONG_DATA_TYPES = ["TEXTAREA", "PICKLIST", "REFERENCE"];

export default class Attendance extends LightningElement {
    @api recordId;
    @track serviceDeliveries;
    @track fieldSet;

    unitOfMeasurement;

    labels = {
        submit: Submit_Label,
        attendance: Attendance_Label,
    };

    fields = {
        contact: CONTACT_FIELD,
        quantity: QUANTITY_FIELD,
        attendanceStatus: ATTENDANCE_STATUS_FIELD,
        createdDate: CREATED_DATE_FIELD,
        createdBy: CREATED_BY_FIELD,
    };

    @wire(getRecord, {
        recordId: "$recordId",
        fields: [UNITMEASUREMENT_RELATED_FIELD],
    })
    wiredSession(result) {
        if (!(result.data || result.error)) {
            return;
        }

        if (result.data) {
            let schedule = getChildObjectByName(result.data.fields, "ServiceSchedule__r");
            let service = getChildObjectByName(schedule.value.fields, "Service__r");
            this.unitOfMeasurement =
                service.value.fields[UNITMEASUREMENT_SERVICE_FIELD.fieldApiName].value;
        } else if (result.error) {
            handleError(result.error);
        }
    }

    @wire(generateRoster, { sessionId: "$recordId" })
    wiredServiceDeliveries(result) {
        if (!(result.data || result.error)) {
            return;
        }

        if (result.data) {
            this.serviceDeliveries = [...result.data];
        } else if (result.error) {
            handleError(result.error);
        }
    }

    @wire(getFieldSet, {
        objectName: SERVICEDELIVERY_OBJECT.objectApiName,
        fieldSetName: FIELD_SET_NAME,
    })
    wiredFields(result) {
        if (result.data) {
            this.configureFieldSet(result.data.map(a => ({ ...a })));
        } else if (result.error) {
            handleError(result.error);
        }
    }

    get header() {
        return (
            this.labels.attendance +
            (this.serviceDeliveries && this.serviceDeliveries.length
                ? " (" + this.serviceDeliveries.length + ")"
                : "")
        );
    }

    configureFieldSet(incomingFieldSet) {
        let finalFieldSet = [];
        incomingFieldSet.forEach(field => {
            field.disabled = false;
            field.isQuantityField = false;
            field.isOutputField = false;
            field.isNormalInputField = false;
            field.isContactField = false;

            // Number fields are size 1
            // Client lookup is size 3
            // Everything else is size 2
            if (SHORT_DATA_TYPES.includes(field.type)) {
                field.size = 1;
            } else if (LONG_DATA_TYPES.includes(field.type)) {
                field.size = 3;
            } else {
                field.size = 2;
            }

            if (field.apiName === this.fields.contact.fieldApiName) {
                field.isContactField = true;
                field.size = 2;
            } else if (field.apiName === this.fields.quantity.fieldApiName) {
                field.isQuantityField = true;
                field.variant = "label-hidden";
            } else {
                field.isNormalInputField = field.isUpdateable;
                field.isOutputField = !field.isUpdateable;
            }

            finalFieldSet.push(field);
        });
        this.fieldSet = finalFieldSet;
    }
}
