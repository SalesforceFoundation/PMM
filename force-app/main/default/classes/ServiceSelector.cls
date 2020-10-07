/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ServiceSelector {
    public ServiceSelector() {
    }

    public List<Service__c> getServicesByProgramIds(Set<Id> programIds) {
        if (!Schema.SObjectType.Service__c.isAccessible()) {
            return new List<Service__c>();
        }
        List<Service__c> queriedServices = [
            SELECT Id, Name, Program__c
            FROM Service__c
            WHERE Program__c IN :programIds
        ];

        return Security.stripInaccessible(AccessType.READABLE, queriedServices)
            .getRecords();
    }

    public List<Service__c> getServicesByProgramEngagementId(Id programEngagementId) {
        if (!Schema.SObjectType.Service__c.isAccessible()) {
            return new List<Service__c>();
        }

        List<Service__c> services = [
            SELECT Id, Name, Program__c
            FROM Service__c
            WHERE
                Program__c IN (
                    SELECT Program__c
                    FROM ProgramEngagement__c
                    WHERE Id = :programEngagementId
                )
        ];

        return Security.stripInaccessible(AccessType.READABLE, services).getRecords();
    }

    public List<Contact> getContactsByIds(Set<Id> contactIds) {
        return [SELECT Name FROM Contact WHERE Id IN :contactIds];
        // Name includes a required field that must have FLS
        // so no stripInacessible needed if that's the only field being returned
    }

    public List<ServiceSession__c> getSessionsAfter(Id scheduleId, Date startDate) {
        if (!Schema.SObjectType.ServiceSession__c.isAccessible()) {
            return new List<ServiceSession__c>();
        }
        return [
            SELECT Id, SessionStart__c
            FROM ServiceSession__c
            WHERE
                ServiceSchedule__c = :scheduleId
                AND DAY_ONLY(convertTimezone(SessionStart__c)) > :startDate
        ];
    }
}
