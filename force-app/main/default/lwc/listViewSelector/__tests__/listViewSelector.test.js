/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { createElement } from "lwc";
import ListViewSelector from "c/listViewSelector";
import { getListUi } from "lightning/uiListApi";
import { registerLdsTestWireAdapter } from "@salesforce/sfdx-lwc-jest";

const objectApiName = "ServiceSession__c";
const mockGetListViews = require("./data/getListViews.json");
const getListUiAdapter = registerLdsTestWireAdapter(getListUi);

describe("c-listViewSelector", () => {
    let element;

    afterEach(global.clearDOM);

    beforeEach(() => {
        element = createElement("c-list-view-selector", {
            is: ListViewSelector,
        });
        element.objectApiName = objectApiName;
        getListUiAdapter.emit(mockGetListViews);
    });

    it("renders first list view returned as checked", async () => {
        document.body.appendChild(element);

        return global.flushPromises().then(async () => {
            const lightningMenuItem = element.shadowRoot.querySelector(
                "lightning-menu-item"
            );
            expect(lightningMenuItem.label).toBe("All");
            expect(lightningMenuItem.checked).toBeTruthy();
            global.isAccessible(element);
        });
    });
});
