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

        List<String> fields = new List<String>{
            String.valueOf(ServiceSession__c.Id),
            String.valueOf(ServiceSession__c.Name),
            String.valueOf(ServiceSession__c.PrimaryServiceProvider__c),
            String.valueOf(ServiceSession__c.SessionStart__c),
            String.valueOf(ServiceSession__c.Status__c),
            scheduleRelationship +
            serviceRelationship +
            String.valueOf(Service__c.Name)
        };

        QueryBuilder queryBuilder = new QueryBuilder()
            .withSObjectType(ServiceSession__c.SObjectType)
            .withSelectFields(fields);

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
