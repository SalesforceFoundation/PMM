/*
 *
 *  * Copyright (c) 2022, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ServiceScheduleSelector {
    private static String ENROLLED = 'Enrolled';

    public ServiceSchedule__c getServiceScheduleFromId(Id serviceScheduleId) {
        List<ServiceSchedule__c> serviceSchedules = getServiceSchedulesFromId(
            new Set<Id>{ serviceScheduleId }
        );
        return serviceSchedules.size() > 0 ? serviceSchedules[0] : null;
    }

    public List<ServiceSchedule__c> getServiceSchedulesFromId(
        Set<Id> serviceScheduleIds
    ) {
        List<ServiceSchedule__c> serviceSchedules = new List<ServiceSchedule__c>();

        if (
            !(PermissionValidator.getInstance()
                .hasObjectAccess(
                    ServiceSchedule__c.SObjectType,
                    PermissionValidator.CRUDAccessType.READABLE
                ))
        ) {
            return new List<ServiceSchedule__c>();
        }

        serviceSchedules = [
            SELECT
                Id,
                Name,
                AllDay__c,
                CreateServiceSessionRecords__c,
                DaysOfWeek__c,
                DefaultServiceQuantity__c,
                FirstSessionEnd__c,
                FirstSessionStart__c,
                Frequency__c,
                Interval__c,
                MonthlyRecurrenceOption__c,
                NumberOfServiceSessions__c,
                OtherServiceProvider__c,
                ParticipantCapacity__c,
                PrimaryServiceProvider__c,
                ServiceScheduleEndDate__c,
                ServiceScheduleEnds__c,
                Service__c
            FROM ServiceSchedule__c
            WHERE Id = :serviceScheduleIds
        ];

        return Security.stripInaccessible(AccessType.READABLE, serviceSchedules)
            .getRecords();
    }

    public List<ServiceSchedule__c> getSchedulesWithParticipants(
        Set<Id> serviceScheduleIds
    ) {
        List<ServiceSchedule__c> schedules = new List<ServiceSchedule__c>();

        if (
            !(PermissionValidator.getInstance()
                .hasObjectAccess(
                    ServiceSchedule__c.SObjectType,
                    PermissionValidator.CRUDAccessType.READABLE
                ))
        ) {
            return new List<ServiceSchedule__c>();
        }

        schedules = [
            SELECT
                Id,
                ParticipantsEnrolled__c,
                (
                    SELECT Id, Status__c
                    FROM ServiceParticipants__r
                    WHERE status__c = :ENROLLED
                )
            FROM ServiceSchedule__c
            WHERE Id IN :serviceScheduleIds
        ];

        return Security.stripInaccessible(AccessType.READABLE, schedules).getRecords();
    }
}
