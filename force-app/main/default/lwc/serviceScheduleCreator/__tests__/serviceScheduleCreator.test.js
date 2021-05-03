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

    it("element is accessible", () => {
        document.body.appendChild(element);

        return global.flushPromises().then(async () => {
            const spinner = element.shadowRoot.querySelector("lightning-spinner");

            expect(spinner).not.toBeNull();

            // TODO: Validate accessibility when each step is loads.
            await expect(element).toBeAccessible();
        });
    });
});
