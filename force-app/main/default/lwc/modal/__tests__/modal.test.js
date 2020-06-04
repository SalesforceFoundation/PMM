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

const CSS_CLASS = "modal-hidden";

describe("c-modal", () => {
    let element;

    afterEach(() => {
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
    });

    beforeEach(() => {
        element = createElement("c-modal", {
            is: Modal,
        });
    });

    it("does not display the modal dialog by default based on the css class", () => {
        document.body.appendChild(element);

        return Promise.resolve().then(() => {
            const modalContainer = element.shadowRoot.querySelector("div");
            //verify that the css class on the outer div is modal-hidden by default
            expect(modalContainer.classList.value).toBe(CSS_CLASS);
        });
    });

    it("displays header and does not display the slot when header property is not blank", () => {
        const HEADER_STRING = "Modal Header";
        element.header = HEADER_STRING;
        document.body.appendChild(element);

        return Promise.resolve().then(() => {
            //verify that the header is displayed
            const headerContainer = element.shadowRoot.querySelector(".header-string");
            expect(headerContainer).not.toBeNull();
            expect(headerContainer.textContent).toBe(HEADER_STRING);

            //verify that the header slot is not displayed because the header is present
            const slotContainer = element.shadowRoot.querySelector(".header-slot");
            expect(slotContainer).toBeNull();
        });
    });

    it("does not display header and displays the slot when header property is blank", () => {
        document.body.appendChild(element);

        return Promise.resolve().then(() => {
            //verify that the header is not displayed
            const headerContainer = element.shadowRoot.querySelector(".header-string");
            expect(headerContainer).toBeNull();

            //verify that the header slot is displayed because the header is not present
            const slotContainer = element.shadowRoot.querySelector(".header-slot");
            expect(slotContainer).not.toBeNull();
        });
    });

    it("closes the modal when the close button is clicked", () => {
        document.body.appendChild(element);

        let buttonContainer = element.shadowRoot.querySelector("lightning-button-icon");
        expect(buttonContainer.title).not.toBe(null);
        expect(buttonContainer.title).toBe(closeLabel);

        const handler = jest.fn();
        element.addEventListener("dialogclose", handler);
        buttonContainer.click();

        return Promise.resolve().then(() => {
            expect(handler).toHaveBeenCalled();
        });
    });

    it("changes the css class when the modal is shown or hidden", () => {
        document.body.appendChild(element);
        return Promise.resolve().then(() => {
            const modalContainer = element.shadowRoot.querySelector("div");
            element.show();

            //verify that there is no CSS class present
            expect(modalContainer.classList.value).toBe("");

            element.hide();
            //verify that the CSS class exists
            expect(modalContainer.classList.value).toBe(CSS_CLASS);
        });
    });
});
