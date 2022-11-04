/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { LightningElement, api } from "lwc";
import { NavigationMixin } from "lightning/navigation";
import newServiceSchedule from "@salesforce/label/c.New_Service_Schedule";
import SSModal from "c/serviceScheduleCreatorModal";
export default class ServiceScheduleCreatorWrapper extends NavigationMixin(
    LightningElement
) {
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
        const result = await SSModal.open({
            size: "large",
            description: "TODO",
            onnavigate: event => {
                this.navigateToRecord(event.detail.recordId, event.detail.objectApiName);
            },
            onclose: e => {
                e.stopPropagation();
            },
        });
        // if modal closed with X button, promise returns result = 'undefined'
        // if modal closed with OK button, promise returns result = 'okay'
        if (result === undefined) {
            this.navigateToList();
        }
    }

    //TODO: Need to refactor serviceschedule__c hardcode
    navigateToList() {
        this[NavigationMixin.Navigate]({
            type: "standard__objectPage",
            attributes: {
                objectApiName: "ServiceSchedule__c",
                actionName: "list",
            },
            state: {
                filterName: "Recent",
            },
        });
    }

    navigateToRecord(recordId, objectApiName) {
        this[NavigationMixin.Navigate]({
            type: "standard__recordPage",
            attributes: {
                recordId: recordId,
                objectApiName: objectApiName,
                actionName: "view",
            },
        });
    }
}
