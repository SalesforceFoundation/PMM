/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { createElement } from "lwc";
import AccordionSection from "c/accordionSection";

describe("c-accordionSection", () => {
    let element;

    afterEach(global.clearDOM);

    beforeEach(() => {
        element = createElement("c-accordionSection", {
            is: AccordionSection,
        });
    });

    it("is closed by default", () => {
        document.body.appendChild(element);

        return global.flushPromises().then(() => {
            const button = element.shadowRoot.querySelector("button");
            expect(button.ariaExpanded).toBe("false");
            global.isAccessible(element);
        });
    });

    it("is open when open current section is true", () => {
        element.openCurrentSection = true;
        document.body.appendChild(element);

        return global.flushPromises().then(() => {
            const button = element.shadowRoot.querySelector("button");
            expect(button.ariaExpanded).toBe("true");
            global.isAccessible(element);
        });
    });

    it("is accessible with background shaded", () => {
        element.shadeOnOpen = "#EFEFEF";
        element.openCurrentSection = true;
        document.body.appendChild(element);

        return global.flushPromises().then(() => {
            // TODO: see if we can verify background color
            global.isAccessible(element);
        });
    });

    it("opens", () => {
        document.body.appendChild(element);
        element.open();

        return global.flushPromises().then(() => {
            const button = element.shadowRoot.querySelector("button");
            expect(button.ariaExpanded).toBe("true");
            global.isAccessible(element);
        });
    });

    it("closes", () => {
        element.openCurrentSection = true;
        document.body.appendChild(element);
        element.close();

        return global.flushPromises().then(() => {
            const button = element.shadowRoot.querySelector("button");
            expect(button.ariaExpanded).toBe("false");
            global.isAccessible(element);
        });
    });

    it("does not open when prevent toggle is set", () => {
        element.preventToggle = true;
        document.body.appendChild(element);
        element.open();

        return global.flushPromises().then(() => {
            const button = element.shadowRoot.querySelector("button");
            expect(button.ariaExpanded).toBe("false");
            global.isAccessible(element);
        });
    });

    it("override open overrides prevent toggle and opens", () => {
        element.preventToggle = true;
        document.body.appendChild(element);
        element.overrideOpen();

        return global.flushPromises().then(() => {
            const button = element.shadowRoot.querySelector("button");
            expect(button.ariaExpanded).toBe("true");
            global.isAccessible(element);
        });
    });

    it("opens on button click", () => {
        document.body.appendChild(element);
        const button = element.shadowRoot.querySelector("button");
        button.click();

        return global.flushPromises().then(() => {
            expect(button.ariaExpanded).toBe("true");
            global.isAccessible(element);
        });
    });
});
