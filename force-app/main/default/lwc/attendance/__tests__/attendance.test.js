/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { createElement } from "lwc";
import Attendance from "c/attendance";
import { getRecord } from "lightning/uiRecordApi";
import generateRoster from "@salesforce/apex/AttendanceController.generateRoster";
import getFieldSet from "@salesforce/apex/FieldSetController.getFieldSetForLWC";
import checkFieldPermissions from "@salesforce/apex/AttendanceController.checkFieldPermissions";
import {
    registerApexTestWireAdapter,
    registerLdsTestWireAdapter,
} from "@salesforce/sfdx-lwc-jest";

const mockGenerateRoster = require("./data/generateRoster.json");
const mockGenerateRosterEmpty = require("../../__tests__/data/emptyList.json");
const mockGetFieldSet = require("./data/getFieldSet.json");
const mockWiredSession = require("./data/wiredSession.json");
const mockWiredPermissions = require("./data/wiredPermissions.json");

//Register the  wire adapters
const generateRosterAdapter = registerApexTestWireAdapter(generateRoster);
const fieldSetAdapter = registerApexTestWireAdapter(getFieldSet);
const wiredSessionAdapter = registerLdsTestWireAdapter(getRecord);
const wiredPermissionsAdapter = registerApexTestWireAdapter(checkFieldPermissions);

jest.mock("c/attendanceRow");

describe("c-attendance", () => {
    let element;

    afterEach(global.clearDOM);

    beforeEach(() => {
        element = createElement("c-attendance", {
            is: Attendance,
        });
        element.recordId = "a06630000074mVnAAI";
    });

    it("shows multiple returned rows", async () => {
        document.body.appendChild(element);
        wiredSessionAdapter.emit(mockWiredSession);
        fieldSetAdapter.emit(mockGetFieldSet);
        generateRosterAdapter.emit(mockGenerateRoster);
        wiredPermissionsAdapter.emit(mockWiredPermissions);

        return global.flushPromises().then(async () => {
            const attendanceRows = element.shadowRoot.querySelectorAll(
                "c-attendance-row"
            );
            expect(attendanceRows).toHaveLength(mockGenerateRoster.length);
            await expect(element).toBeAccessible();
        });
    });
    it("shows zero returned rows", async () => {
        document.body.appendChild(element);
        wiredSessionAdapter.emit(mockWiredSession);
        fieldSetAdapter.emit(mockGetFieldSet);
        generateRosterAdapter.emit(mockGenerateRosterEmpty);
        wiredPermissionsAdapter.emit(mockWiredPermissions);

        return global.flushPromises().then(async () => {
            const attendanceRows = element.shadowRoot.querySelectorAll(
                "c-attendance-row"
            );
            expect(attendanceRows).toHaveLength(mockGenerateRosterEmpty.length);
            await expect(element).toBeAccessible();
        });
    });
});
