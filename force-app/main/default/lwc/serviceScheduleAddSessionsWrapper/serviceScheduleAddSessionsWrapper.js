/*
 *
 *  * Copyright (c) 2022, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { LightningElement, api } from "lwc";
import addServiceSessions from "@salesforce/label/c.Add_More_Sessions";

export default class ServiceScheduleAddSessionsWrapper extends LightningElement {
    @api recordId;
    @api isCommunity;

    labels = { addServiceSessions };
}
