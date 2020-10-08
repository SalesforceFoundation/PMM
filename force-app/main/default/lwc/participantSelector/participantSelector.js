/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { LightningElement, track, api, wire } from "lwc";

import getSelectParticipantModel from "@salesforce/apex/ServiceScheduleCreatorController.getSelectParticipantModel";

export default class ParticipantSelector extends LightningElement {
    @track availableEngagements;
    @track filteredEngagements;
    @track engagements;
    @track cohorts;
    @api serviceId;
    @api serviceScheduleModel;
    @api selectedParticipants = [];

    selectedRowCount = 0;
    searchValue;
    noRecordsFound = false;
    cohortId;
    programName;
    selectedRows;
    addToServiceButtonLabel;
    columns;
    selectedColumns;
    fields;
    objectLabels;
    isLoaded = false;

    get labels() {
        return this.serviceScheduleModel.labels.serviceParticipant
            ? this.serviceScheduleModel.labels.serviceParticipant
            : {};
    }

    get showCapacityWarning() {
        return (
            this.capacity !== undefined &&
            this.participantCount &&
            this.capacity < this.participantCount
        );
    }

    get noRecordsSelected() {
        return this.selectedParticipants && this.selectedParticipants.length === 0;
    }

    get selectedRecordCountMessage() {
        return this.labels.selectedRecords + ": " + this.selectedRowCount;
    }

    get participantCount() {
        return this.selectedParticipants ? this.selectedParticipants.length : 0;
    }

    get capacity() {
        return this.serviceScheduleModel.serviceSchedule[this.fields.capacity.apiName];
    }

    get scheduleHeader() {
        let capacity = this.serviceScheduleModel.serviceSchedule[
            this.fields.capacity.apiName
        ];

        let name = this.serviceScheduleModel.serviceSchedule[this.fields.name.apiName];

        if (capacity === undefined) {
            return name;
        }

        return `${name} (${this.participantCount}/${this.capacity})`;
    }

    @wire(getSelectParticipantModel, { serviceId: "$serviceId" })
    dataSetup(result, error) {
        if (!result) {
            return;
        }

        if (result.data) {
            this.fields = result.data.fields;
            this.objectLabels = result.data.objectLabels;
            this.engagements = result.data.programEngagements.slice(0);
            this.cohorts = result.data.programCohorts.slice(0);
            this.programName = result.data.program ? result.data.program.Name : "";

            this.loadDataTable();
            this.loadPreviousSelections();
            this.loadProgramCohorts(this.cohorts);
            this.setDataTableColumns();
            this.setSelectedColumns();
            this.isLoaded = true;
        } else if (error) {
            console.log(error);
            this.engagements = undefined;
            this.cohorts = undefined;
            this.isLoaded = true;
        }
    }

    loadDataTable() {
        this.availableEngagements = this.engagements.map(engagement => {
            // Flatten relationship fields
            let contact = {
                Name: engagement[this.fields.contact.relationshipName].Name,
                Email: engagement[this.fields.contact.relationshipName].Email,
            };
            let programEngagement = { ...engagement };

            return Object.assign(contact, programEngagement);
        });

        this.filteredEngagements = [...this.availableEngagements];
        this.noRecordsFound =
            this.filteredEngagements && this.filteredEngagements.length === 0;
    }

    loadPreviousSelections() {
        if (this.serviceScheduleModel.selectedParticipants === undefined) {
            return;
        }

        this.selectedRows = this.serviceScheduleModel.selectedParticipants;
        this.handleSelectParticipants();
    }

    loadProgramCohorts(cohorts) {
        this.searchOptions = cohorts.map(element => {
            let newObj = {};
            newObj.label = element.Name;
            newObj.value = element.Id;
            return newObj;
        });
        this.searchOptions.unshift({ label: this.labels.none, value: "" });
    }

    setDataTableColumns() {
        this.columns = [
            {
                label: this.fields.contactName.label,
                fieldName: this.fields.contactName.apiName,
                hideDefaultActions: true,
            },
            {
                label: this.fields.contactEmail.label,
                fieldName: this.fields.contactEmail.apiName,
                hideDefaultActions: true,
            },
            {
                label: this.fields.engagementStage.label,
                fieldName: this.fields.engagementStage.apiName,
                hideDefaultActions: true,
            },
        ];
    }

    setSelectedColumns() {
        this.selectedColumns = [
            {
                label: this.fields.contactName.label,
                fieldName: this.fields.contactName.apiName,
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
        let tempContacts = [...this.availableEngagements];
        this.selectedRows.forEach(row => {
            let index = tempContacts.findIndex(element => element.Id === row.Id);
            tempContacts.splice(index, 1);

            this.selectedParticipants.push(row);
        });

        this.selectedParticipants = [...this.selectedParticipants];
        this.availableEngagements = tempContacts;
        this.applyFilters();
    }

    handleDeselectParticipant(event) {
        if (event) {
            let tempSelectedParticipants = [...this.selectedParticipants];

            let index = tempSelectedParticipants.findIndex(
                element => element.Id === event.detail.row.Id
            );

            tempSelectedParticipants.splice(index, 1);

            this.selectedParticipants = tempSelectedParticipants;

            this.availableEngagements = [...this.availableEngagements, event.detail.row];
            this.availableEngagements.sort((a, b) => (a.Name > b.Name ? 1 : -1));

            //if filters exist apply the filters
            this.applyFilters();
        }
    }

    handleInputChange(event) {
        this.searchValue = event.target.value;
        this.applyFilters();
    }

    applyFilters() {
        let searchText = this.searchValue ? this.searchValue.toLowerCase() : "";

        this.filteredEngagements = this.availableEngagements.filter(
            element =>
                (element.Name.toLowerCase().includes(searchText) ||
                    element.Email.toLowerCase().includes(searchText) ||
                    element[this.fields.engagementStage.apiName]
                        .toLowerCase()
                        .includes(searchText)) &&
                (this.cohortId
                    ? element[this.fields.programCohort.apiName] === this.cohortId
                    : true)
        );

        this.noRecordsFound =
            this.filteredEngagements && this.filteredEngagements.length === 0;
    }
}
