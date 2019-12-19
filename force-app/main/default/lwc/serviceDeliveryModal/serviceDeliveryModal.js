import { LightningElement, wire, api, track } from "lwc";
import { registerListener, unregisterListener } from "c/pubsub";
import { CurrentPageReference } from "lightning/navigation";
import serviceDeliveries from "@salesforce/label/c.Service_Deliveries";

export default class ServiceDeliveryModal extends LightningElement {
    @wire(CurrentPageReference) pageRef;

    @track defaultValues;

    labels = {
        serviceDeliveries,
    };

    connectedCallback() {
        registerListener("OpenPmdmBulkServiceDelivery", this.handleOpenModal, this);
        registerListener("serviceDeliveryUpsert", this.handleServiceDeliveryUpsert, this);
        registerListener("serviceDeliveryDelete", this.handleServiceDeliveryDelete, this);
    }

    disconnectedCallback() {
        unregisterListener("OpenPmdmBulkServiceDelivery", this.handleOpenModal, this);
        unregisterListener(
            "serviceDeliveryUpsert",
            this.handleServiceDeliveryUpsert,
            this
        );
        unregisterListener(
            "serviceDeliveryDelete",
            this.handleServiceDeliveryDelete,
            this
        );
    }

    handleOpenModal() {
        this.showModal();
    }

    @api
    showModal(value) {
        this.defaultValues = value;
        this.template.querySelector("c-modal").show();
    }

    @api
    showNewModal(value) {
        this.defaultValues = value;
        const bulkUI = this.template.querySelector("c-bulk-service-delivery-u-i");
        bulkUI.resetUI();
        this.template.querySelector("c-modal").show();
    }

    @api
    hideModal() {
        this.template.querySelector("c-modal").hide();
    }

    handleServiceDeliveryUpsert(serviceDelivery) {
        this.dispatchEvent(
            new CustomEvent("servicedeliveryupsert", {
                detail: {
                    serviceDelivery: serviceDelivery,
                },
            })
        );
    }

    handleServiceDeliveryDelete(serviceDeliveryId) {
        this.dispatchEvent(
            new CustomEvent("servicedeliverydelete", {
                detail: {
                    serviceDeliveryId: serviceDeliveryId,
                },
            })
        );
    }
}
