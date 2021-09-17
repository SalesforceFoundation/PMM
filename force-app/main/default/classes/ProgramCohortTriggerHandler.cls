/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ProgramCohortTriggerHandler {
    @TestVisible
    private ProgramCohortService cohortService = new ProgramCohortService();

    public void execute() {
        if (!Trigger.isExecuting) {
            return;
        }

        delegate();
    }

    @TestVisible
    private void delegate() {
        switch on Trigger.operationType {
            when BEFORE_INSERT {
                cohortService.createLinkedCampaigns((List<ProgramCohort__c>) Trigger.new);
            }
            when BEFORE_UPDATE {
                cohortService.createLinkedCampaigns((List<ProgramCohort__c>) Trigger.new);
            }
            when else {
                return;
            }
        }
    }
}
