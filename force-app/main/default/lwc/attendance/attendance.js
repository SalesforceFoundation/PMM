/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { LightningElement, track, wire, api } from "lwc";
import { handleError, getChildObjectByName, format } from "c/util";
import { getRecord, updateRecord } from "lightning/uiRecordApi";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { refreshApex } from "@salesforce/apex";
import generateRoster from "@salesforce/apex/AttendanceController.generateRoster";
import getFieldSet from "@salesforce/apex/FieldSetController.getFieldSetForLWC";
import upsertRows from "@salesforce/apex/AttendanceController.upsertServiceDeliveries";

import SERVICE_DELIVERY_OBJECT from "@salesforce/schema/ServiceDelivery__c";
import CONTACT_FIELD from "@salesforce/schema/ServiceDelivery__c.Contact__c";
import QUANTITY_FIELD from "@salesforce/schema/ServiceDelivery__c.Quantity__c";
import UNIT_MEASUREMENT_RELATED_FIELD from "@salesforce/schema/ServiceSession__c.ServiceSchedule__r.Service__r.UnitOfMeasurement__c";
import UNIT_MEASUREMENT_SERVICE_FIELD from "@salesforce/schema/Service__c.UnitOfMeasurement__c";
import ATTENDANCE_STATUS_FIELD from "@salesforce/schema/ServiceDelivery__c.AttendanceStatus__c";
import CREATED_DATE_FIELD from "@salesforce/schema/ServiceDelivery__c.CreatedDate";
import CREATED_BY_FIELD from "@salesforce/schema/ServiceDelivery__c.CreatedById";
import SESSION_STATUS_FIELD from "@salesforce/schema/ServiceSession__c.Status__c";

import SUBMIT_LABEL from "@salesforce/label/c.Submit";
import ATTENDANCE_LABEL from "@salesforce/label/c.Attendance";
import LOADING_LABEL from "@salesforce/label/c.Loading";
import SUCCESS_LABEL from "@salesforce/label/c.Success";
import SUCCESS_MESSAGE_LABEL from "@salesforce/label/c.Save_Attendance_Success";
import SUCCESS_NO_UPDATES_LABEL from "@salesforce/label/c.Save_Attendance_No_Updates";
import UPDATE_LABEL from "@salesforce/label/c.Update";
import SAVE_LABEL from "@salesforce/label/c.Save";
import CANCEL_LABEL from "@salesforce/label/c.Cancel";

const FIELD_SET_NAME = "Attendance_Service_Deliveries";
const SHORT_DATA_TYPES = ["DOUBLE", "INTEGER", "BOOLEAN"];
const LONG_DATA_TYPES = ["TEXTAREA", "PICKLIST", "REFERENCE"];
const ID = "Id";
const COMPLETE = "Complete";
const PENDING = "Pending";

export default class Attendance extends LightningElement {
    @api recordId;
    @track serviceDeliveries;
    @track fieldSet;

    showSpinner = true;
    isUpdateMode = false;

    unitOfMeasurement;
    sessionStatus;
    wiredServiceDeliveriesResult;

    labels = {
        submit: SUBMIT_LABEL,
        attendance: ATTENDANCE_LABEL,
        loading: LOADING_LABEL,
        success: SUCCESS_LABEL,
        successMessage: SUCCESS_MESSAGE_LABEL,
        noUpdates: SUCCESS_NO_UPDATES_LABEL,
        update: UPDATE_LABEL,
        save: SAVE_LABEL,
        cancel: CANCEL_LABEL,
    };

    fields = {
        contact: CONTACT_FIELD,
        quantity: QUANTITY_FIELD,
        attendanceStatus: ATTENDANCE_STATUS_FIELD,
        createdDate: CREATED_DATE_FIELD,
        createdBy: CREATED_BY_FIELD,
        sessionStatus: SESSION_STATUS_FIELD,
    };

    @wire(getRecord, {
        recordId: "$recordId",
        fields: [UNIT_MEASUREMENT_RELATED_FIELD, SESSION_STATUS_FIELD],
    })
    wiredSession(result) {
        if (!(result.data || result.error)) {
            return;
        }

        if (result.data) {
            let schedule = getChildObjectByName(result.data.fields, "ServiceSchedule__r");
            let service = getChildObjectByName(schedule.value.fields, "Service__r");
            this.unitOfMeasurement =
                service.value.fields[UNIT_MEASUREMENT_SERVICE_FIELD.fieldApiName].value;
            this.sessionStatus =
                result.data.fields[this.fields.sessionStatus.fieldApiName].value;
        } else if (result.error) {
            console.log(result.error);
        }
    }

    @wire(generateRoster, { sessionId: "$recordId" })
    wiredServiceDeliveries(result) {
        this.wiredServiceDeliveriesResult = result;
        if (!(result.data || result.error)) {
            return;
        }

        if (result.data) {
            this.serviceDeliveries = [...result.data];
            this.serviceDeliveries.sort((a, b) => {
                return getChildObjectByName(a, "Contact__r").Name >
                    getChildObjectByName(b, "Contact__r").Name
                    ? 1
                    : -1;
            });
        } else if (result.error) {
            handleError(result.error);
        }

        this.showSpinner = false;
    }

    @wire(getFieldSet, {
        objectName: SERVICE_DELIVERY_OBJECT.objectApiName,
        fieldSetName: FIELD_SET_NAME,
    })
    wiredFields(result) {
        if (result.data) {
            this.configureFieldSet(result.data.map(a => ({ ...a })));
        } else if (result.error) {
            handleError(result.error);
        }
    }

    get isComplete() {
        return this.sessionStatus && this.sessionStatus === COMPLETE;
    }

    get isReadOnly() {
        return this.isComplete && !this.isUpdateMode;
    }

    get isPending() {
        return this.sessionStatus && this.sessionStatus === PENDING;
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
            field.isQuantityField = false;
            field.isNormalField = false;
            field.isContactField = false;

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
            } else if (!field.isUpdateable) {
                field.isOutputField = true; // always output if not updateable, e.g., createddate
            } else {
                field.isNormalField = true; // no special handling for display of this field
            }

            finalFieldSet.push(field);
        });
        this.fieldSet = finalFieldSet;
    }

    handleSave() {
        let rows = this.template.querySelectorAll("c-attendance-row");

        let editedRows = [];

        rows.forEach(row => {
            let editedRow = row.getRow();
            if (editedRow) {
                editedRows.push(editedRow);
            }
        });
        this.showSpinner = true;

        upsertRows({
            serviceDeliveriesToUpsert: editedRows,
        })
            .then(() => {
                if (this.isPending) {
                    this.setStatus(COMPLETE);
                }
                rows.forEach(row => {
                    row.save();
                });
                this.isUpdateMode = false;
                this.showSuccessToast(editedRows.length);
            })
            .catch(error => {
                handleError(error);
            })
            .finally(() => {
                this.showSpinner = false;
            });
    }

    setStatus(status) {
        let fields = {};
        fields[ID] = this.recordId;
        fields[this.fields.sessionStatus.fieldApiName] = status;
        updateRecord({ fields }).catch(error => {
            handleError(error);
        });
    }

    handleUpdateClick() {
        this.isUpdateMode = true;
    }

    handleCancel() {
        refreshApex(this.wiredServiceDeliveriesResult);
        this.isUpdateMode = false;
    }

    showSuccessToast(numSaved) {
        let message = "";
        if (numSaved) {
            message = format(this.labels.successMessage, [numSaved]);
        } else {
            message = this.labels.noUpdates;
        }

        const event = new ShowToastEvent({
            title: this.labels.success,
            variant: "success",
            message: message,
        });
        this.dispatchEvent(event);
    }
}
