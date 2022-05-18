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
import pmmFolder from "@salesforce/resourceUrl/pmm";
import { loadStyle } from "lightning/platformResourceLoader";

export default class ServiceScheduleAddSessionsQuickAction extends LightningElement {
    @api recordId;
    @api isCommunity;

    labels = { addServiceSessions };

    connectedCallback() {
        Promise.all([loadStyle(this, pmmFolder + "/quickActionModal.css")]);
    }
}
