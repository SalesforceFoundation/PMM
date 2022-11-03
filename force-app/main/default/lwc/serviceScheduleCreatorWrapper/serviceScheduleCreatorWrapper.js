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
import SSModal from "c/serviceScheduleCreatorModal";
export default class ServiceScheduleCreatorWrapper extends LightningElement {
    @api recordTypeId;
    @api isCommunity;
    @api serviceId;

    labels = { newServiceSchedule };
    connectedCallback() {
        if (!this.isCommunity) {
            this.openSSModal();
        }
    }

    async openSSModal() {
        await SSModal.open({
            size: "large",
            description: "Accessible description of modal's purpose",
            onclose: e => {
                // stop further propagation of the event
                e.stopPropagation();
                // hand off to separate function to process
                // result of the event (see above in this example)
                //this.handleSelectEvent(e.detail);
                console.log("heard close event", e.detail);
                // or proxy to be handled above by dispatching
                // another custom event to pass on the event
                // this.dispatchEvent(e);
            },
        });
        // if modal closed with X button, promise returns result = 'undefined'
        // if modal closed with OK button, promise returns result = 'okay'
    }
}
