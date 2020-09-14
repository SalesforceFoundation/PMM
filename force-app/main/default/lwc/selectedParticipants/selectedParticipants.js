import { LightningElement, api } from "lwc";

import NO_RECORDS_SELECTED from "@salesforce/label/c.NoRecordsSelected";

const SCHEDULENAME = "Thursday Friday Family Class ";
const FIELDNAME = "Name";

export default class SelectedParticipants extends LightningElement {
    @api participantCapacity = 10;
    @api scheduleName = SCHEDULENAME;
    @api selectedParticipants = [];

    labels = { noRecordsSelected: NO_RECORDS_SELECTED };
    columns = [
        {
            label: "",
            fieldName: FIELDNAME,
            hideDefaultActions: true,
        },
        {
            fieldName: "",
            type: "button-icon",
            hideDefaultActions: true,
            typeAttributes: {
                iconName: "utility:clear",
                variant: "bare",
                iconPosition: "left",
                disabled: false,
            },
        },
    ];

    get noRecordsSelected() {
        return this.selectedParticipants && this.selectedParticipants.length === 0;
    }

    get participantCount() {
        return this.selectedParticipants ? this.selectedParticipants.length : 0;
    }

    get scheduleHeader() {
        return (
            this.scheduleName +
            "(" +
            this.participantCount +
            "/" +
            this.participantCapacity +
            ")"
        );
    }

    handleRemove(event) {
        this.dispatchEvent(
            new CustomEvent("deletedparticipant", { detail: event.detail.row })
        );
    }
}
