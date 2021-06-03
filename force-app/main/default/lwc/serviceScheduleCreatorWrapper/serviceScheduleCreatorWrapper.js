/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { LightningElement, api } from "lwc";
import newServiceSchedule from "@salesforce/label/c.New_Service_Schedule";

export default class ServiceScheduleCreatorWrapper extends LightningElement {
    @api recordTypeId;
    @api isCommunity;
    @api serviceId;

    labels = { newServiceSchedule };

    handleClose() {
        this.template.querySelector("c-service-schedule-creator").handleClose();
    }
}
