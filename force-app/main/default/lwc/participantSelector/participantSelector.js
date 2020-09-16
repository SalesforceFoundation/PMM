import { LightningElement, track, api, wire } from "lwc";
import { format, debouncify } from "c/util";

import PROGRAM_OBJECT from "@salesforce/schema/Program__c";
import PROGRAM_COHORT_OBJECT from "@salesforce/schema/ProgramCohort__c";
import SERVICE_PARTICIPANT_OBJECT from "@salesforce/schema/ServiceParticipant__c";
import NAME_FIELD from "@salesforce/schema/contact.Name";
import EMAIL_FIELD from "@salesforce/schema/contact.Email";
import STAGE_FIELD from "@salesforce/schema/ProgramEngagement__c.Stage__c";

import SELECTED_LABEL from "@salesforce/label/c.Selected_Records";
import ADD_TO_RECORD_LABEL from "@salesforce/label/c.Add_to_Record";
import SEARCH_THIS_LIST_LABEL from "@salesforce/label/c.Search_this_list";
import NONE_LABEL from "@salesforce/label/c.None";
import NO_RECORDS_FOUND_LABEL from "@salesforce/label/c.No_Records_Found";
import NO_RECORDS_SELECTED from "@salesforce/label/c.No_Records_Selected";

const SCHEDULENAME = "Thursday Friday Family Class ";
const FIELDNAME = "Name";

import getSelectParticipantModel from "@salesforce/apex/SelectParticipantController.getSelectParticipantModel";

const ENGAGEMENTS = "programEngagements";
const COHORTS = "programCohorts";
const LABELS = "labels";
const DELAY = 350;

export default class ParticipantSelector extends LightningElement {
    @track availableContacts;
    @track filteredContacts;
    @track engagements = [];
    @track cohorts = [];
    @api serviceId;
    selectedRowCount = 0;
    searchValue;
    cohortId;
    noRecordsFound = false;
    programEngagements = [];
    programName;
    programLabel;
    programCohortLabel;
    selectedRows;
    addToServiceButtonLabel;
    nameField;
    emailField;
    stageField;
    columns = [];
    @api participantCapacity = 10;
    @api scheduleName = SCHEDULENAME;
    @api selectedParticipants = [];

    labels = {
        selectedRecords: SELECTED_LABEL,
        addToService: ADD_TO_RECORD_LABEL,
        searchThisList: SEARCH_THIS_LIST_LABEL,
        none: NONE_LABEL,
        noRecordsFound: NO_RECORDS_FOUND_LABEL,
        noRecordsSelected: NO_RECORDS_SELECTED,
    };

    fields = {
        contactName: NAME_FIELD,
        contactEmail: EMAIL_FIELD,
        engagementStage: STAGE_FIELD,
    };

    objects = {
        program: PROGRAM_OBJECT,
        programCohort: PROGRAM_COHORT_OBJECT,
        serviceParticipant: SERVICE_PARTICIPANT_OBJECT,
    };

    selectedColumns = [
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

    deselectParticipant(event) {
        if (event) {
            let tempselectedParticipants = [];
            tempselectedParticipants = [...this.selectedParticipants];

            let index = tempselectedParticipants.findIndex(
                element => element.Id === event.detail.row.Id
            );

            tempselectedParticipants.splice(index, 1);

            this.selectedParticipants = tempselectedParticipants;

            this.availableContacts = [...this.availableContacts, event.detail.row];
            this.availableContacts.sort((a, b) => (a.Name > b.Name ? 1 : -1));

            //if filters exist apply the filters
            this.applyFilters();
        }
    }

    @wire(getSelectParticipantModel, { serviceId: "$serviceId" })
    datasetup(result, error) {
        if (!result) {
            return;
        }

        if (result.data) {
            this.engagements = result.data[ENGAGEMENTS].slice(0);
            this.cohorts = result.data[COHORTS].slice(0);
            let labels = result.data[LABELS];

            this.loadDataTable();
            this.loadProgramCohorts(this.cohorts);
            this.loadLabels(labels);
        } else if (error) {
            console.log(error);
            result.data = undefined;
        }
    }

    loadDataTable() {
        this.availableContacts = this.engagements;
        let programEngagements = [];
        this.availableContacts.forEach(element => {
            let programEngagement = {};
            programEngagement.Id = element.Id;
            programEngagement.Name = element.Contact__r.Name;
            programEngagement.Email = element.Contact__r.Email;
            programEngagement.Stage__c = element.Stage__c;
            programEngagement.ProgramCohort__c = element.ProgramCohort__c;
            programEngagements.push(programEngagement);
            this.programName = element.Program__r.Name;
        });
        this.availableContacts = programEngagements;
        this.filteredContacts = [...this.availableContacts];
        this.noRecordsFound = this.filteredContacts && this.filteredContacts.length === 0;
    }

    loadProgramCohorts(cohorts) {
        this.searchOptions = cohorts.map(element => {
            let newObj = {};
            newObj.label = element.Name;
            newObj.value = element.Id;
            return newObj;
        });
        this.searchOptions.unshift({ label: NONE_LABEL, value: "" });
    }

    loadLabels(labels) {
        for (let [key, value] of Object.entries(labels)) {
            if (key === this.objects.program.objectApiName) {
                this.programLabel = value;
            }
            if (key === this.objects.programCohort.objectApiName) {
                this.programCohortLabel = value;
            }
            if (key === this.objects.serviceParticipant.objectApiName) {
                this.addToServiceButtonLabel = format(this.labels.addToService, [value]);
            }
            if (key === this.fields.contactName.fieldApiName) {
                this.nameField = value;
            }
            if (key === this.fields.contactEmail.fieldApiName) {
                this.emailField = value;
            }
            if (key === this.fields.engagementStage.fieldApiName) {
                this.stageField = value;
            }
        }

        this.setDataTableColumns(this.nameField, this.emailField, this.stageField);
    }

    setDataTableColumns(name, email, stage) {
        this.columns = [
            {
                label: name,
                fieldName: this.fields.contactName.fieldApiName,
                hideDefaultActions: true,
            },
            {
                label: email,
                fieldName: this.fields.contactEmail.fieldApiName,
                hideDefaultActions: true,
            },
            {
                label: stage,
                fieldName: this.fields.engagementStage.fieldApiName,
                hideDefaultActions: true,
            },
        ];
    }

    get selectedRecordCountMessage() {
        return this.labels.selectedRecords + ": " + this.selectedRowCount;
    }

    handleCohortChange(event) {
        this.cohortId = event.detail.value;

        this.applyFilters();
    }

    handleRowSelected(event) {
        this.selectedRows = event.detail.selectedRows;
        this.selectedRowCount = event.detail.selectedRows.length;
    }

    handleSelectParticipants() {
        let tempContacts = [...this.availableContacts];
        this.selectedRows.forEach(row => {
            let index = tempContacts.findIndex(element => element.Id === row.Id);
            tempContacts.splice(index, 1);

            this.selectedParticipants.push(row);
        });

        this.selectedParticipants = [...this.selectedParticipants];
        this.availableContacts = tempContacts;
        this.applyFilters();
    }

    enqueueLoadRecords() {
        debouncify(this.applyFilters().bind(this), DELAY);
    }

    handleInputChange(event) {
        this.searchValue = event.target.value;
        this.applyFilters();
    }

    handleGetContactsByCohort(filteredValue) {
        if (this.cohortId) {
            this.filteredContacts = filteredValue.filter(
                element => element.ProgramCohort__c === this.cohortId
            );
        }
    }

    applyFilters() {
        let searchText = this.searchValue ? this.searchValue.toLowerCase() : "";

        this.filteredContacts = this.availableContacts.filter(
            element =>
                element.Name.toLowerCase().includes(searchText) ||
                element.Email.toLowerCase().includes(searchText) ||
                element.Stage__c.toLowerCase().includes(searchText)
        );

        this.handleGetContactsByCohort(this.filteredContacts);
        this.noRecordsFound = this.filteredContacts && this.filteredContacts.length === 0;
    }
}
