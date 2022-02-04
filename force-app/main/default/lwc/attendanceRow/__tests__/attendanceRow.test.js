/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { createElement } from "lwc";
import AttendanceRow from "c/attendanceRow";

describe("c-attendanceRow", () => {
    let element;

    afterEach(global.clearDOM);

    beforeEach(() => {
        element = createElement("c-attendance-row", {
            is: AttendanceRow,
        });
    });

    it("loads in read only mode", () => {
        document.body.appendChild(element);

        return global.flushPromises().then(() => {
            return global.isAccessible(element);
        });
    });
});
