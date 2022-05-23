/*
 *
 *  * Copyright (c) 2022, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */
public with sharing class ServiceParticipantRollupsService {
    private static String ENROLLED = 'Enrolled';
    private static Set<String> FEATUREGATE_NAME = new Set<String>{
        'ServiceParticipantsToServiceSchedule'
    };

    public void processInsertedParticipants(List<ServiceParticipant__c> participants) {
        Integer participantCount;
        Set<Id> serviceScheduleIds = new Set<Id>();
        List<ServiceSchedule__c> serviceSchedulesToUpdate = new List<ServiceSchedule__c>();
        Map<Id, ServiceSchedule__c> schedules = new Map<Id, ServiceSchedule__c>();
        Boolean isfeatureGateActive = getFeatureGateStatus();

        if (isfeatureGateActive) {
            for (ServiceParticipant__c participant : participants) {
                serviceScheduleIds.add(participant.ServiceSchedule__c);
            }

            schedules = getServiceSchedules(serviceScheduleIds);

            for (ServiceSchedule__c schedule : schedules.values()) {
                participantCount = 0;
                for (
                    ServiceParticipant__c serviceParticipant : schedule.ServiceParticipants__r
                ) {
                    if (serviceParticipant.Status__c != ENROLLED) {
                        continue;
                    }
                    participantCount++;
                }
                schedule.ParticipantsEnrolled__c = participantCount;
                serviceSchedulesToUpdate.add(schedule);
            }

            if (!serviceSchedulesToUpdate.isEmpty()) {
                update serviceSchedulesToUpdate;
            }
        }
    }

    private Map<Id, ServiceSchedule__c> getServiceSchedules(Set<Id> scheduleIds) {
        return new Map<Id, ServiceSchedule__c>(
            [
                SELECT
                    Id,
                    ParticipantsEnrolled__c,
                    (SELECT Id, Status__c FROM ServiceParticipants__r)
                FROM ServiceSchedule__c
                WHERE Id IN :scheduleIds
            ]
        );
    }

    private Boolean getFeatureGateStatus() {
        List<FeatureGate__mdt> features = CustomMetadataSelector.getInstance()
            .getAllFeatureGates();

        for (FeatureGate__mdt feature : features) {
            if (feature.IsActive__c && FEATUREGATE_NAME.contains(feature.DeveloperName)) {
                return feature.IsActive__c;
            }
        }

        return false;
    }
}
