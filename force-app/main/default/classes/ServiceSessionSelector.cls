/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */
public with sharing class ServiceSessionSelector {
    private static final String RECENT_SESSIONS_VIEW = 'RecentSessionsView';

    public List<ServiceSession__c> getServiceSessionsByStartDate(
        String dateLiteral,
        Set<Id> sessionIds
    ) {
        List<ServiceSession__c> allSessions = new List<ServiceSession__c>();
        Set<String> allowedSessionStatuses = new Set<String>{ 'Pending', 'Complete' };

        if (!Schema.SObjectType.ServiceSession__c.isAccessible()) {
            return new List<ServiceSession__c>();
        }

        String scheduleRelationship =
            ServiceSession__c.ServiceSchedule__c.getDescribe().getRelationshipName() +
            '.';
        String serviceRelationship =
            ServiceSchedule__c.Service__c.getDescribe().getRelationshipName() + '.';

        Set<String> fields = new Set<String>(
            new FieldSetService()
                .getFieldByFieldPath(
                    String.valueOf(ServiceSession__c.SObjectType),
                    RECENT_SESSIONS_VIEW
                )
                .keySet()
        );
        fields.add(String.valueOf(ServiceSession__c.Name)); // Name is required
        fields.add(String.valueOf(ServiceSession__c.Status__c)); // Status is required
        fields.add(String.valueOf(ServiceSession__c.SessionStart__c)); // Start date is used to group the records

        QueryBuilder queryBuilder = new QueryBuilder()
            .withSObjectType(ServiceSession__c.SObjectType)
            .withSelectFields(new List<String>(fields));

        queryBuilder.addCondition(
            String.valueOf(ServiceSession__c.SessionStart__c) +
            ' = ' +
            dateLiteral
        );

        queryBuilder.addCondition(
            String.valueOf(ServiceSession__c.Status__c) + ' IN :allowedSessionStatuses'
        );

        if (sessionIds != null && !sessionIds.isEmpty()) {
            queryBuilder.addCondition(
                String.valueOf(ServiceSession__c.Id) + ' IN :sessionIds'
            );
        }

        queryBuilder.withOrderBy(String.valueOf(ServiceSession__c.SessionStart__c));

        allSessions = Database.query(queryBuilder.buildSoqlQuery());

        return Security.stripInaccessible(AccessType.READABLE, allSessions).getRecords();
    }
}
