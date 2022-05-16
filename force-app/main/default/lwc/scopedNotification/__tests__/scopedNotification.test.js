/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { createElement } from "lwc";
import ScopedNotification from "c/scopedNotification";

const TITLE = "Test Title";

describe("c-scoped-notification", () => {
    let element;

    afterEach(global.clearDOM);

    beforeEach(() => {
        element = createElement("c-scoped-notification", {
            is: ScopedNotification,
        });
    });

    it("displays the info theme by default", () => {
        document.body.appendChild(element);

        return global.flushPromises().then(() => {
            const icon = element.shadowRoot.querySelector("lightning-icon");
            const themeDiv = element.shadowRoot.querySelector(".slds-theme_info");
            const titlePara = element.shadowRoot.querySelector("p");

            expect(themeDiv).toBeDefined();
            expect(icon.iconName).toBe("utility:info");
            expect(titlePara.textContent).toEqual("");
            return global.isAccessible(element);
        });
    });

    it("displays the light info theme", () => {
        element.title = TITLE;
        element.theme = "light";
        document.body.appendChild(element);

        return global.flushPromises().then(() => {
            const icon = element.shadowRoot.querySelector("lightning-icon");
            const themeDiv = element.shadowRoot.querySelector(
                "slds-scoped-notification_light"
            );
            const titlePara = element.shadowRoot.querySelector("p");

            expect(themeDiv).toBeDefined();
            expect(icon.iconName).toBe("utility:info");
            expect(titlePara.textContent).toEqual(TITLE);
            return global.isAccessible(element);
        });
    });

    it("displays the success theme", () => {
        element.title = TITLE;
        element.theme = "success";
        document.body.appendChild(element);

        return global.flushPromises().then(() => {
            const icon = element.shadowRoot.querySelector("lightning-icon");
            const themeDiv = element.shadowRoot.querySelector(".slds-theme_success");
            const titlePara = element.shadowRoot.querySelector("p");

            expect(themeDiv).toBeDefined();
            expect(icon.iconName).toBe("utility:success");
            expect(titlePara.textContent).toEqual(TITLE);
            return global.isAccessible(element);
        });
    });

    it("displays the error theme", () => {
        element.title = TITLE;
        element.theme = "error";
        document.body.appendChild(element);

        return global.flushPromises().then(() => {
            const icon = element.shadowRoot.querySelector("lightning-icon");
            const themeDiv = element.shadowRoot.querySelector(".slds-theme_error");
            const titlePara = element.shadowRoot.querySelector("p");

            expect(themeDiv).toBeDefined();
            expect(icon.iconName).toBe("utility:error");
            expect(titlePara.textContent).toEqual(TITLE);
            return global.isAccessible(element);
        });
    });
});
