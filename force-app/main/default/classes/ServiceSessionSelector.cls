/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */
public with sharing class ServiceSessionSelector {
    public List<ServiceSession__c> getServiceSessionsByStartDate(String dateLiteral) {
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
                    'RecentSessionsView'
                )
                .keySet()
        );
        fields.add(String.valueOf(ServiceSession__c.Name)); // Name is required

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

        queryBuilder.withOrderBy(String.valueOf(ServiceSession__c.SessionStart__c));

        allSessions = Database.query(queryBuilder.buildSoqlQuery());

        return Security.stripInaccessible(AccessType.READABLE, allSessions).getRecords();
    }
}
