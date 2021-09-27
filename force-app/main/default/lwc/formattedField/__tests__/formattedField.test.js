/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { createElement } from "lwc";
import FormattedField from "c/formattedField";

let mockField;

let mockRecord;

describe("c-formattedField", () => {
    let element;

    afterEach(global.clearDOM);

    beforeEach(() => {
        element = createElement("c-formatted-field", {
            is: FormattedField,
        });

        mockField = {
            apiName: "Name",
            label: "Label",
            type: "STRING",
            path: "Name",
        };

        mockRecord = {
            Name: "Test Formatted Field",
        };
    });

    it("displays a lightning formatted text field when a value is present", () => {
        element.field = mockField;
        element.record = mockRecord;
        document.body.appendChild(element);

        return global.flushPromises().then(() => {
            const lightningFormattedText = element.shadowRoot.querySelector(
                "lightning-formatted-text"
            );
            expect(lightningFormattedText.value).toBe(mockRecord.Name);
            return global.isAccessible(element);
        });
    });
    it("displays a lightning formatted text field when a related value is present", () => {
        mockField.path = "Account.Name";
        mockRecord.Account = { Name: "Hola" };
        element.field = mockField;
        element.record = mockRecord;
        document.body.appendChild(element);

        return global.flushPromises().then(() => {
            const lightningFormattedText = element.shadowRoot.querySelector(
                "lightning-formatted-text"
            );
            expect(lightningFormattedText.value).toBe(mockRecord.Account.Name);
            return global.isAccessible(element);
        });
    });
    it("displays a lightning formatted text field when a related value is not present", () => {
        mockField.path = "Account.Name";
        element.field = mockField;
        element.record = mockRecord;
        document.body.appendChild(element);

        return global.flushPromises().then(() => {
            const lightningFormattedText = element.shadowRoot.querySelector(
                "lightning-formatted-text"
            );
            expect(lightningFormattedText.value).toBeUndefined();
            return global.isAccessible(element);
        });
    });
    it("displays a lightning formatted text field when a value is missing", () => {
        mockField.apiName = "Title";

        element.field = mockField;
        element.record = mockRecord;
        document.body.appendChild(element);

        return global.flushPromises().then(() => {
            const lightningFormattedText = element.shadowRoot.querySelector(
                "lightning-formatted-text"
            );
            expect(lightningFormattedText.value).toBeUndefined();
            return global.isAccessible(element);
        });
    });

    it("displays a lightning formatted text field when the record is missing", () => {
        element.field = mockField;
        document.body.appendChild(element);

        return global.flushPromises().then(() => {
            const lightningFormattedText = element.shadowRoot.querySelector(
                "lightning-formatted-text"
            );
            expect(lightningFormattedText.value).toBeUndefined();
            return global.isAccessible(element);
        });
    });

    it("displays a lightning formatted date time field when type is date", () => {
        let today = new Date();
        mockField.type = "DATE";
        mockField.apiName = "Today";
        mockRecord.Today = today;

        element.field = mockField;
        element.record = mockRecord;
        document.body.appendChild(element);

        return global.flushPromises().then(() => {
            const lightningFormattedDateTime = element.shadowRoot.querySelector(
                "lightning-formatted-date-time"
            );
            expect(lightningFormattedDateTime.value).toBe(today);
            return global.isAccessible(element);
        });
    });

    it("displays a lightning formatted date time field when type is date-time", () => {
        let today = new Date();
        mockField.type = "DATETIME";
        mockField.apiName = "Today";
        mockRecord.Today = today;

        element.field = mockField;
        element.record = mockRecord;
        document.body.appendChild(element);

        return global.flushPromises().then(() => {
            const lightningFormattedDateTime = element.shadowRoot.querySelector(
                "lightning-formatted-date-time"
            );
            expect(lightningFormattedDateTime.value).toBe(today);
            return global.isAccessible(element);
        });
    });

    it("displays a lightning formatted time field when type is time", () => {
        let time = 1800000;
        mockField.type = "TIME";
        mockField.apiName = "Time";
        mockRecord.Time = time;

        element.field = mockField;
        element.record = mockRecord;
        document.body.appendChild(element);

        return global.flushPromises().then(() => {
            const lightningFormattedTime = element.shadowRoot.querySelector(
                "lightning-formatted-time"
            );
            // Javascript will convert the number into time format, relying on TimeZones
            // validating the semi colons vs the actual time.
            expect(lightningFormattedTime.value.includes(":")).toBeTruthy();
            return global.isAccessible(element);
        });
    });
});
