/*
 *
 *  * Copyright (c) 2022, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */
public with sharing class ServiceParticipantRollupsService {
    private static Set<String> FEATUREGATE_NAME = new Set<String>{
        'ServiceParticipantsToServiceSchedule'
    };
    @TestVisible
    private ServiceScheduleSelector scheduleSelector = new ServiceScheduleSelector();

    public void processParticipantRollups(List<ServiceParticipant__c> participants) {
        Set<Id> serviceScheduleIds = new Set<Id>();
        List<ServiceSchedule__c> serviceSchedulesToUpdate = new List<ServiceSchedule__c>();
        List<ServiceSchedule__c> schedules = new List<ServiceSchedule__c>();
        Boolean isfeatureGateActive = getFeatureGateStatus();

        if (isfeatureGateActive) {
            for (ServiceParticipant__c participant : participants) {
                serviceScheduleIds.add(participant.ServiceSchedule__c);
            }

            schedules = scheduleSelector.getSchedulesWithParticipants(serviceScheduleIds);

            for (ServiceSchedule__c schedule : schedules) {
                if (
                    schedule.ParticipantsEnrolled__c !=
                    schedule.ServiceParticipants__r.size()
                ) {
                    schedule.ParticipantsEnrolled__c = schedule.ServiceParticipants__r.size();
                    serviceSchedulesToUpdate.add(schedule);
                }
            }

            if (!serviceSchedulesToUpdate.isEmpty()) {
                update serviceSchedulesToUpdate;
            }
        }
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
