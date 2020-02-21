import { LightningElement, track, wire } from "lwc";
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { getObjectInfo } from "lightning/uiObjectInfoApi";
import { format, handleError } from "c/util";
import getFieldSet from "@salesforce/apex/FieldSetController.getFieldSetForLWC";
import PROGRAM_ENGAGEMENT_OBJECT from "@salesforce/schema/ProgramEngagement__c";
import NAME_FIELD from "@salesforce/schema/ProgramEngagement__c.Name";
import RECORD_CREATED from "@salesforce/label/c.Record_Created";
import NEW_RECORD_FORMAT from "@salesforce/label/c.New_Record_Dynamic";

const QUICK_CREATE = "QuickCreate";

export default class ProgramEngagementQuickCreate extends LightningElement {
    @track objectApiName = PROGRAM_ENGAGEMENT_OBJECT.objectApiName;
    @track objectLabel;
    @track fields;
    recordName;

    /** Using a fieldset since the compact layout is not available
     *  when using record form to create a record. See "Creating a Record",
     *      "The compact layout cannot be used for creating records.
     *       If you specify layout-type="Compact", the full layout is shown. "
     *  https://developer.salesforce.com/docs/component-library/bundle/lightning-record-form/documentation
     */
    @wire(getFieldSet, { objectName: "$objectApiName", fieldSetName: QUICK_CREATE })
    wiredFields({ err, data }) {
        if (data) {
            this.fields = [];
            data.forEach(fieldSetMember => {
                this.fields.push(fieldSetMember.apiName);
            });
        } else if (err) {
            this.fields = undefined;
            handleError(err);
        }
    }

    @wire(getObjectInfo, { objectApiName: PROGRAM_ENGAGEMENT_OBJECT })
    contactObjectInfo({ data, err }) {
        if (data) {
            this.objectLabel = data.label;
        } else if (err) {
            handleError(err);
        }
    }

    handleSubmit(event) {
        event.preventDefault();
        const formFields = event.detail.fields;
        if (!formFields[NAME_FIELD]) {
            formFields[NAME_FIELD] = format(NEW_RECORD_FORMAT, {
                0: this.objectLabel,
            });
        }

        this.template.querySelector("lightning-record-form").submit(formFields);
    }

    handleSuccess(event) {
        const title = format(RECORD_CREATED, {
            object: this.objectLabel,
            name: event.detail.fields.Name.value,
        });
        const toastEvent = new ShowToastEvent({
            title: title,
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
        this.dispatchEvent(new CustomEvent("cancel"));
    }
}
