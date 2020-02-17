import { LightningElement, wire, track } from "lwc";
import { format } from "c/util";
import { NavigationMixin } from "lightning/navigation";
import { getObjectInfo } from "lightning/uiObjectInfoApi";
import CONTACT_OBJECT from "@salesforce/schema/Contact";
import PROGRAM_ENGAGEMENT_OBJECT from "@salesforce/schema/ProgramEngagement__c";

// Labels
import ADD_CONTACT_TO_PROGRAM from "@salesforce/label/c.Add_Contact_To_Program";
import BULK_SERVICE_DELIVERIES from "@salesforce/label/c.Bulk_Service_Deliveries";
import NEW_RECORD_FORMAT from "@salesforce/label/c.New_Record_Dynamic";

export default class HomeQuickActions extends NavigationMixin(LightningElement) {
    @track label = {
        bulkServiceDelivery: BULK_SERVICE_DELIVERIES,
        newProgramEngagement: ADD_CONTACT_TO_PROGRAM,
    };
    @track error;

    @wire(getObjectInfo, { objectApiName: CONTACT_OBJECT })
    contactObjectInfo({ data, error }) {
        if (data) {
            this.label.newContactLabel = data.label;
        } else if (error) {
            this.error = error;
        }
    }

    get newContactLabel() {
        return format(NEW_RECORD_FORMAT, {
            0: this.label.newContactLabel,
        });
    }

    navigateToNewContact() {
        this[NavigationMixin.Navigate]({
            type: "standard__objectPage",
            attributes: {
                objectApiName: CONTACT_OBJECT.objectApiName,
                actionName: "new",
            },
        });
    }

    navigateToBulkServiceDeliveries() {
        this[NavigationMixin.Navigate]({
            type: "standard__navItemPage",
            attributes: {
                apiName: "Bulk_Service_Deliveries",
            },
        });
    }

    navigateToNewProgramEngagement() {
        this[NavigationMixin.Navigate]({
            type: "standard__objectPage",
            attributes: {
                objectApiName: PROGRAM_ENGAGEMENT_OBJECT.objectApiName,
                actionName: "new",
            },
        });
    }
}
