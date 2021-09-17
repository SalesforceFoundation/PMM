/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ProgramCohortService {
    @TestVisible
    private CampaignService campaignService = new CampaignService();

    public void createLinkedCampaigns(List<ProgramCohort__c> cohorts) {
        // TODO: bulkify
        Map<Id, Program__c> programById = new Map<Id, Program__c>();
        for (ProgramCohort__c newCohort : cohorts) {
            if (newCohort.Campaign__c == null) {
                programById.put(newCohort.Program__c, null);
            }
        }

        if (!programById.values().isEmpty()) {
            programById = new Map<Id, Program__c>(
                [SELECT Id, Name FROM Program__c WHERE Id = :programById.keySet()]
            );
        }

        for (ProgramCohort__c newCohort : cohorts) {
            if (newCohort.Campaign__c != null) {
                continue;
            }
            String linkedCampaignName =
                programById.get(newCohort.Program__c).Name +
                ': ' +
                newCohort.Name;
            Campaign linkedCampaign = campaignService.createCampaign(
                linkedCampaignName,
                ProgramEngagementService.programEngagementStages
            );
            newCohort.Campaign__c = linkedCampaign.Id;
        }
    }
}
