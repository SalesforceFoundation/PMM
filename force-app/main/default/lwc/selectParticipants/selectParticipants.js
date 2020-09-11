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
import NO_RECORDS_FOUND_LABEL from "@salesforce/label/c.NoRecordsFound";

import getData from "@salesforce/apex/SelectParticipantController.getInitialDataSetup";

const ENGAGEMENTS = "programEngagements";
const COHORTS = "programCohorts";
const LABELS = "labels";
const DELAY = 350;

export default class SelectParticipants extends LightningElement {
    @track contacts;
    @track filteredContacts;
    @track selectedRowCount = 0;
    @track searchValue;
    @track cohortId;
    @track engagements = [];
    @track cohorts = [];
    @track noRecordsFound = false;
    @api programEngagements = [];
    @api serviceId = "a07J000000O62TVIAZ";
    @api programName;
    @api programLabel;
    @api programCohortLabel;
    @api selectedRows;
    @api buttonLabel;
    @api nameField;
    @api emailField;
    @api stageField;
    columns = [];

    @api
    get addParticipants() {
        return this.contacts;
    }

    set addParticipants(value) {
        if (value) {
            this.contacts.push(value);
            this.contacts.sort((a, b) => (a.Name > b.Name ? 1 : -1));
            //TODO: Need to use the below method to sort the array
            //sortObjectsByAttribute(this.contacts, "Name", "asc", true);

            //if filters exist apply the filters
            this.applyFilters(this.contacts);

            let dataTable = this.template.querySelector("lightning-datatable");
            dataTable.data = this.filteredContacts;
        }
    }

    labels = {
        selectedRecords: SELECTED_LABEL,
        addToService: ADD_TO_RECORD_LABEL,
        searchThisList: SEARCH_THIS_LIST_LABEL,
        none: NONE_LABEL,
        noRecordsFound: NO_RECORDS_FOUND_LABEL,
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

    @wire(getData, { serviceId: "$serviceId" })
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
            result = undefined;
        }
    }

    loadDataTable() {
        this.contacts = this.engagements;
        let programEngagements = [];
        this.contacts.forEach(element => {
            let programEngagement = {};
            programEngagement.Id = element.Id;
            programEngagement.Name = element.Contact__r.Name;
            programEngagement.Email = element.Contact__r.Email;
            programEngagement.Stage__c = element.Stage__c;
            programEngagement.ProgramCohort__c = element.ProgramCohort__c;
            programEngagements.push(programEngagement);
            this.programName = element.Program__r.Name;
        });
        this.contacts = programEngagements;
        this.filteredContacts = this.contacts.slice(0);
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
                this.buttonLabel = format(this.labels.addToService, [value]);
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

    get selectedRecordCount() {
        return this.labels.selectedRecords + ": " + this.selectedRowCount;
    }

    handleCohortChange(event) {
        this.cohortId = event.detail.value;

        this.applyFilters(this.contacts);
    }

    handleRowSelected(event) {
        this.selectedRows = event.detail.selectedRows;
        this.selectedRowCount = event.detail.selectedRows.length;
    }

    handleSelectParticipants() {
        let tempContacts = this.contacts.slice(0);

        this.selectedRows.forEach(row => {
            let index = tempContacts.findIndex(element => element.Id === row.Id);
            tempContacts.splice(index, 1);
        });

        this.contacts = tempContacts;
        this.applyFilters(this.contacts);

        this.dispatchEvent(
            new CustomEvent("selectedparticipants", { detail: this.selectedRows })
        );
    }

    enqueueLoadRecords(searchVal) {
        debouncify(this.applyFilters(searchVal).bind(this), DELAY);
    }

    handleInputChange(event) {
        this.searchValue = event.target.value;
        this.applyFilters(this.contacts);
    }

    handleGetContactsByCohort(filteredValue) {
        if (this.cohortId) {
            this.filteredContacts = filteredValue.filter(
                element => element.ProgramCohort__c === this.cohortId
            );
        }
    }

    applyFilters(filteredValue) {
        let searchText = this.searchValue ? this.searchValue.toLowerCase() : "";

        this.filteredContacts = filteredValue.filter(
            element =>
                element.Name.toLowerCase().includes(searchText) ||
                element.Email.toLowerCase().includes(searchText) ||
                element.Stage__c.toLowerCase().includes(searchText)
        );

        this.handleGetContactsByCohort(this.filteredContacts);
        this.noRecordsFound = this.filteredContacts && this.filteredContacts.length === 0;
    }
}
