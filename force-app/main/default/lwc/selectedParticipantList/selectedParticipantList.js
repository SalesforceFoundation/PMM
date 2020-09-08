import { LightningElement, api, track } from "lwc";

const SCHEDULENAME = "Thursday Friday Family Class ()";
const FIELDNAME = "Name";
export default class SelectedParticipantList extends LightningElement {
    @api participantCapacity;
    @api scheduleName = SCHEDULENAME;
    @track selectedParticipants = [];

    columns = [
        {
            label: this.scheduleName,
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
    get contactData() {
        return this.selectedParticipants;
    }

    set contactData(value) {
        if (value) {
            value.forEach(element => {
                this.selectedParticipants.push(element);
            });
            this.setDataTableData(this.selectedParticipants);
        }
    }

    handleDelete(event) {
        let tempselectedParticipants = [];
        tempselectedParticipants = this.selectedParticipants.slice(0);

        let index = tempselectedParticipants.findIndex(
            element => element.Id === event.detail.row.Id
        );

        tempselectedParticipants.splice(index, 1);
        this.selectedParticipants = tempselectedParticipants;

        this.setDataTableData(this.selectedParticipants);

        this.dispatchEvent(
            new CustomEvent("deletedparticipants", { detail: event.detail.row })
        );
    }

    setDataTableData(data) {
        let dataTable = this.template.querySelector("lightning-datatable");
        dataTable.data = data;
    }
}
