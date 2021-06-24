/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { LightningElement, track, wire, api } from "lwc";
import { handleError, getChildObjectByName, format, prefixNamespace } from "c/util";
import { NavigationMixin, CurrentPageReference } from "lightning/navigation";
import { loadStyle } from "lightning/platformResourceLoader";

import { getRecord, updateRecord } from "lightning/uiRecordApi";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { refreshApex } from "@salesforce/apex";
import generateRoster from "@salesforce/apex/AttendanceController.generateRoster";
import getFieldSet from "@salesforce/apex/FieldSetController.getFieldSetForLWC";
import upsertRows from "@salesforce/apex/AttendanceController.upsertServiceDeliveries";
import checkFieldPermissions from "@salesforce/apex/AttendanceController.checkFieldPermissions";

import SERVICE_DELIVERY_OBJECT from "@salesforce/schema/ServiceDelivery__c";
import SERVICE_SESSION_OBJECT from "@salesforce/schema/ServiceSession__c";
import CONTACT_FIELD from "@salesforce/schema/ServiceDelivery__c.Contact__c";
import QUANTITY_FIELD from "@salesforce/schema/ServiceDelivery__c.Quantity__c";
import UNIT_MEASUREMENT_RELATED_FIELD from "@salesforce/schema/ServiceSession__c.ServiceSchedule__r.Service__r.UnitOfMeasurement__c";
import UNIT_MEASUREMENT_SERVICE_FIELD from "@salesforce/schema/Service__c.UnitOfMeasurement__c";
import ATTENDANCE_STATUS_FIELD from "@salesforce/schema/ServiceDelivery__c.AttendanceStatus__c";
import CREATED_DATE_FIELD from "@salesforce/schema/ServiceDelivery__c.CreatedDate";
import CREATED_BY_FIELD from "@salesforce/schema/ServiceDelivery__c.CreatedById";
import SESSION_STATUS_FIELD from "@salesforce/schema/ServiceSession__c.Status__c";

import SUBMIT_LABEL from "@salesforce/label/c.Submit";
import TRACK_ATTENDANCE_LABEL from "@salesforce/label/c.TrackAttendance";
import LOADING_LABEL from "@salesforce/label/c.Loading";
import SUCCESS_LABEL from "@salesforce/label/c.Success";
import SUCCESS_MESSAGE_LABEL from "@salesforce/label/c.Save_Service_Delivery_Success";
import SUCCESS_NO_UPDATES_LABEL from "@salesforce/label/c.Save_Service_Delivery_No_Updates";
import UPDATE_LABEL from "@salesforce/label/c.Update";
import SAVE_LABEL from "@salesforce/label/c.Save";
import CANCEL_LABEL from "@salesforce/label/c.Cancel";
import QUANTITY_LABEL from "@salesforce/label/c.Quantity";
import PRINT_LABEL from "@salesforce/label/c.Print";
import PRINTABLE_VIEW_LABEL from "@salesforce/label/c.Printable_View";
import NO_PARTICIPANTS_HEADER_LABEL from "@salesforce/label/c.No_Participants_Header";
import NO_PARTICIPANTS_MESSAGE_LABEL from "@salesforce/label/c.No_Participants_Message";
import NO_PERMISSIONS_MESSAGE_LABEL from "@salesforce/label/c.No_Permission_Message";
import BAD_TAB_HEADER from "@salesforce/label/c.Incorrect_Tab";
import ATTENDANCE_TAB_MESSAGE from "@salesforce/label/c.Attendance_Tab_Message";
import pmmFolder from "@salesforce/resourceUrl/pmm";

const FIELD_SET_NAME = "Attendance_Service_Deliveries";
const SHORT_DATA_TYPES = ["DOUBLE", "INTEGER", "BOOLEAN"];
const LONG_DATA_TYPES = ["TEXTAREA", "PICKLIST", "REFERENCE"];
const ID = "Id";
const COMPLETE = "Complete";
const PENDING = "Pending";
const ITEM_PAGE_NAVIGATION_TYPE = "standard__navItemPage";
const ATTENDANCE_TAB = "Attendance";
export default class Attendance extends NavigationMixin(LightningElement) {
    @api recordId;
    @track serviceDeliveries;
    @track fieldSet;

    showSpinner = true;
    isUpdateMode = false;
    hasReadPermissions;
    hasWritePermissions;

    unitOfMeasurement;
    sessionStatus;
    wiredServiceDeliveriesResult;

    serviceSession = SERVICE_SESSION_OBJECT;

    labels = {
        submit: SUBMIT_LABEL,
        trackAttendance: TRACK_ATTENDANCE_LABEL,
        loading: LOADING_LABEL,
        success: SUCCESS_LABEL,
        successMessage: SUCCESS_MESSAGE_LABEL,
        noUpdates: SUCCESS_NO_UPDATES_LABEL,
        update: UPDATE_LABEL,
        save: SAVE_LABEL,
        cancel: CANCEL_LABEL,
        quantity: QUANTITY_LABEL,
        print: PRINT_LABEL,
        printableView: PRINTABLE_VIEW_LABEL,
        noParticipantsHeader: NO_PARTICIPANTS_HEADER_LABEL,
        noParticipantsMessage: NO_PARTICIPANTS_MESSAGE_LABEL,
        noPermissions: NO_PERMISSIONS_MESSAGE_LABEL,
        badTabHeader: BAD_TAB_HEADER,
        badTabMessage: ATTENDANCE_TAB_MESSAGE,
    };

    fields = {
        contact: CONTACT_FIELD,
        quantity: QUANTITY_FIELD,
        attendanceStatus: ATTENDANCE_STATUS_FIELD,
        createdDate: CREATED_DATE_FIELD,
        createdBy: CREATED_BY_FIELD,
        sessionStatus: SESSION_STATUS_FIELD,
    };

    @wire(CurrentPageReference)
    setCurrentPageReference(currentPageReference) {
        this.pageRef = currentPageReference;
        if (currentPageReference.state && currentPageReference.state.c__sessionId) {
            this.recordId = currentPageReference.state.c__sessionId;
        }
    }

    @wire(checkFieldPermissions, {})
    wiredPermissions(result) {
        if (!(result.data || result.error)) {
            return;
        }
        if (result.data) {
            this.hasReadPermissions = result.data.read;
            this.hasWritePermissions = result.data.write;
        }
    }

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
            this.unitOfMeasurement = service.value.fields[
                UNIT_MEASUREMENT_SERVICE_FIELD.fieldApiName
            ].value
                ? service.value.fields[UNIT_MEASUREMENT_SERVICE_FIELD.fieldApiName].value
                : this.labels.quantity;
            this.sessionStatus = result.data.fields[
                this.fields.sessionStatus.fieldApiName
            ]
                ? result.data.fields[this.fields.sessionStatus.fieldApiName].value
                : undefined;
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
            console.log(result.error);
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
            console.log(result.error);
        }
    }

    connectedCallback() {
        loadStyle(this, pmmFolder + "/attendancePrintOverride.css");
    }

    get hasServiceDeliveries() {
        return this.serviceDeliveries && this.serviceDeliveries.length;
    }

    get isComplete() {
        return this.sessionStatus && this.sessionStatus === COMPLETE;
    }

    get isReadMode() {
        return this.hasServiceDeliveries && this.isComplete && !this.isUpdateMode;
    }

    get isPending() {
        return this.sessionStatus && this.sessionStatus === PENDING;
    }

    get printButtonLabel() {
        return this.pageRef.type === ITEM_PAGE_NAVIGATION_TYPE
            ? this.labels.print
            : this.labels.printableView;
    }

    get showPrintButton() {
        return this.hasReadPermissions && this.hasServiceDeliveries;
    }

    get displayHeader() {
        return this.pageRef.type === ITEM_PAGE_NAVIGATION_TYPE ? true : false;
    }

    get hasPermissions() {
        return this.isReadMode
            ? this.hasReadPermissions
            : this.hasReadPermissions && this.hasWritePermissions;
    }

    get showUpdateButton() {
        return this.isReadMode && this.hasWritePermissions;
    }

    get showSubmitButton() {
        return (
            !this.isReadMode &&
            this.isPending &&
            this.hasServiceDeliveries &&
            this.hasWritePermissions &&
            this.hasReadPermissions
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
                refreshApex(this.wiredServiceDeliveriesResult);
                rows.forEach(row => {
                    row.save();
                });
                this.isUpdateMode = false;
                this.showSuccessToast(editedRows.length);
                this.showSpinner = false;
            })
            .catch(error => {
                handleError(error);
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
        this.serviceDeliveries = this.serviceDeliveries.map(a => ({ ...a }));
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

    handlePrintClick() {
        if (this.pageRef.type === ITEM_PAGE_NAVIGATION_TYPE) {
            window.print();
        } else {
            this[NavigationMixin.GenerateUrl]({
                type: ITEM_PAGE_NAVIGATION_TYPE,
                attributes: {
                    apiName: prefixNamespace(ATTENDANCE_TAB),
                },
                state: {
                    c__sessionId: this.recordId,
                },
            }).then(url => {
                window.open(url);
            });
        }
    }
}
