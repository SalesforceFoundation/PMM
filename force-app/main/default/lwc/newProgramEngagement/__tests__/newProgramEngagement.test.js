/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { createElement } from "lwc";
import NewProgramEngagement from "c/newProgramEngagement";
import { CurrentPageReference } from "lightning/navigation";
import { getObjectInfo, getPicklistValues } from "lightning/uiObjectInfoApi";
import cancel from "@salesforce/label/c.Cancel";
import newProgramEngagement from "@salesforce/label/c.New_Program_Engagement";
import { ShowToastEventName } from "lightning/platformShowToastEvent";
import {
    registerApexTestWireAdapter,
    registerTestWireAdapter,
    registerLdsTestWireAdapter,
} from "@salesforce/sfdx-lwc-jest";
import getFieldSetByObjectKey from "@salesforce/apex/pmdm.ProgramController.getFieldSetByObjectKey";
import getProgramCohortsFromProgramId from "@salesforce/apex/pmdm.ProgramController.getProgramCohortsFromProgramId";
import COHORT_FIELD from "@salesforce/schema/ProgramEngagement__c.ProgramCohort__c";

const mockGetObjectInfo = require("./data/getObjectInfo.json");
const mockPicklistValues = require("./data/getPicklistValues.json");
const mockGetNewEngagementSetup = require("./data/getFieldSetByObjectKey.json");
const mockGetProgramCohortsFromProgramId = require("./data/getProgramCohortsFromProgramId.json");
const mockCurrentPageReference = require("./data/currentPageReference.json");

//Register the  wire adapters
const currentPageReferenceAdapter = registerTestWireAdapter(CurrentPageReference);
const getFieldSetByObjectKeyAdapter = registerApexTestWireAdapter(getFieldSetByObjectKey);
const getProgramCohortsFromProgramIdAdapter = registerApexTestWireAdapter(
    getProgramCohortsFromProgramId
);
const getObjectInfoAdapter = registerLdsTestWireAdapter(getObjectInfo);
const getPicklistValuesAdapter = registerLdsTestWireAdapter(getPicklistValues);

describe("c-new-program-engagement with a known contact", () => {
    let element;

    afterEach(global.clearDOM);

    beforeEach(() => {
        element = createElement("c-new-program-engagement", {
            is: NewProgramEngagement,
        });

        element.contactId = "0031F00000l7mI9QAI";

        // Emit data from @wire
        currentPageReferenceAdapter.emit(mockCurrentPageReference);
        getFieldSetByObjectKeyAdapter.emit(mockGetNewEngagementSetup);
        getProgramCohortsFromProgramIdAdapter.emit(mockGetProgramCohortsFromProgramId);
        getObjectInfoAdapter.emit(mockGetObjectInfo);
        getPicklistValuesAdapter.emit(mockPicklistValues);
    });

    it("displays the modal with input fields", () => {
        document.body.appendChild(element);

        element.showModal();

        return global.flushPromises().then(async () => {
            const inputFields = element.shadowRoot.querySelectorAll(
                "lightning-input-field"
            );
            let index = 0;
            let fields = mockGetNewEngagementSetup.engagementFieldSet.filter(
                field => field.apiName !== COHORT_FIELD.fieldApiName
            );
            fields.forEach(field => {
                if (inputFields[index] && inputFields[index].fieldName) {
                    expect(inputFields[index].fieldName).toBe(field.apiName);
                }
                index++;
            });

            global.isAccessible(element);
        });
    });

    it("saves the record and closes the modal", () => {
        const recordId = "a011700000AvQRWAA3";
        const handler = jest.fn();

        document.body.appendChild(element);
        element.showModal();

        element.addEventListener("save", handler);
        element.addEventListener(ShowToastEventName, handler);

        let modalContainer = element.shadowRoot.querySelector("c-modal");
        expect(modalContainer.header).toBe(newProgramEngagement);

        return global
            .flushPromises()
            .then(() => {
                const recordEditForm = element.shadowRoot.querySelector(
                    "lightning-record-edit-form"
                );
                recordEditForm.dispatchEvent(
                    new CustomEvent("success", { detail: recordId })
                );
            })
            .then(async () => {
                expect(handler).toHaveBeenCalled();
                global.isAccessible(element);
            });
    });

    it("closes the modal when the close button is clicked", () => {
        document.body.appendChild(element);
        element.newContactMode = false;
        element.showModal();

        const handler = jest.fn();
        element.addEventListener("cancel", handler);

        return global
            .flushPromises()
            .then(() => {
                let cancelButton = element.shadowRoot.querySelectorAll(
                    "lightning-button"
                )[2];
                expect(cancelButton.label).not.toBe(null);
                expect(cancelButton.label).toBe(cancel);
                cancelButton.click();
            })
            .then(async () => {
                expect(handler).toHaveBeenCalled();
                global.isAccessible(element);
            });
    });

    it("is accessible", async () => {
        document.body.appendChild(element);
        // assert that DOM is accessible (using extended preset-rule)
        global.isAccessible(element);
    });
});
