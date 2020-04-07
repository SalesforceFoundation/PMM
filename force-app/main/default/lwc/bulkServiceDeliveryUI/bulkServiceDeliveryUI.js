import { LightningElement, api, track, wire } from "lwc";
import { NavigationMixin } from "lightning/navigation";
import { showToast, handleError } from "c/util";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { loadStyle } from "lightning/platformResourceLoader";
import addServiceDelivery from "@salesforce/label/c.Add_Service_Delivery";
import done from "@salesforce/label/c.Done";
import addEntry from "@salesforce/label/c.Add_Entry";
import saved from "@salesforce/label/c.Saved";
import saving from "@salesforce/label/c.Saving";
import success from "@salesforce/label/c.Success";
import serviceDeliveriesAdded from "@salesforce/label/c.Service_Deliveries_Added";
import Label_Required from "@salesforce/label/c.Required";

import CONTACT_FIELD from "@salesforce/schema/ServiceDelivery__c.Contact__c";
import QUANTITY_FIELD from "@salesforce/schema/ServiceDelivery__c.Quantity__c";
import UNITMEASUREMENT_FIELD from "@salesforce/schema/ServiceDelivery__c.UnitOfMeasurement__c";
import SERVICEDELIVERY_OBJECT from "@salesforce/schema/ServiceDelivery__c";

import getFieldSet from "@salesforce/apex/ServiceDeliveryController.getFieldSet";

import pmmFolder from "@salesforce/resourceUrl/pmm";

export default class BulkServiceDeliveryUI extends NavigationMixin(LightningElement) {
    @api defaultValues;
    @api hideFooter = false;
    @track serviceDeliveries = [{ index: 0 }];
    @track isSaving = false;
    @track saveMessage;
    @track fieldSet = [];
    @track hasQuantity = false;
    @track rowCount = this.serviceDeliveries.length;
    @track errors = {};

    serviceDeliveryObject = SERVICEDELIVERY_OBJECT;

    labels = {
        addEntry: addEntry,
        addServiceDelivery: addServiceDelivery,
        done: done,
        saved: saved,
        saving: saving,
        required: Label_Required,
        success: success,
        serviceDeliveriesAdded: serviceDeliveriesAdded,
    };
    fields = {
        contact: CONTACT_FIELD,
        unitMeasurement: UNITMEASUREMENT_FIELD,
        quantity: QUANTITY_FIELD,
    };
    _deliveryIndex = 1;

    @wire(getFieldSet)
    wiredFields({ error, data }) {
        if (data) {
            this.configureFieldSize(data.map(a => ({ ...a })));
        } else if (error) {
            handleError(error);
        }
    }

    @api
    resetUI() {
        this.showRowCountToast();
        this.defaultValues = {};
        this.serviceDeliveries = [];
        this.addDelivery();
    }

    connectedCallback() {
        loadStyle(this, pmmFolder + "/bsdtOverrides.css");

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

    configureFieldSize(fieldSet) {
        fieldSet.forEach(field => {
            field.disabled = true;

            if (field.apiName === this.fields.quantity.fieldApiName) {
                field.size = 1;
            } else if (field.apiName === this.fields.unitMeasurement.fieldApiName) {
                field.size = 1.5;
            } else {
                field.size = 2;
            }

            if (field.apiName === this.fields.contact.fieldApiName) {
                field.disabled = false;
            }
            this.fieldSet.push(field);
        });
    }

    addDelivery() {
        this.serviceDeliveries.push({ index: this._deliveryIndex });
        this._deliveryIndex++;
        this.rowCount = this.serviceDeliveries.length;
    }

    handleDelete(event) {
        this.serviceDeliveries = this.serviceDeliveries.filter(function(obj) {
            return obj.index !== event.detail;
        });
        if (this.serviceDeliveries.length <= 0) {
            this.addDelivery();
        }
        this.handleDeleteError(event.detail);
    }

    handleDone(event) {
        this.resetUI();
    }

    handleRowError(event) {
        this.errors[event.detail.index] = event.detail.detail;
        this.renderErrors();
    }

    handleClearError(event) {
        let result = this.serviceDeliveries.find(({ index }) => index === event.detail);
        result.hasSaved = true;
        if (this.errors[event.detail]) {
            this.handleDeleteError(event.detail);
        }
    }

    handleDeleteError(index) {
        if (this.errors[index]) {
            delete this.errors[index];
            this.renderErrors();
        }
    }

    renderErrors() {
        this.errors = Object.assign({}, this.errors);
    }

    showRowCountToast() {
        console.log(JSON.parse(JSON.stringify(this.serviceDeliveryObject)));
        let count = 0;
        this.serviceDeliveries.forEach(element => {
            if (element.hasSaved) {
                count++;
            }
        });
        if (count > 0) {
            let toastMessage = count + " " + this.labels.serviceDeliveriesAdded;

            this[NavigationMixin.GenerateUrl]({
                type: "standard__objectPage",
                attributes: {
                    objectApiName: this.serviceDeliveryObject.objectApiName,
                    actionName: "home",
                },
            }).then(url => {
                const event = new ShowToastEvent({
                    title: this.labels.success,
                    variant: "success",
                    mode: "pester",
                    message: "{0}",
                    messageData: [
                        {
                            url,
                            label: toastMessage,
                        },
                    ],
                });
                this.dispatchEvent(event);
            });
        }
    }

    get resetDisabled() {
        return Object.keys(this.errors).length > 0;
    }

    get doneButtonTitle() {
        let result = "";
        Object.values(this.errors).forEach(value => {
            result += value + "\n";
        });
        return result;
    }
}
