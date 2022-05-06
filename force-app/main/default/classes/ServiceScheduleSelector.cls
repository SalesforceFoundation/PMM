/*
 *
 *  * Copyright (c) 2022, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ServiceScheduleSelector {
    public ServiceSchedule__c getServiceScheduleById(Id serviceScheduleId) {
        List<ServiceSchedule__c> serviceSchedules = getServiceSchedulesById(
            new Set<Id>{ serviceScheduleId }
        );
        return serviceSchedules.size() > 0 ? serviceSchedules[0] : null;
    }

    public List<ServiceSchedule__c> getServiceSchedulesById(Set<Id> serviceScheduleIds) {
        List<ServiceSchedule__c> serviceSchedules = new List<ServiceSchedule__c>();

        if (Schema.SObjectType.ServiceSchedule__c.isAccessible()) {
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
        }

        return Security.stripInaccessible(AccessType.READABLE, serviceSchedules)
            .getRecords();
    }
}
