/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ServiceScheduleTriggerHandler {
    @TestVisible
    private CampaignService campaignService = new CampaignService();

    private Set<String> serviceParticipantStatuses = new Set<String>{
        'Waitlisted',
        'Enrolled',
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
                Map<Id, Service__c> serviceById = new Map<Id, Service__c>();
                for (
                    ServiceSchedule__c newServiceSchedule : (List<ServiceSchedule__c>) Trigger.new
                ) {
                    if (newServiceSchedule.Campaign__c == null) {
                        serviceById.put(newServiceSchedule.Service__c, null);
                    }
                }

                if (!serviceById.values().isEmpty()) {
                    serviceById = new Map<Id, Service__c>(
                        [SELECT Id, Name FROM Service__c WHERE Id = :serviceById.keySet()]
                    );
                }

                for (
                    ServiceSchedule__c newServiceSchedule : (List<ServiceSchedule__c>) Trigger.new
                ) {
                    if (newServiceSchedule.Campaign__c != null) {
                        continue;
                    }
                    String linkedCampaignName =
                        serviceById.get(newServiceSchedule.Service__c).Name +
                        ': ' +
                        newServiceSchedule.Name;
                    Campaign linkedCampaign = campaignService.createCampaign(
                        linkedCampaignName,
                        serviceParticipantStatuses
                    );
                    newServiceSchedule.Campaign__c = linkedCampaign.Id;
                }
            }
            when BEFORE_UPDATE {
                // TODO: bulkify, move to service class
                Map<Id, Service__c> serviceById = new Map<Id, Service__c>();
                for (
                    ServiceSchedule__c newServiceSchedule : (List<ServiceSchedule__c>) Trigger.new
                ) {
                    if (newServiceSchedule.Campaign__c == null) {
                        serviceById.put(newServiceSchedule.Service__c, null);
                    }
                }

                if (!serviceById.values().isEmpty()) {
                    serviceById = new Map<Id, Service__c>(
                        [SELECT Id, Name FROM Service__c WHERE Id = :serviceById.keySet()]
                    );
                }

                for (
                    ServiceSchedule__c newServiceSchedule : (List<ServiceSchedule__c>) Trigger.new
                ) {
                    if (newServiceSchedule.Campaign__c != null) {
                        continue;
                    }
                    String linkedCampaignName =
                        serviceById.get(newServiceSchedule.Service__c).Name +
                        ': ' +
                        newServiceSchedule.Name;
                    Campaign linkedCampaign = campaignService.createCampaign(
                        linkedCampaignName,
                        serviceParticipantStatuses
                    );
                    newServiceSchedule.Campaign__c = linkedCampaign.Id;
                }
            }
            when AFTER_DELETE {
            }
            when AFTER_INSERT {
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
