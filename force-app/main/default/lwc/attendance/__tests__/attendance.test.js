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
import { getRecord, updateRecord } from "lightning/uiRecordApi";
import { CurrentPageReference } from "lightning/navigation";
import * as cUtil from "c/util";
import generateRoster from "@salesforce/apex/AttendanceController.generateRoster";
import checkFieldPermissions from "@salesforce/apex/AttendanceController.checkFieldPermissions";
import upsertRows from "@salesforce/apex/AttendanceController.upsertServiceDeliveries";
import {
    registerApexTestWireAdapter,
    registerLdsTestWireAdapter,
    registerTestWireAdapter,
} from "@salesforce/sfdx-lwc-jest";
import SUBMIT_LABEL from "@salesforce/label/c.Submit";
import UPDATE_LABEL from "@salesforce/label/c.Update";
import PRINT_LABEL from "@salesforce/label/c.Print";
import PRINTABLE_VIEW_LABEL from "@salesforce/label/c.Printable_View";
import SESSION_STATUS_FIELD from "@salesforce/schema/ServiceSession__c.Status__c";
import SAVE_LABEL from "@salesforce/label/c.Save";
import CANCEL_LABEL from "@salesforce/label/c.Cancel";
import QUANTITY_LABEL from "@salesforce/label/c.Quantity";

const mockGenerateRoster = require("./data/generateRoster.json");
const mockGenerateRosterEmpty = require("./data/emptyRoster.json");
const mockWiredSession = require("./data/wiredPendingSession.json");
const mockWiredPermissions = require("./data/wiredPermissions.json");
const mockWiredNoPermissions = require("./data/wiredNoPermissions.json");
const mockAttendanceTabPageReference = require("./data/attendanceTabPageReference.json");
const mockServiceSessionPageReference = require("./data/serviceSessionPageReference.json");
const mockApexError = require("../../__tests__/data/apexError.json");

//Register the  wire adapters
const generateRosterAdapter = registerApexTestWireAdapter(generateRoster);
const wiredSessionAdapter = registerLdsTestWireAdapter(getRecord);
const wiredPermissionsAdapter = registerApexTestWireAdapter(checkFieldPermissions);
const currentPageReferenceAdapter = registerTestWireAdapter(CurrentPageReference);

jest.mock("c/attendanceRow");
jest.mock(
    "@salesforce/apex/AttendanceController.upsertServiceDeliveries",
    () => {
        return {
            default: jest.fn(),
        };
    },
    { virtual: true }
);
describe("c-attendance", () => {
    let element;

    afterEach(global.clearDOM);

    beforeEach(() => {
        element = createElement("c-attendance", {
            is: Attendance,
        });
        element.recordId = "a06630000074mVnAAI";
        currentPageReferenceAdapter.emit(mockAttendanceTabPageReference);
    });

    it("shows multiple returned rows with perms", () => {
        document.body.appendChild(element);
        wiredSessionAdapter.emit(mockWiredSession);
        generateRosterAdapter.emit(mockGenerateRoster);
        wiredPermissionsAdapter.emit(mockWiredPermissions);

        return global.flushPromises().then(() => {
            const attendanceRows = element.shadowRoot.querySelectorAll(
                "c-attendance-row"
            );
            expect(attendanceRows).toHaveLength(mockGenerateRoster.deliveries.length);
            global.isAccessible(element);
        });
    });
    it("shows empty state and no buttons when zero returned rows with no perms", () => {
        document.body.appendChild(element);
        wiredSessionAdapter.emit(mockWiredSession);
        generateRosterAdapter.emit(mockGenerateRosterEmpty);
        wiredPermissionsAdapter.emit(mockWiredNoPermissions);

        return global.flushPromises().then(() => {
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
        });
    });
    it("shows empty state and no buttons when zero returned rows with perms", () => {
        document.body.appendChild(element);
        wiredSessionAdapter.emit(mockWiredSession);
        generateRosterAdapter.emit(mockGenerateRosterEmpty);
        wiredPermissionsAdapter.emit(mockWiredPermissions);

        return global.flushPromises().then(() => {
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

            return global.isAccessible(element);
        });
    });
    it("shows perms error when rows are returned with no perms", () => {
        document.body.appendChild(element);
        wiredSessionAdapter.emit(mockWiredSession);
        generateRosterAdapter.emit(mockGenerateRoster);
        wiredPermissionsAdapter.emit(mockWiredNoPermissions);

        return global.flushPromises().then(() => {
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

            return global.isAccessible(element);
        });
    });
    it("shows the default unit of measurement", () => {
        let sessionSinUom = JSON.parse(JSON.stringify(mockWiredSession));
        delete sessionSinUom.fields.ServiceSchedule__r.value.fields.Service__r.value
            .fields.UnitOfMeasurement__c;
        wiredSessionAdapter.emit(sessionSinUom);
        generateRosterAdapter.emit(mockGenerateRoster);
        wiredPermissionsAdapter.emit(mockWiredPermissions);
        document.body.appendChild(element);

        return global.flushPromises().then(() => {
            const attendanceRow = element.shadowRoot.querySelector("c-attendance-row");
            expect(attendanceRow.unitOfMeasurement).toBe(QUANTITY_LABEL);
        });
    });
    it("loads form without a status value", () => {
        let sessionSinUom = JSON.parse(JSON.stringify(mockWiredSession));
        delete sessionSinUom.fields.Status__c;
        wiredSessionAdapter.emit(sessionSinUom);
        generateRosterAdapter.emit(mockGenerateRoster);
        wiredPermissionsAdapter.emit(mockWiredPermissions);
        document.body.appendChild(element);

        return global.flushPromises().then(() => {
            const attendanceRows = element.shadowRoot.querySelectorAll(
                "c-attendance-row"
            );
            expect(attendanceRows).toHaveLength(mockGenerateRoster.deliveries.length);
        });
    });

    it("logs errors on generateRoster", () => {
        document.body.appendChild(element);
        console.log = jest.fn();
        wiredSessionAdapter.emit(mockWiredSession);
        generateRosterAdapter.error();
        wiredPermissionsAdapter.emit(mockWiredNoPermissions);
        expect(console.log).toHaveBeenCalled();
    });

    it("logs errors on getRecord", () => {
        document.body.appendChild(element);
        console.log = jest.fn();
        wiredSessionAdapter.error();
        generateRosterAdapter.emit(mockGenerateRoster);
        wiredPermissionsAdapter.emit(mockWiredNoPermissions);
        expect(console.log).toHaveBeenCalled();
    });
    it("logs errors on checkFieldPermissions", () => {
        document.body.appendChild(element);
        console.log = jest.fn();
        wiredSessionAdapter.emit(mockWiredSession);
        generateRosterAdapter.emit(mockGenerateRoster);
        wiredPermissionsAdapter.error();
        expect(console.log).toHaveBeenCalled();
    });
});

describe("c-attendance saving rows", () => {
    let element;

    afterEach(global.clearDOM);

    beforeEach(() => {
        element = createElement("c-attendance", {
            is: Attendance,
        });
        element.recordId = "a06630000074mVnAAI";
        currentPageReferenceAdapter.emit(mockAttendanceTabPageReference);
    });

    it("upserts rows calls save on row when successful", () => {
        document.body.appendChild(element);
        wiredSessionAdapter.emit(mockWiredSession);
        generateRosterAdapter.emit(mockGenerateRoster);
        wiredPermissionsAdapter.emit(mockWiredPermissions);
        upsertRows.mockResolvedValue();
        updateRecord.mockResolvedValue();
        let spy;

        return global
            .flushPromises()
            .then(() => {
                const attendanceRow = element.shadowRoot.querySelector(
                    "c-attendance-row"
                );
                spy = jest.spyOn(attendanceRow, "save");
                const submit = element.shadowRoot.querySelectorAll("lightning-button")[1];
                expect(submit.label).toBe(SUBMIT_LABEL);
                submit.click();
            })
            .then(() => {
                expect(
                    upsertRows.mock.calls[0][0].serviceDeliveriesToUpsert.length
                ).toEqual(mockGenerateRoster.deliveries.length);
                expect(spy).toHaveBeenCalled();
            });
    });
    it("updates the session status to complete", () => {
        document.body.appendChild(element);
        wiredSessionAdapter.emit(mockWiredSession);
        generateRosterAdapter.emit(mockGenerateRoster);
        wiredPermissionsAdapter.emit(mockWiredPermissions);
        upsertRows.mockResolvedValue();
        updateRecord.mockResolvedValue();

        return global
            .flushPromises()
            .then(() => {
                const submit = element.shadowRoot.querySelectorAll("lightning-button")[1];
                expect(submit.label).toBe(SUBMIT_LABEL);
                submit.click();
            })
            .then(() => {
                let record = { fields: { Id: element.recordId } };
                record.fields[SESSION_STATUS_FIELD.fieldApiName] = "Complete";
                expect(updateRecord).toHaveBeenCalledWith(record);
            });
    });
    it("upserts empty rows sends an empty list", () => {
        let rosterWithEmptyRecord = JSON.parse(JSON.stringify(mockGenerateRosterEmpty));
        rosterWithEmptyRecord.deliveries.push({});
        document.body.appendChild(element);
        wiredSessionAdapter.emit(mockWiredSession);
        generateRosterAdapter.emit(rosterWithEmptyRecord);
        wiredPermissionsAdapter.emit(mockWiredPermissions);
        upsertRows.mockResolvedValue();

        return global
            .flushPromises()
            .then(() => {
                const row = element.shadowRoot.querySelector("c-attendance-row");
                // Setting record to undefined to simulate what is returned when there
                // are no edits to the record.
                row.record = undefined;
                const submit = element.shadowRoot.querySelectorAll("lightning-button")[1];
                expect(submit.label).toBe(SUBMIT_LABEL);
                submit.click();
            })
            .then(() => {
                expect(
                    upsertRows.mock.calls[0][0].serviceDeliveriesToUpsert.length
                ).toEqual(0);
            });
    });
    it("sends upsert error to the error handler", () => {
        const handleErrorSpy = jest.spyOn(cUtil, "handleError");
        document.body.appendChild(element);
        wiredSessionAdapter.emit(mockWiredSession);
        generateRosterAdapter.emit(mockGenerateRoster);
        wiredPermissionsAdapter.emit(mockWiredPermissions);
        upsertRows.mockRejectedValue(mockApexError);

        return global
            .flushPromises()
            .then(() => {
                const submit = element.shadowRoot.querySelectorAll("lightning-button")[1];
                expect(submit.label).toBe(SUBMIT_LABEL);
                submit.click();
            })
            .then(() => {
                expect(handleErrorSpy).not.toHaveBeenCalled();
            });
    });
    it("sends update error to the error handler", () => {
        const handleErrorSpy = jest.spyOn(cUtil, "handleError");
        document.body.appendChild(element);
        wiredSessionAdapter.emit(mockWiredSession);
        generateRosterAdapter.emit(mockGenerateRoster);
        wiredPermissionsAdapter.emit(mockWiredPermissions);
        upsertRows.mockResolvedValue();
        updateRecord.mockRejectedValue({});

        return global
            .flushPromises()
            .then(() => {
                const submit = element.shadowRoot.querySelectorAll("lightning-button")[1];
                expect(submit.label).toBe(SUBMIT_LABEL);
                submit.click();
            })
            .then(() => {
                // We just need this step to enter the catch
            })
            .then(() => {
                expect(handleErrorSpy).toHaveBeenCalled();
            });
    });
});

describe("c-attendance printing the roster", () => {
    let element;

    afterEach(global.clearDOM);

    beforeEach(() => {
        element = createElement("c-attendance", {
            is: Attendance,
        });
        element.recordId = "a06630000074mVnAAI";
    });

    it("prints from attendance tab", () => {
        currentPageReferenceAdapter.emit(mockAttendanceTabPageReference);
        document.body.appendChild(element);
        wiredSessionAdapter.emit(mockWiredSession);
        generateRosterAdapter.emit(mockGenerateRoster);
        wiredPermissionsAdapter.emit(mockWiredPermissions);
        window.print = jest.fn();

        return global
            .flushPromises()
            .then(() => {
                const print = element.shadowRoot.querySelector("lightning-button");
                expect(print.label).toBe(PRINT_LABEL);
                print.click();
            })
            .then(() => {
                expect(window.print).toHaveBeenCalled();
            });
    });

    it("navigates to the attendance tab", () => {
        currentPageReferenceAdapter.emit(mockServiceSessionPageReference);
        document.body.appendChild(element);
        wiredSessionAdapter.emit(mockWiredSession);
        generateRosterAdapter.emit(mockGenerateRoster);
        wiredPermissionsAdapter.emit(mockWiredPermissions);
        window.open = jest.fn();

        return global
            .flushPromises()
            .then(() => {
                const print = element.shadowRoot.querySelector("lightning-button");
                expect(print.label).toBe(PRINTABLE_VIEW_LABEL);
                print.click();
            })
            .then(() => {
                expect(window.open).toHaveBeenCalled();
            });
    });
});

describe("c-attendance updating records", () => {
    let element;

    afterEach(global.clearDOM);

    beforeEach(() => {
        element = createElement("c-attendance", {
            is: Attendance,
        });
        element.recordId = "a06630000074mVnAAI";
        currentPageReferenceAdapter.emit(mockAttendanceTabPageReference);
    });

    it("allows updates on completed records", () => {
        document.body.appendChild(element);
        let completedSession = JSON.parse(JSON.stringify(mockWiredSession));
        completedSession.fields[SESSION_STATUS_FIELD.fieldApiName].value = "Complete";
        wiredSessionAdapter.emit(completedSession);
        generateRosterAdapter.emit(mockGenerateRoster);
        wiredPermissionsAdapter.emit(mockWiredPermissions);

        return global
            .flushPromises()
            .then(() => {
                const update = element.shadowRoot.querySelector("lightning-button");
                expect(update.label).toBe(UPDATE_LABEL);
                update.click();
            })
            .then(() => {
                const save = element.shadowRoot.querySelectorAll("lightning-button")[2];
                expect(save.label).toBe(SAVE_LABEL);
            });
    });

    it("allows cancel when updating completed records", () => {
        document.body.appendChild(element);
        let completedSession = JSON.parse(JSON.stringify(mockWiredSession));
        completedSession.fields[SESSION_STATUS_FIELD.fieldApiName].value = "Complete";
        wiredSessionAdapter.emit(completedSession);
        generateRosterAdapter.emit(mockGenerateRoster);
        wiredPermissionsAdapter.emit(mockWiredPermissions);

        return global
            .flushPromises()
            .then(() => {
                const update = element.shadowRoot.querySelector("lightning-button");
                expect(update.label).toBe(UPDATE_LABEL);
                update.click();
            })
            .then(() => {
                const cancel = element.shadowRoot.querySelectorAll("lightning-button")[1];
                expect(cancel.label).toBe(CANCEL_LABEL);
                cancel.click();
            })
            .then(() => {
                const update = element.shadowRoot.querySelector("lightning-button");
                expect(update.label).toBe(UPDATE_LABEL);
            });
    });

    it("does not update session when not pending", () => {
        document.body.appendChild(element);
        let completedSession = JSON.parse(JSON.stringify(mockWiredSession));
        completedSession.fields[SESSION_STATUS_FIELD.fieldApiName].value = "Complete";
        wiredSessionAdapter.emit(completedSession);
        generateRosterAdapter.emit(mockGenerateRoster);
        wiredPermissionsAdapter.emit(mockWiredPermissions);
        upsertRows.mockResolvedValue();

        return global
            .flushPromises()
            .then(() => {
                const update = element.shadowRoot.querySelector("lightning-button");
                expect(update.label).toBe(UPDATE_LABEL);
                update.click();
            })
            .then(() => {
                const save = element.shadowRoot.querySelectorAll("lightning-button")[2];
                expect(save.label).toBe(SAVE_LABEL);
                save.click();
            })
            .then(() => {
                expect(updateRecord).not.toHaveBeenCalled();
            });
    });
});
