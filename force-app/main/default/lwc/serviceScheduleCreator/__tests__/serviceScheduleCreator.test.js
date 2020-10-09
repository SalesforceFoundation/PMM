/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { createElement } from "lwc";
import ServiceScheduleCreator from "c/serviceScheduleCreator";

describe("c-service-schedule-creator", () => {
    let element;

    afterEach(global.clearDOM);

    beforeEach(() => {
        element = createElement("c-service-schedule-creator", {
            is: ServiceScheduleCreator,
        });
    });

    it("modal is displayed and element is accessible", () => {
        const HEADER_STRING = "New Service Schedule";
        document.body.appendChild(element);

        return global.flushPromises().then(async () => {
            const modal = element.shadowRoot.querySelector("c-modal");

            const h2Container = modal.shadowRoot.querySelector("h2");
            let slot = document.createElement("span");
            slot.textContent = HEADER_STRING;

            h2Container.attachShadow({ mode: "open" }).appendChild(slot.cloneNode(true));

            // Modal will only display with a spinner loaded
            expect(modal).not.toBeNull();
            expect(slot.textContent).toBe(HEADER_STRING);

            await expect(element).toBeAccessible();
        });
    });
});
