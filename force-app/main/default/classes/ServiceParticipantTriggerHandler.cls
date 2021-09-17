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
                Map<Id, ServiceSchedule__c> serviceScheduleById = new Map<Id, ServiceSchedule__c>();
                for (
                    ServiceParticipant__c newServiceParticipant : (List<ServiceParticipant__c>) Trigger.new
                ) {
                    serviceScheduleById.put(
                        newServiceParticipant.ServiceSchedule__c,
                        null
                    );
                }

                serviceScheduleById = new Map<Id, ServiceSchedule__c>(
                    [
                        SELECT Id, Campaign__c
                        FROM ServiceSchedule__c
                        WHERE Id = :serviceScheduleById.keySet()
                    ]
                );

                for (
                    ServiceParticipant__c newServiceParticipant : (List<ServiceParticipant__c>) Trigger.new
                ) {
                    Id campaignId = serviceScheduleById.get(
                            newServiceParticipant.ServiceSchedule__c
                        )
                        .Campaign__c;
                    if (campaignId == null || newServiceParticipant.Contact__c == null) {
                        return;
                    }
                    campaignService.stageCampaignMember(
                        newServiceParticipant.Contact__c,
                        serviceScheduleById.get(newServiceParticipant.ServiceSchedule__c)
                            .Campaign__c,
                        newServiceParticipant.Status__c
                    );
                }
                campaignService.commitCampaignMembers();
            }
            when AFTER_UNDELETE {
            }
            when AFTER_UPDATE {
                Map<Id, ServiceSchedule__c> serviceScheduleById = new Map<Id, ServiceSchedule__c>();

                Set<Id> linkedCampaignIds = new Set<Id>();
                Set<Id> participantContactIds = new Set<Id>();
                for (
                    ServiceParticipant__c newServiceParticipant : (List<ServiceParticipant__c>) Trigger.new
                ) {
                    serviceScheduleById.put(
                        newServiceParticipant.ServiceSchedule__c,
                        null
                    );
                    participantContactIds.add(newServiceParticipant.Contact__c);
                }

                serviceScheduleById = new Map<Id, ServiceSchedule__c>(
                    [
                        SELECT Id, Campaign__c
                        FROM ServiceSchedule__c
                        WHERE Id = :serviceScheduleById.keySet()
                    ]
                );

                for (ServiceSchedule__c serviceSchedule : serviceScheduleById.values()) {
                    if (serviceSchedule.Campaign__c != null) {
                        linkedCampaignIds.add(serviceSchedule.Campaign__c);
                    }
                }

                List<CampaignMember> preExistingCampaignMembers = [
                    SELECT ContactId, CampaignId, Status
                    FROM CampaignMember
                    WHERE
                        CampaignId = :linkedCampaignIds
                        AND ContactId = :participantContactIds
                ];

                Map<String, CampaignMember> preExistingCampaignMembersByContactAndCampaignId = new Map<String, CampaignMember>();

                for (CampaignMember preExistingMember : preExistingCampaignMembers) {
                    preExistingCampaignMEmbersByContactAndCampaignId.put(
                        (String) preExistingMember.ContactId +
                        (String) preExistingMember.CampaignId,
                        preExistingMember
                    );
                }

                for (ServiceSchedule__c serviceSchedule : serviceScheduleById.values()) {
                    if (serviceSchedule.Campaign__c != null) {
                        linkedCampaignIds.add(serviceSchedule.Campaign__c);
                    }
                }

                for (
                    ServiceParticipant__c newServiceParticipant : (List<ServiceParticipant__c>) Trigger.new
                ) {
                    Id campaignId = serviceScheduleById.get(
                            newServiceParticipant.ServiceSchedule__c
                        )
                        .Campaign__c;
                    if (campaignId == null || newServiceParticipant.Contact__c == null) {
                        return;
                    }

                    String campaignMemberKey =
                        (String) newServiceParticipant.Contact__c + (String) campaignId;
                    if (
                        preExistingCampaignMembersByContactAndCampaignId.containsKey(
                            campaignMemberKey
                        )
                    ) {
                        CampaignMember preExistingMember = preExistingCampaignMembersByContactAndCampaignId.get(
                            campaignMemberKey
                        );
                        preExistingMember.Status = newServiceParticipant.Status__c;
                        campaignService.addStagedCampaignMember(preExistingMember);
                    } else {
                        campaignService.stageCampaignMember(
                            newServiceParticipant.Contact__c,
                            serviceScheduleById.get(
                                    newServiceParticipant.ServiceSchedule__c
                                )
                                .Campaign__c,
                            newServiceParticipant.Status__c
                        );
                    }
                }
                campaignService.commitCampaignMembers();
            }
            when else {
                return;
            }
        }
    }
}
