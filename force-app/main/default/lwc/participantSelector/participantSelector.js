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
        if (!(result.data || result.error)) {
            return;
        }

        if (result.data) {
            this.loadTable(result.data);
            this.loadTableRows(result.data);
            this.loadPreviousSelections();
            this.dispatchLoaded();
        } else if (result.error) {
            this.allEngagements = undefined;
            this.cohorts = undefined;
        }
    }

    loadTable(data) {
        // Static data that should not change when new program engagements are added
        if (this.isLoaded) {
            return;
        }

        this.fields = data.fields;
        this.fieldByFieldPath = data.fieldByFieldPath;
        this.objectLabels = data.objectLabels;
        this.programName = data.program ? data.program.Name : "";
        this.programId = data.program ? data.program.Id : "";
        this.formatLabels();
        this.setDataTableColumns();
        this.setSelectedColumns();
        this.loadProgramCohorts(data);
    }

    formatLabels() {
        this.labels.addServiceParticipants = format(addRecord, [
            this.objectLabels.serviceParticipant.objectPluralLabel,
        ]);
        this.labels.filterByCohort = format(filterByRecord, [
            this.objectLabels.programCohort.objectLabel,
        ]);
    }

    loadTableRows(data) {
        let selectedIds = this.selectedEngagements.map(engagement => engagement.Id);
        this.allEngagements = data.programEngagements.slice(0);

        this.availableEngagementRows = this.allEngagements
            .filter(engagement => !selectedIds.includes(engagement.Id))
            .map(engagement => {
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
    }

    dispatchLoaded() {
        if (this.isLoaded) {
            return;
        }

        this.isLoaded = true;
        this.dispatchEvent(new CustomEvent("loaded", { detail: this.isLoaded }));
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
            // Filters are applied when handleSelectParticipants is called
            this.applyFilters();
            return;
        }

        this.previouslySelectedEngagements = [...this.previouslySelectedEngagements];
        this.availableEngagementRows.forEach(row => {
            if (
                this.existingContactIds.includes(
                    row[PROGRAM_ENGAGEMENT_CONTACT_FIELD.fieldApiName]
                )
            ) {
                row.disableDeselect = true;
                this.previouslySelectedEngagements.push(row);
            }
        });
        this.handleSelectParticipants();
    }

    loadProgramCohorts(data) {
        this.cohorts = data.programCohorts.slice(0);
        this.searchOptions = this.cohorts.map(element => {
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
        let row = this.availableEngagementRows.find(
            element => element.Id === programEngagementId
        );

        if (row) {
            this.handleSelect([row]);
        }
    }

    handleSelect(programEngagements) {
        programEngagements.forEach(row => {
            let index = this.availableEngagementRows.findIndex(
                element => element.Id === row.Id
            );
            if (index >= 0) {
                this.availableEngagementRows.splice(index, 1);
            }
            let selectedRow = this.selectedEngagements.find(
                engagement => engagement.Id === row.Id
            );
            if (!selectedRow) {
                this.selectedEngagements.push(row);
            }
        });

        // force the screen to rerender the selected engagements
        this.selectedEngagements = [...this.selectedEngagements];
        this.applyFilters();
        this.sortData(this.selectedEngagements);
        this.dispatchSelectEvent();
    }

    handleDeselectParticipant(event) {
        if (event) {
            //filter availableEngagementRows to remove program engagement that we deselected so there are no duplicates
            this.availableEngagementRows = this.availableEngagementRows.filter(
                row => row.Id !== event.detail.row.Id
            );

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
