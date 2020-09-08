import { LightningElement, track, wire, api } from "lwc";
import SERVICE_PARTICIPANT_OBJECT from "@salesforce/schema/ServiceParticipant__c";
import { getObjectInfo } from "lightning/uiObjectInfoApi";
import ADD_RECORD_LABEL from "@salesforce/label/c.Add_Record";

import { format } from "c/util";

export default class SelectParticipantContainer extends LightningElement {
    @track sectionHeader;
    @api selectedParticipants;
    @api addParticipants;

    labels = {
        addParticipants: ADD_RECORD_LABEL,
    };

    @wire(getObjectInfo, { objectApiName: SERVICE_PARTICIPANT_OBJECT })
    wireSession(result) {
        if (!result) {
            return;
        }

        if (result.data) {
            this.sectionHeader = format(this.labels.addParticipants, [
                result.data.labelPlural,
            ]);
        }
    }

    handleSelectedParticipants(event) {
        this.selectedParticipants = event.detail;
    }

    handleDeletedParticipants(event) {
        this.addParticipants = event.detail;
    }
}
