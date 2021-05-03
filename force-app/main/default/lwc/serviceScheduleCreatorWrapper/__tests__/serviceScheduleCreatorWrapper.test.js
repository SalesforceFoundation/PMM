/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
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

            // TODO: Validate accessibility when each step is loads.
            await expect(element).toBeAccessible();
        });
    });

    it("modal does not appear in experience-cloud context and element is accessible", () => {
        let label = "fake label";
        element.isCommunity = true;
        document.body.appendChild(element);

        return global
            .flushPromises()
            .then(() => {
                const modal = element.shadowRoot.querySelector("c-modal");

                expect(modal).toBeNull();
                const creator = element.shadowRoot.querySelector(
                    "c-service-schedule-creator"
                );
                creator.labels = {};
                creator.labels.newServiceSchedule = label;
            })
            .then(async () => {
                const h2 = element.shadowRoot.querySelectorAll("h2");
                expect(h2.length).toBe(1);
                // expect(h2[0].textContent).toBe(label);
                await expect(element).toBeAccessible();
            });
    });
});
