/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ServiceDeliverySelector {
    @TestVisible
    private QueryBuilder queryBuilder {
        get {
            if (queryBuilder == null) {
                queryBuilder = new QueryBuilder();
            }
            return queryBuilder;
        }
        set;
    }

    public String getAttendanceFieldSetName(Id scheduleId) {
        // We want to bypass FLS because this is a system field that drives our UI
        List<ServiceSchedule__c> schedules = [
            SELECT Service__r.AttendanceFieldSet__c
            FROM ServiceSchedule__c
            WHERE Id = :scheduleId
        ];

        return schedules.isEmpty() ? null : schedules[0].Service__r.AttendanceFieldSet__c;
    }

    public List<ServiceDelivery__c> getServiceDeliveriesBySessionId(
        FieldSet fieldSet,
        Id sessionId,
        String sortBy
    ) {
        if (!Schema.SObjectType.ServiceDelivery__c.isAccessible()) {
            return new List<ServiceDelivery__c>();
        }

        queryBuilder.withSObjectType(ServiceDelivery__c.getSObjectType())
            .withSelectFields(fieldSet)
            .withSelectFields(
                new List<String>{
                    String.valueOf(
                        ServiceDelivery__c.Contact__c.getDescribe()
                            .getRelationshipName() +
                        '.' +
                        String.valueOf(Contact.Name)
                    )
                }
            )
            .addCondition(
                String.valueOf(ServiceDelivery__c.ServiceSession__c) + ' = :sessionId'
            )
            .addCondition(String.valueOf(ServiceDelivery__c.Contact__c) + ' != NULL')
            .withOrderBy('Contact__r.' + sortBy);

        List<ServiceDelivery__c> serviceDeliveries = Database.query(
            queryBuilder.buildSoqlQuery()
        );

        return Security.stripInaccessible(AccessType.READABLE, serviceDeliveries)
            .getRecords();
    }

    public List<ServiceParticipant__c> getServiceParticipantsByScheduleId(
        Id scheduleId,
        Set<Id> contactsToExclude,
        String sortBy
    ) {
        if (!Schema.SObjectType.ServiceParticipant__c.isAccessible()) {
            return new List<ServiceParticipant__c>();
        }

        String serviceParticipantsQuery =
            'SELECT Id, Contact__c, Contact__r.Name, ProgramEngagement__c,ProgramEngagement__r.Stage__c, ProgramEngagement__r.Role__c, Service__c, ' +
            'Service__r.UnitOfMeasurement__c, Status__c ' +
            'FROM ServiceParticipant__c WHERE ServiceSchedule__c = :scheduleId AND Contact__c NOT IN :contactsToExclude AND Contact__c != NULL ORDER BY Contact__r.' +
            sortBy +
            '';
        List<ServiceParticipant__c> serviceParticipants = Database.query(
            serviceParticipantsQuery
        );

        return Security.stripInaccessible(AccessType.READABLE, serviceParticipants)
            .getRecords();
    }

    public ServiceSession__c getSession(Id sessionId) {
        List<ServiceSession__c> sessions = [
            SELECT
                Id,
                ServiceSchedule__c,
                PrimaryServiceProvider__c,
                SessionStart__c,
                ServiceSchedule__r.Service__c,
                ServiceSchedule__r.DefaultServiceQuantity__c
            FROM ServiceSession__c
            WHERE Id = :sessionId
            LIMIT 1
        ];

        return (ServiceSession__c) Security.stripInaccessible(
                AccessType.READABLE,
                sessions
            )
            .getRecords()[0];
    }
}
