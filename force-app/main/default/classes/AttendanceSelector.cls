/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class AttendanceSelector {
    private QueryBuilder queryBuilder = new QueryBuilder();

    public List<ServiceDelivery__c> getServiceDeliveriesBySessionId(Id sessionId) {
        if (!Schema.SObjectType.ServiceDelivery__c.isAccessible()) {
            return new List<ServiceDelivery__c>();
        }

        FieldSet fieldSet = SObjectType.ServiceDelivery__c.FieldSets.Attendance_Service_Deliveries;

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
            .addCondition(String.valueOf(ServiceDelivery__c.Contact__c) + ' != NULL');

        List<ServiceDelivery__c> serviceDeliveries = Database.query(
            queryBuilder.buildSoqlQuery()
        );

        return Security.stripInaccessible(AccessType.READABLE, serviceDeliveries)
            .getRecords();
    }

    public List<ServiceParticipant__c> getServiceParticipantsByScheduleId(
        Id scheduleId,
        Set<Id> contactsToExclude
    ) {
        if (!Schema.SObjectType.ServiceParticipant__c.isAccessible()) {
            return new List<ServiceParticipant__c>();
        }

        List<ServiceParticipant__c> serviceParticipants = [
            SELECT
                Id,
                Contact__c,
                Contact__r.Name,
                Service__c,
                ProgramEngagement__c,
                Service__r.UnitOfMeasurement__c
            FROM ServiceParticipant__c
            WHERE
                ServiceSchedule__c = :scheduleId
                AND Contact__c NOT IN :contactsToExclude
                AND Contact__c != NULL
        ];

        return Security.stripInaccessible(AccessType.READABLE, serviceParticipants)
            .getRecords();
    }

    public ServiceSession__c getSession(Id sessionId) {
        ServiceSession__c session = [
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

        // Used by Apex code only for querying related records
        // does not require strip inaccessible
        return session;
    }
}
