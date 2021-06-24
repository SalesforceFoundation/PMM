/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { LightningElement, track, api, wire } from "lwc";
import { format } from "c/util";

import getSelectParticipantModel from "@salesforce/apex/ServiceScheduleCreatorController.getSelectParticipantModel";

import PROGRAM_ENGAGEMENT_CONTACT_FIELD from "@salesforce/schema/ProgramEngagement__c.Contact__c";

import addRecord from "@salesforce/label/c.Add_Record";
import selectContacts from "@salesforce/label/c.BSDT_Select_Contacts";
import selectedContacts from "@salesforce/label/c.BSDT_Selected_Contacts";
import capacityWarning from "@salesforce/label/c.Participant_Capacity_Warning";
import selectedRecords from "@salesforce/label/c.Selected_Records";
import searchThisList from "@salesforce/label/c.Search_this_list";
import none from "@salesforce/label/c.None";
import noRecordsFound from "@salesforce/label/c.No_Records_Found";
import noRecordsSelected from "@salesforce/label/c.No_Records_Selected";
import filterByRecord from "@salesforce/label/c.Filter_By_Record";
import noContactsSelected from "@salesforce/label/c.No_Service_Participants_Created_Warning";
import add from "@salesforce/label/c.Add";
import addAll from "@salesforce/label/c.Add_All";
export default class ParticipantSelector extends LightningElement {
    @api serviceId;
    @api serviceSchedule;
    @api existingContactIds = [];
    @api selectedParticipants = [];
    @api columns;
    @api selectedRows;
    selectorColumns;

    @track availableEngagements;
    @track filteredEngagements;
    @track engagements;
    @track cohorts;
    @track data = [];

    searchValue;
    noRecordsFound = false;
    cohortId;
    programName;
    addToServiceButtonLabel;
    selectedColumns;
    fields;
    fieldByFieldPath;
    objectLabels;
    isLoaded = false;
    rendered = false;
    offsetRows = 50;
    offset = this.offsetRows;

    labels = {
        selectContacts,
        selectedContacts,
        capacityWarning,
        selectedRecords,
        searchThisList,
        none,
        noRecordsFound,
        noRecordsSelected,
        noContactsSelected,
        add,
        addAll,
    };

    @api
    get newParticipantsProgramEngagements() {
        let result = [];
        this.selectedParticipants.forEach(row => {
            let contactId = row[PROGRAM_ENGAGEMENT_CONTACT_FIELD.fieldApiName];
            if (!this.existingContactIds.includes(contactId)) {
                result.push(row);
            }
        });
        return result;
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

    get participantCount() {
        return this.selectedParticipants ? this.selectedParticipants.length : 0;
    }

    get capacity() {
        return this.serviceSchedule
            ? this.serviceSchedule[this.fields.capacity.apiName]
            : undefined;
    }

    get selectedHeader() {
        if (this.serviceSchedule) {
            return this.scheduleHeader;
        }

        return this.labels.selectedContacts;
    }

    get title() {
        if (this.serviceSchedule) {
            return this.labels.addServiceParticipants;
        }

        return this.labels.selectContacts;
    }

    get scheduleHeader() {
        let name = this.serviceSchedule[this.fields.name.apiName];

        if (this.capacity === undefined) {
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

            this.formatLabels();
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

    formatLabels() {
        this.labels.addServiceParticipants = format(addRecord, [
            this.objectLabels.serviceParticipant.objectPluralLabel,
        ]);
        this.labels.filterByCohort = format(filterByRecord, [
            this.objectLabels.programCohort.objectLabel,
        ]);
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
        this.applyFilters();
        this.noRecordsFound =
            this.filteredEngagements && this.filteredEngagements.length === 0;
    }

    get enableInfiniteLoading() {
        return this.offset < this.filteredEngagements.length;
    }

    handleLoadMore() {
        this.offset += this.offsetRows;
        this.data = this.filteredEngagements.slice(
            0,
            Math.min(this.offset, this.filteredEngagements.length)
        );
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
        if (this.selectedRows === undefined) {
            return;
        }
        this.selectedRows = [...this.selectedRows];
        this.availableEngagements.forEach(eng => {
            if (
                this.existingContactIds.includes(
                    eng[PROGRAM_ENGAGEMENT_CONTACT_FIELD.fieldApiName]
                )
            ) {
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

            this.selectorColumns = [...this.columns];

            this.selectorColumns.push({
                fieldName: "",
                type: "button",
                hideDefaultActions: true,
                typeAttributes: {
                    name: "add",
                    label: this.labels.add,
                    title: this.labels.add,
                    variant: "neutral",
                    iconPosition: "left",
                },
            });
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

    handleSelectAll() {
        this.handleSelect([...this.filteredEngagements]);
    }

    handleSelectParticipant(event) {
        this.handleSelect([event.detail.row]);
    }

    handleSelectParticipants() {
        this.handleSelect(this.selectedRows);
    }

    handleSelect(programEngagements) {
        programEngagements.forEach(row => {
            let index = this.availableEngagements.findIndex(
                element => element.Id === row.Id
            );
            this.availableEngagements.splice(index, 1);
            this.selectedParticipants.push(row);
        });

        this.selectedParticipants = [...this.selectedParticipants];
        this.applyFilters();
        this.sortData(this.selectedParticipants);
        this.dispatchSelectEvent();
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
            this.dispatchSelectEvent();
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
        this.data = this.filteredEngagements.slice(
            0,
            Math.min(this.filteredEngagements.length, this.offset)
        );
    }

    dispatchSelectEvent() {
        this.dispatchEvent(
            new CustomEvent("select", {
                detail: {
                    totalSelected: this.selectedParticipants.length,
                },
            })
        );
    }
}
