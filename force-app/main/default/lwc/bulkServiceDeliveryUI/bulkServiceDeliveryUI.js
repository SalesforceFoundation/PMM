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
import { format, handleError, showToast } from "c/util";
import { loadStyle } from "lightning/platformResourceLoader";
import FORM_FACTOR_NAME from "@salesforce/client/formFactor";

import { ServiceDeliveryFieldSets } from "./serviceDeliveryFieldSets";

import addServiceDelivery from "@salesforce/label/c.Add_Service_Delivery";
import addEntry from "@salesforce/label/c.Add_Entry";
import featureOnlyWebApp from "@salesforce/label/c.Feature_Only_Webapp";
import save from "@salesforce/label/c.Save";
import saved from "@salesforce/label/c.Saved";
import saving from "@salesforce/label/c.Saving";
import success from "@salesforce/label/c.Success";
import serviceDeliveriesAdded from "@salesforce/label/c.Service_Deliveries_Added";
import serviceFieldMessage from "@salesforce/label/c.BSDT_Service_Fields_Message";
import savingCompleteSuccessMessage from "@salesforce/label/c.BSDT_Saving_Complete_Success_Message";
import savingCompleteFailureMessage from "@salesforce/label/c.BSDT_Saving_Complete_Failure_Message";
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
import upsertRows from "@salesforce/apex/ServiceDeliveryController.upsertServiceDeliveries";

import pmmFolder from "@salesforce/resourceUrl/pmm";
export default class BulkServiceDeliveryUI extends NavigationMixin(LightningElement) {
    @api hideFooter = false; // no longer used; can't remove because public - mar 2021: respurposed to detect modal
    @track serviceDeliveries = [{ index: 0 }];
    @track fieldSet = [];

    saveMessage;
    serviceDeliveryObject = SERVICEDELIVERY_OBJECT;
    serviceDeliveryFieldSets;
    savedCount;
    errorCount;
    targetSaveCount;
    currentSaveCount;
    isSaving = false;
    hideWizard = false;
    applyDefaults = false;

    labels = {
        addEntry,
        addServiceDelivery,
        featureOnlyWebApp,
        saved,
        saving,
        required,
        success,
        serviceDeliveriesAdded,
        serviceFieldMessage,
        savingCompleteSuccessMessage,
        savingCompleteFailureMessage,
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
        if (serviceDelivery) {
            Object.assign(serviceDelivery, this._defaultValues);
        }
    }

    @api
    resetUI() {
        this.serviceDeliveries = [];
        this._nextIndex = 0;
        // eslint-disable-next-line @lwc/lwc/no-async-operation
        setTimeout(
            function() {
                this.addDelivery();
            }.bind(this),
            50
        );
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
    get isPhone() {
        return FORM_FACTOR_NAME === "Small";
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

    get savingCompleteMessage() {
        let successSummary;
        let failureSummary;
        if (this.savedCount > 0) {
            successSummary = format(this.labels.savingCompleteSuccessMessage, [
                this.savedCount,
            ]);
        }

        if (this.errorCount > 0) {
            failureSummary = format(this.labels.savingCompleteFailureMessage, [
                this.errorCount,
            ]);
        }
        if (successSummary && failureSummary) {
            return successSummary + " " + failureSummary;
        } else if (successSummary) {
            return successSummary;
        }
        return failureSummary;
    }

    get savingCompleteToastVariant() {
        if (this.errorCount === 0) {
            return "success";
        }
        return "error";
    }

    get isSaveDisabled() {
        return this.isSaving;
    }

    addDelivery() {
        let serviceDelivery = {
            index: this._nextIndex,
            isDirty: false,
            shouldFocus: true,
        };
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

    showSaveSummaryToast() {
        let toastVariant = this.savingCompleteToastVariant;
        let toastTitle = toastVariant === "success" ? this.labels.success : "";

        showToast(toastTitle, this.savingCompleteMessage, toastVariant, "dismissible");
    }

    handleSave() {
        let rows = this.template.querySelectorAll("c-service-delivery-row");
        let deliveries = [];

        this.savedCount = 0;
        this.errorCount = 0;
        this.targetSaveCount = 0;

        rows.forEach(row => {
            if (row.isDirty || row.isError) {
                this.targetSaveCount++;
            }

            if (row.isDirty) {
                let delivery = row.row;
                delivery.index = row.index;
                if (!delivery.isError) {
                    deliveries.push(delivery);
                    row.setSaving();
                } else {
                    this.errorCount++;
                }
            }
        });

        if (this.targetSaveCount === 0) {
            this.dispatchEvent(new CustomEvent("done"));
            return;
        }

        this.upsertDeliveries(deliveries);
    }

    upsertDeliveries(deliveries) {
        if (deliveries.length === 0) {
            return;
        }

        this.isSaving = true;
        upsertRows({
            serviceDeliveries: deliveries,
            allOrNone: false,
        })
            .then(results => {
                let resultByIndex = this.processResults(results, deliveries);
                this.updateRows(resultByIndex);
            })
            .catch(error => {
                handleError(error);
            })
            .finally(() => {
                this.isSaving = false;
                this.showSaveSummaryToast();
                this.dispatchEvent(new CustomEvent("done"));
            });
    }

    processResults(results, deliveries) {
        let resultByIndex = {};
        results = JSON.parse(results);

        for (let i = 0; i < deliveries.length; i++) {
            deliveries[i].id = results[i].id;
            deliveries[i].result = results[i];
            resultByIndex[deliveries[i].index] = deliveries[i];
        }
        return resultByIndex;
    }

    updateRows(resultByIndex) {
        let rows = this.template.querySelectorAll("c-service-delivery-row");
        if (rows) {
            rows.forEach(row => {
                if (
                    row.isDirty &&
                    Object.prototype.hasOwnProperty.call(resultByIndex, row.index)
                ) {
                    let delivery = resultByIndex[row.index];

                    if (delivery.result.success) {
                        this.savedCount++;
                        row.handleSuccess(delivery);
                    } else {
                        this.errorCount++;
                        row.handleSaveErrors(delivery.result.errors);
                    }
                }
            });
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
