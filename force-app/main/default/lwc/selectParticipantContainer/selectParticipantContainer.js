import { LightningElement, track, wire, api } from "lwc";
import SERVICE_PARTICIPANT_OBJECT from "@salesforce/schema/ServiceParticipant__c";
import { getObjectInfo } from "lightning/uiObjectInfoApi";
import ADD_RECORD_LABEL from "@salesforce/label/c.Add_Record";

import { format } from "c/util";

export default class SelectParticipantContainer extends LightningElement {
    @track sectionHeader;
    @api selectedParticipants = [];
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

    @api
    handleSelectedParticipants(event) {
        if (event.detail) {
            event.detail.forEach(element => {
                this.selectedParticipants = [...this.selectedParticipants, element];
            });
        }
    }

    handleDeletedParticipant(event) {
        let tempselectedParticipants = [];
        tempselectedParticipants = [...this.selectedParticipants];

        let index = tempselectedParticipants.findIndex(
            element => element.Id === event.detail.Id
        );

        tempselectedParticipants.splice(index, 1);

        this.selectedParticipants = tempselectedParticipants;

        this.template
            .querySelector("c-participant-selector")
            .reAddParticipant(event.detail);
    }
}
