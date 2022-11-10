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
import SERVICE_SCHEDULE from "@salesforce/schema/ServiceSchedule__c";
import newServiceSchedule from "@salesforce/label/c.New_Service_Schedule";
import serviceScheduleWizard from "@salesforce/label/c.Service_Schedule_Wizard";
import SSModal from "c/serviceScheduleCreatorModal";

export default class ServiceScheduleCreatorWrapper extends NavigationMixin(
    LightningElement
) {
    @api recordTypeId;
    @api isCommunity;
    @api serviceId;

    labels = { newServiceSchedule, serviceScheduleWizard };
    connectedCallback() {
        if (!this.isCommunity) {
            this.openSSModal();
        }
    }

    async openSSModal() {
        const result = await SSModal.open({
            size: "large",
            description: this.labels.serviceScheduleWizard,
            onnavigate: event => {
                this.navigateToRecord(event.detail.recordId, event.detail.objectApiName);
            },
            onclose: e => {
                e.stopPropagation();
            },
        });
        // if modal closed with X button, promise returns result = 'undefined'
        if (result === undefined) {
            this.navigateToList();
        }
    }

    navigateToList() {
        this[NavigationMixin.Navigate]({
            type: "standard__objectPage",
            attributes: {
                objectApiName: SERVICE_SCHEDULE.objectApiName,
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
