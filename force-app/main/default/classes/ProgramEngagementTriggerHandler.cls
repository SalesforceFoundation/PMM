/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ProgramEngagementTriggerHandler {
    @TestVisible
    private CampaignService campaignService = new CampaignService();

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
                Map<Id, ProgramCohort__c> programCohortById = new Map<Id, ProgramCohort__c>();
                for (
                    ProgramEngagement__c newProgramEngagement : (List<ProgramEngagement__c>) Trigger.new
                ) {
                    programCohortById.put(newProgramEngagement.ProgramCohort__c, null);
                }

                programCohortById = new Map<Id, ProgramCohort__c>(
                    [
                        SELECT Id, Campaign__c
                        FROM ProgramCohort__c
                        WHERE Id = :programCohortById.keySet()
                    ]
                );

                for (
                    ProgramEngagement__c newProgramEngagement : (List<ProgramEngagement__c>) Trigger.new
                ) {
                    Id campaignId = programCohortById.get(
                            newProgramEngagement.ProgramCohort__c
                        )
                        .Campaign__c;
                    if (campaignId == null || newProgramEngagement.Contact__c == null) {
                        return;
                    }
                    campaignService.stageCampaignMember(
                        newProgramEngagement.Contact__c,
                        programCohortById.get(newProgramEngagement.ProgramCohort__c)
                            .Campaign__c,
                        newProgramEngagement.Stage__c
                    );
                }
                campaignService.commitCampaignMembers();
            }
            when AFTER_UNDELETE {
            }
            when AFTER_UPDATE {
            }
            when else {
                return;
            }
        }
    }
}
