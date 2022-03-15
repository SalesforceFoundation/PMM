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
import { getObjectInfo } from "lightning/uiObjectInfoApi";
import { CurrentPageReference } from "lightning/navigation";
import generateRoster from "@salesforce/apex/AttendanceController.generateRoster";
import checkFieldPermissions from "@salesforce/apex/AttendanceController.checkFieldPermissions";
import getServiceSessionStatusBuckets from "@salesforce/apex/AttendanceController.getServiceSessionStatusBuckets";

import {
    registerApexTestWireAdapter,
    registerLdsTestWireAdapter,
} from "@salesforce/sfdx-lwc-jest";

const mockGenerateRoster = require("./data/generateRoster.json");
const mockGenerateRosterEmpty = require("./data/emptyRoster.json");
const mockWiredSession = require("./data/wiredPendingSession.json");
const mockWiredPermissions = require("./data/wiredPermissions.json");
const mockWiredNoPermissions = require("./data/wiredNoPermissions.json");
const mockwiredGetSessionStatuses = require("./data/wiredGetSessionStatuses.json");
const mockWiredContactObjectInfo = require("./data/wiredContactObjectInfo.json");
const mockCurrentPageReference = require("./data/currentPageReference.json");

//Register the  wire adapters
const generateRosterAdapter = registerApexTestWireAdapter(generateRoster);
const wiredSessionAdapter = registerLdsTestWireAdapter(getRecord);
const wiredContactObjectInfoAdapter = registerLdsTestWireAdapter(getObjectInfo);
const wiredPermissionsAdapter = registerApexTestWireAdapter(checkFieldPermissions);
const wiredGetSessionStatusesAdapter = registerApexTestWireAdapter(
    getServiceSessionStatusBuckets
);
const wiredCurrentPageReference = registerApexTestWireAdapter(CurrentPageReference);

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

    it("shows multiple returned rows with perms", async () => {
        document.body.appendChild(element);
        wiredContactObjectInfoAdapter.emit(mockWiredContactObjectInfo);
        wiredSessionAdapter.emit(mockWiredSession);
        generateRosterAdapter.emit(mockGenerateRoster);
        wiredPermissionsAdapter.emit(mockWiredPermissions);
        wiredGetSessionStatusesAdapter.emit(mockwiredGetSessionStatuses);
        wiredCurrentPageReference.emit(mockCurrentPageReference);

        return global.flushPromises().then(async () => {
            const attendanceRows = element.shadowRoot.querySelectorAll(
                "c-attendance-row"
            );
            expect(attendanceRows).toHaveLength(mockGenerateRoster.deliveries.length);
            global.isAccessible(element);
        });
    });
    it("shows empty state and no buttons when zero returned rows with no perms", async () => {
        document.body.appendChild(element);
        wiredContactObjectInfoAdapter.emit(mockWiredContactObjectInfo);
        wiredSessionAdapter.emit(mockWiredSession);
        generateRosterAdapter.emit(mockGenerateRosterEmpty);
        wiredPermissionsAdapter.emit(mockWiredNoPermissions);
        wiredCurrentPageReference.emit(mockCurrentPageReference);

        return global.flushPromises().then(async () => {
            const attendanceRows = element.shadowRoot.querySelectorAll(
                "c-attendance-row"
            );
            expect(attendanceRows).toHaveLength(
                mockGenerateRosterEmpty.deliveries.length
            );

            const emptyState = element.shadowRoot.querySelectorAll("c-empty-state");
            expect(emptyState).toHaveLength(1);

            const scopedNotification = element.shadowRoot.querySelectorAll(
                "c-scoped-notification"
            );
            expect(scopedNotification).toHaveLength(0);

            const buttons = element.shadowRoot.querySelectorAll("lightning-button");
            expect(buttons).toHaveLength(0);

            global.isAccessible(element);
        });
    });
    it("shows empty state and no buttons when zero returned rows with perms", async () => {
        document.body.appendChild(element);
        wiredContactObjectInfoAdapter.emit(mockWiredContactObjectInfo);
        wiredSessionAdapter.emit(mockWiredSession);
        generateRosterAdapter.emit(mockGenerateRosterEmpty);
        wiredPermissionsAdapter.emit(mockWiredPermissions);
        wiredCurrentPageReference.emit(mockCurrentPageReference);

        return global.flushPromises().then(async () => {
            const attendanceRows = element.shadowRoot.querySelectorAll(
                "c-attendance-row"
            );
            expect(attendanceRows).toHaveLength(
                mockGenerateRosterEmpty.deliveries.length
            );

            const emptyState = element.shadowRoot.querySelectorAll("c-empty-state");
            expect(emptyState).toHaveLength(1);

            const scopedNotification = element.shadowRoot.querySelectorAll(
                "c-scoped-notification"
            );
            expect(scopedNotification).toHaveLength(0);

            const buttons = element.shadowRoot.querySelectorAll("lightning-button");
            expect(buttons).toHaveLength(0);

            global.isAccessible(element);
        });
    });
    it("shows perms error when rows are returned with no perms", async () => {
        document.body.appendChild(element);
        wiredContactObjectInfoAdapter.emit(mockWiredContactObjectInfo);
        wiredSessionAdapter.emit(mockWiredSession);
        generateRosterAdapter.emit(mockGenerateRoster);
        wiredPermissionsAdapter.emit(mockWiredNoPermissions);
        wiredCurrentPageReference.emit(mockCurrentPageReference);

        return global.flushPromises().then(async () => {
            const attendanceRows = element.shadowRoot.querySelectorAll(
                "c-attendance-row"
            );
            expect(attendanceRows).toHaveLength(0);

            const emptyState = element.shadowRoot.querySelectorAll("c-empty-state");
            expect(emptyState).toHaveLength(0);

            const scopedNotification = element.shadowRoot.querySelectorAll(
                "c-scoped-notification"
            );
            expect(scopedNotification).toHaveLength(1);

            global.isAccessible(element);
        });
    });
});
