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

import { ServiceDeliveryFieldSets } from "./serviceDeliveryFieldSets";

import addServiceDelivery from "@salesforce/label/c.Add_Service_Delivery";
import addEntry from "@salesforce/label/c.Add_Entry";
import save from "@salesforce/label/c.Save";
import saved from "@salesforce/label/c.Saved";
import saving from "@salesforce/label/c.Saving";
import success from "@salesforce/label/c.Success";
import serviceDeliveriesAdded from "@salesforce/label/c.Service_Deliveries_Added";
import required from "@salesforce/label/c.Required";
import rowsWithErrors from "@salesforce/label/c.Rows_With_Errors";

import SERVICE_DELIVERY_CONTACT_FIELD from "@salesforce/schema/ServiceDelivery__c.Contact__c";
import PROGRAM_ENGAGEMENT_CONTACT_FIELD from "@salesforce/schema/ProgramEngagement__c.Contact__c";
import QUANTITY_FIELD from "@salesforce/schema/ServiceDelivery__c.Quantity__c";
import UNITMEASUREMENT_FIELD from "@salesforce/schema/ServiceDelivery__c.UnitOfMeasurement__c";
import PROGRAM_ENGAGEMENT_FIELD from "@salesforce/schema/ServiceDelivery__c.ProgramEngagement__c";
import SERVICE_DELIVERY_FIELD_SET_FIELD from "@salesforce/schema/Service__c.ServiceDeliveryFieldSet__c";
import SERVICE_FIELD from "@salesforce/schema/ServiceDelivery__c.Service__c";
import SERVICEDELIVERY_OBJECT from "@salesforce/schema/ServiceDelivery__c";

import getFieldSets from "@salesforce/apex/ServiceDeliveryController.getServiceDeliveryFieldSets";

import pmmFolder from "@salesforce/resourceUrl/pmm";
export default class BulkServiceDeliveryUI extends NavigationMixin(LightningElement) {
    @api hideFooter = false; // no longer used; can't remove because public - mar 2021: respurposed to detect modal
    @track serviceDeliveries = [{ index: 0 }];
    @track fieldSet = [];

    saveMessage;
    serviceDeliveryObject = SERVICEDELIVERY_OBJECT;
    serviceDeliveryFieldSets;
    savedCount;
    targetSaveCount;
    isSaving = false;
    hideWizard = false;
    applyDefaults = false;

    labels = {
        addEntry,
        addServiceDelivery,
        saved,
        saving,
        required,
        success,
        serviceDeliveriesAdded,
        rowsWithErrors,
        save,
    };
    fields = {
        contact: SERVICE_DELIVERY_CONTACT_FIELD,
        unitMeasurement: UNITMEASUREMENT_FIELD,
        quantity: QUANTITY_FIELD,
        programEngagement: PROGRAM_ENGAGEMENT_FIELD,
        programEngagementContact: PROGRAM_ENGAGEMENT_CONTACT_FIELD,
        service: SERVICE_FIELD,
        fieldSet: SERVICE_DELIVERY_FIELD_SET_FIELD,
    };
    _nextIndex = 1;
    _defaultValues = {};

    @wire(getFieldSets, {
        objectName: SERVICEDELIVERY_OBJECT.objectApiName,
    })
    wiredFields({ error, data }) {
        if (data) {
            this.serviceDeliveryFieldSets = new ServiceDeliveryFieldSets(data);
        } else if (error) {
            handleError(error);
        }
    }

    @api
    get defaultValues() {
        return this._defaultValues;
    }

    set defaultValues(value) {
        let serviceDelivery = this.serviceDeliveries[0];
        this._defaultValues = value;
        Object.assign(serviceDelivery, this._defaultValues);
    }

    @api
    resetUI() {
        this.serviceDeliveries = [];
        this._nextIndex = 0;
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

    get rowCount() {
        return this.serviceDeliveries.length;
    }

    get showWizard() {
        return !this.isModal && !this.hideWizard;
    }

    addDelivery() {
        let serviceDelivery = { index: this._nextIndex, isDirty: false };
        if (this.applyDefaults || this.isModal) {
            Object.assign(serviceDelivery, this.defaultValues);
            serviceDelivery.Id = null;
        }

        this.serviceDeliveries.push(serviceDelivery);
        this._nextIndex++;
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

    handleFinishWizard(event) {
        this.hideWizard = true;
        let selectedEngagements = event.detail.selectedEngagements;

        if (!selectedEngagements) {
            return;
        }

        this.defaultValues = event.detail.serviceDelivery;
        this.applyDefaults = true;
        this.serviceDeliveries = [];

        let index;
        for (index = 0; index < selectedEngagements.length; index++) {
            let newServiceDelivery = Object.assign(
                { index: index, isDirty: true },
                this.defaultValues
            );
            newServiceDelivery[this.fields.contact.fieldApiName] =
                selectedEngagements[index][
                    this.fields.programEngagementContact.fieldApiName
                ];
            newServiceDelivery[this.fields.programEngagement.fieldApiName] =
                selectedEngagements[index].Id;
            this.serviceDeliveries.push(newServiceDelivery);
        }

        this._nextIndex = index + 1;
    }
}
