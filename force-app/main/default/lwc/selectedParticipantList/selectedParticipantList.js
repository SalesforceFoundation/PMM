import { LightningElement, api, track } from "lwc";

export default class SelectedParticipantList extends LightningElement {
    @api participantCapacity;
    @api scheduleName = "Thursday Friday Family Class ()";
    @track selectedParticipants = [];

    columns = [
        {
            label: this.scheduleName,
            fieldName: "Name",
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
