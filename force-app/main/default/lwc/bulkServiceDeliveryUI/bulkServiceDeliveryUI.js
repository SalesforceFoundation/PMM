/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { LightningElement, api, track, wire } from "lwc";
import { NavigationMixin } from "lightning/navigation";
import { handleError } from "c/util";
import { loadStyle } from "lightning/platformResourceLoader";
import addServiceDelivery from "@salesforce/label/c.Add_Service_Delivery";
import addEntry from "@salesforce/label/c.Add_Entry";
import save from "@salesforce/label/c.Save";
import saved from "@salesforce/label/c.Saved";
import saving from "@salesforce/label/c.Saving";
import success from "@salesforce/label/c.Success";
import serviceDeliveriesAdded from "@salesforce/label/c.Service_Deliveries_Added";
import Label_Required from "@salesforce/label/c.Required";
import rowsWithErrors from "@salesforce/label/c.Rows_With_Errors";

import CONTACT_FIELD from "@salesforce/schema/ServiceDelivery__c.Contact__c";
import QUANTITY_FIELD from "@salesforce/schema/ServiceDelivery__c.Quantity__c";
import UNITMEASUREMENT_FIELD from "@salesforce/schema/ServiceDelivery__c.UnitOfMeasurement__c";
import PROGRAM_ENGAGEMENT_FIELD from "@salesforce/schema/ServiceDelivery__c.ProgramEngagement__c";
import SERVICE_FIELD from "@salesforce/schema/ServiceDelivery__c.Service__c";
import SERVICEDELIVERY_OBJECT from "@salesforce/schema/ServiceDelivery__c";

import getFieldSet from "@salesforce/apex/FieldSetController.getFieldSetForLWC";

import pmmFolder from "@salesforce/resourceUrl/pmm";

const FIELD_SET_NAME = "Bulk_Service_Deliveries";
const SHORT_DATA_TYPES = ["DOUBLE", "INTEGER", "BOOLEAN"];
const LONG_DATA_TYPES = ["TEXTAREA"];

export default class BulkServiceDeliveryUI extends NavigationMixin(LightningElement) {
    @api defaultValues;
    @api hideFooter = false; // no longer used; can't remove because public - mar 2021: respurposed to detect modal
    @track serviceDeliveries = [{ index: 0 }];
    @track fieldSet = [];

    saveMessage;
    serviceDeliveryObject = SERVICEDELIVERY_OBJECT;
    rowCount = this.serviceDeliveries.length;
    savedCount;
    targetSaveCount;
    hasContactField = false;
    isSaving = false;
    hasProgramEngagementField = false;
    hideWizard = false;

    labels = {
        addEntry: addEntry,
        addServiceDelivery: addServiceDelivery,
        saved: saved,
        saving: saving,
        required: Label_Required,
        success: success,
        serviceDeliveriesAdded: serviceDeliveriesAdded,
        rowsWithErrors: rowsWithErrors,
        save: save,
    };
    fields = {
        contact: CONTACT_FIELD,
        unitMeasurement: UNITMEASUREMENT_FIELD,
        quantity: QUANTITY_FIELD,
        programEngagement: PROGRAM_ENGAGEMENT_FIELD,
        service: SERVICE_FIELD,
    };
    _deliveryIndex = 1;

    @wire(getFieldSet, {
        objectName: SERVICEDELIVERY_OBJECT.objectApiName,
        fieldSetName: FIELD_SET_NAME,
    })
    wiredFields({ error, data }) {
        if (data) {
            this.configureFieldSet(data.map(a => ({ ...a })));
        } else if (error) {
            handleError(error);
        }
    }

    @api
    resetUI() {
        this.defaultValues = {};
        this.serviceDeliveries = [];
        this.addDelivery();
    }

    connectedCallback() {
        loadStyle(this, pmmFolder + "/bsdtOverrides.css");
        loadStyle(this, pmmFolder + "/hideHelpIcons.css");

        this.serviceDeliveryPage = {
            type: "standard__objectPage",
            attributes: {
                objectApiName: "ServiceDelivery__c",
                actionName: "home",
            },
        };
        this[NavigationMixin.GenerateUrl](this.serviceDeliveryPage).then(
            url => (this.url = url)
        );
    }

    get isModal() {
        return this.hideFooter; // reusing old api property name
    }

    checkFieldsExists(fieldSet) {
        if (fieldSet) {
            fieldSet.forEach(element => {
                if (element.apiName === this.fields.contact.fieldApiName) {
                    this.hasContactField = true;
                }
                if (element.apiName === this.fields.programEngagement.fieldApiName) {
                    this.hasProgramEngagementField = true;
                }
            });
        }
    }

    configureFieldSet(fieldSet) {
        this.checkFieldsExists(fieldSet);
        fieldSet.forEach(field => {
            field.disabled = true;
            field.isQuantityField = false;
            // Number fields are size 1
            // Program Engagment lookup is size 4
            // Client lookup is size 3
            // Everything else is size 2
            // This means that the field set we ship with is exactly 12 wide
            if (SHORT_DATA_TYPES.includes(field.type)) {
                field.size = 1;
            } else if (field.apiName === this.fields.programEngagement.fieldApiName) {
                field.size = 4;
            } else if (
                field.apiName === this.fields.contact.fieldApiName ||
                LONG_DATA_TYPES.includes(field.type)
            ) {
                field.size = 3;
            } else {
                field.size = 2;
            }

            if (
                this.hasContactField &&
                field.apiName === this.fields.contact.fieldApiName
            ) {
                field.disabled = false;
                field.isRequired = true;
            } else if (
                !this.hasContactField &&
                this.hasProgramEngagementField &&
                field.apiName === this.fields.programEngagement.fieldApiName
            ) {
                field.disabled = false;
                field.isRequired = true;
            } else if (
                !this.hasContactField &&
                !this.hasProgramEngagementField &&
                field.apiName === this.fields.service.fieldApiName
            ) {
                field.disabled = false;
                field.isRequired = true;
            } else if (field.apiName === this.fields.quantity.fieldApiName) {
                field.isQuantityField = true;
            }
            this.fieldSet.push(field);
        });
    }

    addDelivery() {
        this.serviceDeliveries.push({ index: this._deliveryIndex });
        this._deliveryIndex++;
        this.rowCount = this.serviceDeliveries.length;
    }

    handleRowDelete(event) {
        this.serviceDeliveries = this.serviceDeliveries.filter(function(obj) {
            return obj.index !== event.detail;
        });
        if (this.serviceDeliveries.length <= 0) {
            this.addDelivery();
        }
    }

    handleSave() {
        let rows = this.template.querySelectorAll("c-service-delivery-row");

        this.savedCount = 0;
        this.targetSaveCount = 0;

        rows.forEach(row => {
            if (row.isDirty || row.isError) {
                this.targetSaveCount++;
            }
            row.saveRow();
        });

        if (this.targetSaveCount === 0) {
            this.dispatchEvent(new CustomEvent("done"));
        }
    }

    // eslint-disable-next-line no-unused-vars
    handleRowSuccess(event) {
        if (!this.isModal) {
            return;
        }
        this.savedCount++;
        if (this.savedCount === this.targetSaveCount) {
            this.dispatchEvent(new CustomEvent("done"));
        }
    }

    handleHideWizard() {
        this.hideWizard = true;
    }
}
