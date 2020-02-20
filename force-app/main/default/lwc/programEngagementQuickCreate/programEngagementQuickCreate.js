import { LightningElement, track, wire } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { handleError } from "c/util";
import PROGRAM_ENGAGEMENT_OBJECT from "@salesforce/schema/ProgramEngagement__c";
import NAME_FIELD from "@salesforce/schema/ProgramEngagement__c.Name";
import getFieldSet from "@salesforce/apex/FieldSetController.getFieldSetForLWC";

const QUICK_CREATE = "QuickCreate";

export default class ProgramEngagementQuickCreate extends LightningElement {
    @track objectApiName = PROGRAM_ENGAGEMENT_OBJECT.objectApiName;
    @track fields;

    /** Using a fieldset since the compact layout is not available
     *  when using record form to create a record. See "Creating a Record",
     *      "The compact layout cannot be used for creating records.
     *       If you specify layout-type="Compact", the full layout is shown. "
     *  https://developer.salesforce.com/docs/component-library/bundle/lightning-record-form/documentation
     */
    @wire(getFieldSet, { objectName: "$objectApiName", fieldSetName: QUICK_CREATE })
    wiredFields({ error, data }) {
        if (data) {
            this.fields = [];
            data.forEach(fieldSetMember => {
                this.fields.push(fieldSetMember.apiName);
            });
        } else if (error) {
            this.fields = undefined;
            handleError(error);
        }
    }

    handleSubmit(event) {
        event.preventDefault();
        const formFields = event.detail.fields;
        formFields[NAME_FIELD] = "Program Engagement Name";
        this.template.querySelector("lightning-record-form").submit(formFields);
    }

    handleSuccess(event) {
        const toastEvent = new ShowToastEvent({
            title: "Record created",
            message: "Record: " + event.detail.id,
            variant: "success",
        });
        this.dispatchEvent(toastEvent);
        this.dispatchEvent(
            new CustomEvent("success", {
                detail: event.detail,
            })
        );
    }

    handleCancel(event) {
        event.preventDefault();
        this.dispatchEvent(new CustomEvent("cancel", { bubbles: true }));
    }
}
