/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { createElement } from "lwc";
import Modal from "c/modal";
import closeLabel from "@salesforce/label/c.Close";

const MODAL_HIDDEN = "modal-hidden";

describe("c-modal", () => {
    let element;

    afterEach(global.clearDOM);

    beforeEach(() => {
        element = createElement("c-modal", {
            is: Modal,
        });

        document.body.appendChild(element);
    });

    it("does not display the modal dialog by default based on the css class", () => {
        return global.flushPromises().then(() => {
            const modalContainer = element.shadowRoot.querySelector("div");
            //verify that the css class on the outer div is modal-hidden by default
            expect(modalContainer.classList.value).toBe(MODAL_HIDDEN);
        });
    });

    it("displays header and does not display the slot when header property is not blank", () => {
        const HEADER_STRING = "Modal Header";
        element.header = HEADER_STRING;

        return global.flushPromises().then(async () => {
            //verify that the header is displayed
            const headerContainer = element.shadowRoot.querySelector(".header-string");
            expect(headerContainer).not.toBeNull();
            expect(headerContainer.textContent).toBe(HEADER_STRING);

            //verify that the header slot is not displayed because the header is present
            const slotContainer = element.shadowRoot.querySelector(".header-slot");
            expect(slotContainer).toBeNull();
            await expect(element).toBeAccessible();
        });
    });

    it("does not display header and displays the slot when header property is blank", () => {
        //Since in this scenario we are testing that the header has to be empty accessiblity tests
        //will fail so for now not adding accessibility test until we fix the issue on the modal component
        return global.flushPromises().then(() => {
            //verify that the header is not displayed
            const headerContainer = element.shadowRoot.querySelector(".header-string");
            expect(headerContainer).toBeNull();

            //verify that the header slot is displayed because the header is not present
            const slotContainer = element.shadowRoot.querySelector(".header-slot");
            expect(slotContainer).not.toBeNull();
        });
    });

    it("closes the modal when the close button is clicked", () => {
        //Added the below header to make sure accessibility tests pass
        const HEADER_STRING = "Modal Header";
        element.header = HEADER_STRING;

        let buttonContainer = element.shadowRoot.querySelector("lightning-button-icon");
        expect(buttonContainer.title).not.toBe(null);
        expect(buttonContainer.title).toBe(closeLabel);

        const handler = jest.fn();
        element.addEventListener("dialogclose", handler);
        buttonContainer.click();

        return global.flushPromises().then(async () => {
            const headerContainer = element.shadowRoot.querySelector(".header-string");
            expect(headerContainer.textContent).toBe(HEADER_STRING);
            expect(handler).toHaveBeenCalled();
            await expect(element).toBeAccessible();
        });
    });

    it("changes the css class when the modal is shown or hidden", () => {
        //Added the below header to make sure accessibility tests pass
        const HEADER_STRING = "Modal Header";
        element.header = HEADER_STRING;

        return global.flushPromises().then(async () => {
            const headerContainer = element.shadowRoot.querySelector(".header-string");
            expect(headerContainer.textContent).toBe(HEADER_STRING);

            const modalContainer = element.shadowRoot.querySelector("div");
            element.show();
            //verify that there is no CSS class present
            expect(modalContainer.classList.value).toBe("");
            await expect(element).toBeAccessible();

            element.hide();
            //verify that the CSS class exists
            expect(modalContainer.classList.value).toBe(MODAL_HIDDEN);
        });
    });

    // This jest test below validates that the component is accessible
    it("is accessible", async () => {
        const h2Container = element.shadowRoot.querySelector("h2");
        let slot = document.createElement("span");
        slot.textContent = "Test Accessibility";
        h2Container.attachShadow({ mode: "open" }).appendChild(slot.cloneNode(true));
        // assert that DOM is accessible (using extended preset-rule)
        await expect(element).toBeAccessible();
    });
});
