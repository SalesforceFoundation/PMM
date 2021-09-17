/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ServiceParticipantTriggerHandler {
    @TestVisible
    private ServiceParticipantService participantService = new ServiceParticipantService();

    public void execute() {
        if (!Trigger.isExecuting) {
            return;
        }

        delegate();
    }

    @TestVisible
    private void delegate() {
        switch on Trigger.operationType {
            when AFTER_DELETE {
            }
            when AFTER_INSERT {
                participantService.addParticipantsToCampaign(
                    (List<ServiceParticipant__c>) Trigger.new
                );
            }
            when AFTER_UNDELETE {
            }
            when AFTER_UPDATE {
                participantService.addParticipantsToCampaign(
                    (List<ServiceParticipant__c>) Trigger.new
                );
            }
            when else {
                return;
            }
        }
    }
}
