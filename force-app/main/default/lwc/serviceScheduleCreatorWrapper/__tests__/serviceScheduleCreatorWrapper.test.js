/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { createElement } from "lwc";
import ServiceScheduleCreatorWrapper from "c/serviceScheduleCreatorWrapper";

describe("c-service-schedule-creator", () => {
    let element;

    afterEach(global.clearDOM);

    beforeEach(() => {
        element = createElement("c-service-schedule-creator-wrapper", {
            is: ServiceScheduleCreatorWrapper,
        });
    });

    it("modal appears in non-experience-cloud context and element is accessible", () => {
        element.isCommunity = false;
        document.body.appendChild(element);

        return global.flushPromises().then(async () => {
            const modal = element.shadowRoot.querySelector("c-modal");

            // Modal will only display with a spinner loaded
            expect(modal).not.toBeNull();
            modal.dispatchEvent(new CustomEvent("dialogclose"));

            // TODO: Validate accessibility when each step is loads.
            await expect(element).toBeAccessible();
        });
    });

    it("modal does not appear in experience-cloud context and element is accessible", () => {
        element.isCommunity = true;
        document.body.appendChild(element);
        return global.flushPromises().then(async () => {
            const modal = element.shadowRoot.querySelector("c-modal");
            expect(modal).toBeNull();

            const creator = element.shadowRoot.querySelector(
                "c-service-schedule-creator"
            );
            expect(creator).not.toBeNull();

            const h2Container = creator.shadowRoot.querySelector("h2");
            let slot = document.createElement("span");
            slot.textContent = "Test Accessibility";
            h2Container.attachShadow({ mode: "open" }).appendChild(slot.cloneNode(true));
            // assert that DOM is accessible (using extended preset-rule)
            await expect(element).toBeAccessible();
        });
    });
});
