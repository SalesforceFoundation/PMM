/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ProgramEngagementService {
    @TestVisible
    private CampaignService campaignService = new CampaignService();

    public static Set<String> programEngagementStages = new Set<String>{
        'Applied',
        'Application Denied',
        'Waitlisted',
        'Enrolled',
        'Active',
        'Completed',
        'Withdrawn'
    };

    public void addEngagementsToCampaign(List<ProgramEngagement__c> engagements) {
        Map<Id, ProgramCohort__c> programCohortById = new Map<Id, ProgramCohort__c>();
        for (ProgramEngagement__c newProgramEngagement : engagements) {
            programCohortById.put(newProgramEngagement.ProgramCohort__c, null);
        }

        programCohortById = new Map<Id, ProgramCohort__c>(
            [
                SELECT Id, Campaign__c
                FROM ProgramCohort__c
                WHERE Id = :programCohortById.keySet()
            ]
        );

        for (ProgramEngagement__c newProgramEngagement : engagements) {
            Id campaignId = null;
            if (programCohortById.containsKey(newProgramEngagement.ProgramCohort__c)) {
                campaignId = programCohortById.get(newProgramEngagement.ProgramCohort__c)
                    .Campaign__c;
            }
            if (campaignId == null || newProgramEngagement.Contact__c == null) {
                return;
            }
            campaignService.stageCampaignMember(
                newProgramEngagement.Contact__c,
                programCohortById.get(newProgramEngagement.ProgramCohort__c).Campaign__c,
                newProgramEngagement.Stage__c
            );
        }
        campaignService.commitCampaignMembers();
    }
}
