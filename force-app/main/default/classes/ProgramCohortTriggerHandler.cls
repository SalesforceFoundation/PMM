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
    private CampaignService campaignService = new CampaignService();

    private Set<String> programEngagementStages = new Set<String>{
        'Applied',
        'Application Denied',
        'Waitlisted',
        'Enrolled',
        'Active',
        'Completed',
        'Withdrawn'
    };

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
                // TODO: bulkify, move to service class
                Map<Id, Program__c> programById = new Map<Id, Program__c>();
                for (ProgramCohort__c newCohort : (List<ProgramCohort__c>) Trigger.new) {
                    if (newCohort.Campaign__c == null) {
                        programById.put(newCohort.Program__c, null);
                    }
                }

                if (!programById.values().isEmpty()) {
                    programById = new Map<Id, Program__c>(
                        [SELECT Id, Name FROM Program__c WHERE Id = :programById.keySet()]
                    );
                }

                for (ProgramCohort__c newCohort : (List<ProgramCohort__c>) Trigger.new) {
                    if (newCohort.Campaign__c != null) {
                        continue;
                    }
                    String linkedCampaignName =
                        programById.get(newCohort.Program__c).Name +
                        ': ' +
                        newCohort.Name;
                    Campaign linkedCampaign = campaignService.createCampaign(
                        linkedCampaignName,
                        programEngagementStages
                    );
                    newCohort.Campaign__c = linkedCampaign.Id;
                }
            }
            when BEFORE_UPDATE {
                // TODO: bulkify, move to service class
                Map<Id, Program__c> programById = new Map<Id, Program__c>();
                for (ProgramCohort__c newCohort : (List<ProgramCohort__c>) Trigger.new) {
                    if (newCohort.Campaign__c == null) {
                        programById.put(newCohort.Program__c, null);
                    }
                }

                if (!programById.values().isEmpty()) {
                    programById = new Map<Id, Program__c>(
                        [SELECT Id, Name FROM Program__c WHERE Id = :programById.keySet()]
                    );
                }

                for (ProgramCohort__c newCohort : (List<ProgramCohort__c>) Trigger.new) {
                    if (newCohort.Campaign__c != null) {
                        continue;
                    }
                    String linkedCampaignName =
                        programById.get(newCohort.Program__c).Name +
                        ': ' +
                        newCohort.Name;
                    Campaign linkedCampaign = campaignService.createCampaign(
                        linkedCampaignName,
                        programEngagementStages
                    );
                    newCohort.Campaign__c = linkedCampaign.Id;
                }
            }
            when else {
                return;
            }
        }
    }
}
