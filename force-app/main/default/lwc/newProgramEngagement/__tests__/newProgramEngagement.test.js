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
import getFieldSet from "@salesforce/apex/FieldSetController.getFieldSetForLWC";
import { CurrentPageReference } from "lightning/navigation";
import cancel from "@salesforce/label/c.Cancel";
import newProgramEngagement from "@salesforce/label/c.New_Program_Engagement";
import { ShowToastEventName } from "lightning/platformShowToastEvent";
import {
    registerApexTestWireAdapter,
    registerTestWireAdapter,
} from "@salesforce/sfdx-lwc-jest";

const mockGetFieldSet = require("./data/getFieldSet.json");
const mockCurrentPageReference = require("./data/CurrentPageReference.json");

//Register the  wire adapters
const getFieldSetAdapter = registerApexTestWireAdapter(getFieldSet);
const currentPageReferenceAdapter = registerTestWireAdapter(CurrentPageReference);

describe("c-new-program-engagement", () => {
    let element;

    afterEach(global.clearDOM);

    beforeEach(() => {
        element = createElement("c-new-program-engagement", {
            is: NewProgramEngagement,
        });

        // Emit data from @wire
        currentPageReferenceAdapter.emit(mockCurrentPageReference);
        getFieldSetAdapter.emit(mockGetFieldSet);
    });

    it("displays the modal with input fields", () => {
        document.body.appendChild(element);

        element.showModal();

        return global.flushPromises().then(async () => {
            const inputFields = element.shadowRoot.querySelectorAll(
                "lightning-input-field"
            );
            let index = 0;
            mockGetFieldSet.forEach(field => {
                expect(inputFields[index].fieldName).toBe(field.apiName);
                index++;
            });

            await expect(element).toBeAccessible();
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

        const recordEditForm = element.shadowRoot.querySelector(
            "lightning-record-edit-form"
        );

        recordEditForm.dispatchEvent(new CustomEvent("success", { detail: recordId }));

        return global.flushPromises().then(async () => {
            expect(handler).toHaveBeenCalled();
            await expect(element).toBeAccessible();
        });
    });

    it("closes the modal when the close button is clicked", () => {
        document.body.appendChild(element);
        element.showModal();

        let buttonContainer = element.shadowRoot.querySelector("lightning-button");
        expect(buttonContainer.label).not.toBe(null);
        expect(buttonContainer.label).toBe(cancel);

        const handler = jest.fn();
        element.addEventListener("cancel", handler);
        buttonContainer.click();

        return global.flushPromises().then(async () => {
            expect(handler).toHaveBeenCalled();
            await expect(element).toBeAccessible();
        });
    });

    it("is accessible", async () => {
        document.body.appendChild(element);
        // assert that DOM is accessible (using extended preset-rule)
        await expect(element).toBeAccessible();
    });
});
