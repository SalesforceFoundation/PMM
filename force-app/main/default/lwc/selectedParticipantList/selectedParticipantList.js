import { LightningElement, api, track } from "lwc";

import NO_RECORDS_SELECTED from "@salesforce/label/c.NoRecordsSelected";

const SCHEDULENAME = "Thursday Friday Family Class ";
const FIELDNAME = "Name";
export default class SelectedParticipantList extends LightningElement {
    @api participantCapacity = 10;
    @api scheduleName = SCHEDULENAME;
    @track selectedParticipants = [];
    @track noRecordsSelected = true;

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

    //Need to return a schedule name with capacity here
    @api
    get participantData() {
        return this.selectedParticipants;
    }

    set participantData(value) {
        if (value) {
            value.forEach(element => {
                this.selectedParticipants = [...this.selectedParticipants, element];
            });

            this.noRecordsSelected =
                this.selectedParticipants && this.selectedParticipants.length === 0;
        }
    }

    get participantCount() {
        return this.selectedParticipants.length;
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

    handleDelete(event) {
        let tempselectedParticipants = [];
        tempselectedParticipants = this.selectedParticipants.slice(0);

        let index = tempselectedParticipants.findIndex(
            element => element.Id === event.detail.row.Id
        );

        tempselectedParticipants.splice(index, 1);
        this.selectedParticipants = tempselectedParticipants;

        this.noRecordsSelected =
            this.selectedParticipants && this.selectedParticipants.length === 0;

        this.dispatchEvent(
            new CustomEvent("deletedparticipants", { detail: event.detail.row })
        );
    }
}
