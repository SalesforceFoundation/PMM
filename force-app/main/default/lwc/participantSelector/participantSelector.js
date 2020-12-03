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
import PE_CONTACT_FIELD from "@salesforce/schema/ProgramEngagement__c.Contact__c";

export default class ParticipantSelector extends LightningElement {
    @track availableEngagements;
    @track filteredEngagements;
    @track engagements;
    @track cohorts;
    @api serviceId;
    @api serviceScheduleModel;
    @api selectedParticipants = [];
    @api existingContactIds = [];
    @api columns;

    selectedRowCount = 0;
    searchValue;
    noRecordsFound = false;
    cohortId;
    programName;
    selectedRows;
    addToServiceButtonLabel;
    selectedColumns;
    fields;
    fieldByFieldPath;
    objectLabels;
    isLoaded = false;
    rendered = false;

    @api
    get newParticipantsProgramEngagements() {
        let result = [];
        this.selectedParticipants.forEach(row => {
            let contactId = row[PE_CONTACT_FIELD.fieldApiName];
            if (!this.existingContactIds.includes(contactId)) {
                result.push(row);
            }
        });
        return result;
    }

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
    dataSetup(result) {
        if (!(result.data || result.error)) {
            return;
        }

        if (result.data) {
            this.fields = result.data.fields;
            this.fieldByFieldPath = result.data.fieldByFieldPath;
            this.objectLabels = result.data.objectLabels;
            this.engagements = result.data.programEngagements.slice(0);
            this.cohorts = result.data.programCohorts.slice(0);
            this.programName = result.data.program ? result.data.program.Name : "";

            this.setDataTableColumns();
            this.setSelectedColumns();
            this.loadDataTable();
            this.loadPreviousSelections();
            this.loadProgramCohorts(this.cohorts);
        } else if (result.error) {
            console.log(result.error);
            this.engagements = undefined;
            this.cohorts = undefined;
        }

        this.isLoaded = true;
        this.dispatchEvent(new CustomEvent("loaded", { detail: this.isLoaded }));
    }

    loadDataTable() {
        this.availableEngagements = this.engagements.map(engagement => {
            // Flatten relationship fields
            let programEngagement = { ...engagement };
            for (const [field, value] of Object.entries(programEngagement)) {
                if (typeof value === "object") {
                    for (const [parentField, parentValue] of Object.entries(value)) {
                        programEngagement[field + parentField] = parentValue;
                    }
                }
            }

            return programEngagement;
        });

        this.sortData(this.availableEngagements);
        this.filteredEngagements = [...this.availableEngagements];
        this.noRecordsFound =
            this.filteredEngagements && this.filteredEngagements.length === 0;
    }

    sortData(engagements) {
        if (!(this.columns && this.columns.length && engagements && engagements.length)) {
            return;
        }

        let firstColumn = this.columns[0].fieldName;
        engagements.sort((a, b) => {
            return a[firstColumn] > b[firstColumn] ? 1 : -1;
        });
    }

    loadPreviousSelections() {
        if (this.serviceScheduleModel.selectedParticipants === undefined) {
            return;
        }
        this.selectedRows = [...this.serviceScheduleModel.selectedParticipants];
        this.availableEngagements.forEach(eng => {
            if (this.existingContactIds.includes(eng[PE_CONTACT_FIELD.fieldApiName])) {
                eng.disableDeselect = true;
                this.selectedRows.push(eng);
            }
        });
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
        this.columns = [];

        for (const [key, value] of Object.entries(this.fieldByFieldPath)) {
            if (value.hidden) {
                continue;
            }

            let column = {
                label: value.label,
                fieldName: key.replace(".", ""),
                hideDefaultActions: true,
            };
            this.columns.push(column);
        }
    }

    setSelectedColumns() {
        let min = Math.min(this.columns.length, 2);

        this.selectedColumns = this.columns.slice(0, min);
        this.selectedColumns.push({
            fieldName: "",
            type: "button-icon",
            hideDefaultActions: true,
            typeAttributes: {
                iconName: "utility:clear",
                variant: "bare",
                iconPosition: "left",
                disabled: { fieldName: "disableDeselect" },
            },
        });
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
        this.sortData(this.selectedParticipants);
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
            this.sortData(this.availableEngagements);

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
            row =>
                JSON.stringify(row)
                    .toLowerCase()
                    .includes(searchText) &&
                (this.cohortId
                    ? row[this.fields.programCohort.apiName] === this.cohortId
                    : true)
        );

        this.noRecordsFound =
            this.filteredEngagements && this.filteredEngagements.length === 0;
    }
}
