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
import { refreshApex } from "@salesforce/apex";

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
import cancel from "@salesforce/label/c.Cancel";
import save from "@salesforce/label/c.Save";
import saveAndNew from "@salesforce/label/c.Save_New";
import cantFind from "@salesforce/label/c.Cant_Find_Participant";
import newLabel from "@salesforce/label/c.New";

export default class ParticipantSelector extends LightningElement {
    @api serviceId;
    @api serviceSchedule;
    @api existingContactIds = [];
    @api selectedEngagements = [];
    @api columns;
    @api previouslySelectedEngagements;
    selectorColumns;

    @track availableEngagementRows;
    @track filteredEngagements;
    @track allEngagements;
    @track cohorts;
    @track availableEngagementsForSelection = [];

    searchValue;
    cohortId;
    programName;
    programId;
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
        save,
        saveAndNew,
        cancel,
        cantFind,
        newLabel,
    };

    @api
    get newParticipantsProgramEngagements() {
        let result = [];
        this.selectedEngagements.forEach(row => {
            let contactId = row[PROGRAM_ENGAGEMENT_CONTACT_FIELD.fieldApiName];
            if (
                !this.existingContactIds ||
                !this.existingContactIds.includes(contactId)
            ) {
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

    get noRecordsFound() {
        return this.filteredEngagements && this.filteredEngagements.length === 0;
    }

    get noRecordsSelected() {
        return this.selectedEngagements && this.selectedEngagements.length === 0;
    }

    get participantCount() {
        return this.selectedEngagements ? this.selectedEngagements.length : 0;
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
        this.wiredData = result;
        if (!(result.data || result.error) || this.isLoaded) {
            return;
        }

        if (result.data) {
            this.fields = result.data.fields;
            this.fieldByFieldPath = result.data.fieldByFieldPath;
            this.objectLabels = result.data.objectLabels;
            this.allEngagements = result.data.programEngagements.slice(0);
            this.cohorts = result.data.programCohorts.slice(0);
            this.programName = result.data.program ? result.data.program.Name : "";
            this.programId = result.data.program ? result.data.program.Id : "";

            this.formatLabels();
            this.setDataTableColumns();
            this.setSelectedColumns();
            this.loadDataTable();
            this.loadPreviousSelections();
            this.loadProgramCohorts(this.cohorts);
        } else if (result.error) {
            this.allEngagements = undefined;
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
        this.availableEngagementRows = this.allEngagements.map(engagement => {
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

        this.sortData(this.availableEngagementRows);

        this.applyFilters();
    }

    get enableInfiniteLoading() {
        return this.offset < this.filteredEngagements.length;
    }

    handleNewParticipantClick() {
        const newParticipant = this.template.querySelector("c-new-program-engagement");
        newParticipant.showModal();
    }

    handleNewParticipantSuccess(event) {
        this.processNewParticipant(event.detail);
    }

    async processNewParticipant(id) {
        this.isLoaded = false;
        await refreshApex(this.wiredData);
        this.handleSelectById(id);
    }

    handleLoadMore() {
        this.offset += this.offsetRows;
        this.availableEngagementsForSelection = this.filteredEngagements.slice(
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
        if (this.previouslySelectedEngagements === undefined) {
            return;
        }
        this.previouslySelectedEngagements = [...this.previouslySelectedEngagements];
        this.availableEngagementRows.forEach(eng => {
            if (
                this.existingContactIds.includes(
                    eng[PROGRAM_ENGAGEMENT_CONTACT_FIELD.fieldApiName]
                )
            ) {
                eng.disableDeselect = true;
                this.previouslySelectedEngagements.push(eng);
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
        this.handleSelect(this.previouslySelectedEngagements);
    }

    handleSelectById(programEngagementId) {
        let index = this.availableEngagementRows.findIndex(
            element => element.Id === programEngagementId
        );

        if (index) {
            this.handleSelect([this.availableEngagementRows[index]]);
        }
    }

    handleSelect(programEngagements) {
        programEngagements.forEach(row => {
            let index = this.availableEngagementRows.findIndex(
                element => element.Id === row.Id
            );
            this.availableEngagementRows.splice(index, 1);
            if (!this.selectedEngagements.includes(row)) {
                this.selectedEngagements.push(row);
            }
        });

        this.selectedEngagements = [...this.selectedEngagements];
        this.applyFilters();
        this.sortData(this.selectedEngagements);
        this.dispatchSelectEvent();
    }

    handleDeselectParticipant(event) {
        if (event) {
            let tempSelectedEngagements = [...this.selectedEngagements];

            let index = tempSelectedEngagements.findIndex(
                element => element.Id === event.detail.row.Id
            );

            tempSelectedEngagements.splice(index, 1);

            this.selectedEngagements = tempSelectedEngagements;

            this.availableEngagementRows = [
                ...this.availableEngagementRows,
                event.detail.row,
            ];
            this.sortData(this.availableEngagementRows);

            //filter previouslySelectedEngagements to remove program engagement that we deselected so it does not add the deselected value back
            //after we create a new program engagement
            if (this.previouslySelectedEngagements !== undefined) {
                this.previouslySelectedEngagements = this.previouslySelectedEngagements.filter(
                    element => element.Id !== event.detail.row.Id
                );
            }

            // if filters exist apply the filters
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

        this.filteredEngagements = this.availableEngagementRows.filter(
            row =>
                JSON.stringify(row)
                    .toLowerCase()
                    .includes(searchText) &&
                (this.cohortId
                    ? row[this.fields.programCohort.apiName] === this.cohortId
                    : true)
        );

        let selectedEngagementIds = [];
        this.selectedEngagements.forEach(eng => {
            selectedEngagementIds.push(eng.Id);
        });

        // Remove already selected rows
        this.filteredEngagements = this.filteredEngagements.filter(row => {
            return !selectedEngagementIds.includes(row.Id);
        });

        this.availableEngagementsForSelection = this.filteredEngagements.slice(
            0,
            Math.min(this.filteredEngagements.length, this.offset)
        );
    }

    dispatchSelectEvent() {
        this.dispatchEvent(
            new CustomEvent("select", {
                detail: {
                    totalSelected: this.selectedEngagements.length,
                },
            })
        );
    }
}
