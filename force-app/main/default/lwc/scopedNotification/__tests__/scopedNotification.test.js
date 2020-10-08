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

    it("displays the info theme by default", async () => {
        document.body.appendChild(element);
        const icon = element.shadowRoot.querySelector("lightning-icon");
        const themeDiv = element.shadowRoot.querySelector(".slds-theme_info");
        const titlePara = element.shadowRoot.querySelector("p");

        expect(themeDiv).toBeDefined();
        expect(icon.iconName).toBe("utility:info");
        expect(titlePara.textContent).toEqual("");
        await expect(element).toBeAccessible();
    });

    it("displays the light info theme", async () => {
        element.title = TITLE;
        element.theme = "light";
        document.body.appendChild(element);
        const icon = element.shadowRoot.querySelector("lightning-icon");
        const themeDiv = element.shadowRoot.querySelector(
            "slds-scoped-notification_light"
        );
        const titlePara = element.shadowRoot.querySelector("p");

        expect(themeDiv).toBeDefined();
        expect(icon.iconName).toBe("utility:info");
        expect(titlePara.textContent).toEqual(TITLE);
        await expect(element).toBeAccessible();
    });

    it("displays the theme provided", () => {
        const themes = ["warning", "info", "success", "error"];
        element.title = TITLE;

        themes.forEach(async theme => {
            element.theme = theme;
            document.body.appendChild(element);
            const icon = element.shadowRoot.querySelector("lightning-icon");
            const themeDiv = element.shadowRoot.querySelector(`.slds-theme_${theme}`);
            const titlePara = element.shadowRoot.querySelector("p");

            expect(themeDiv).toBeDefined();
            expect(icon.iconName).toBe(`utility:${theme}`);
            expect(titlePara.textContent).toEqual(TITLE);
            await expect(element).toBeAccessible();
        });
    });
});
