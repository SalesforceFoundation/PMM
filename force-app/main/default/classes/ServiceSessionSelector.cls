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
    private static final String COMPLETE_BUCKET = 'ServiceSessionStatusComplete';
    private static final String PENDING_BUCKET = 'ServiceSessionStatusPending';

    @TestVisible
    private FieldBucketSelector bucketSelector = new FieldBucketSelector();

    public List<ServiceSession__c> getFutureServiceSessionsForServiceSchedule(
        Id serviceScheduleId
    ) {
        List<ServiceSession__c> serviceSessions = new List<ServiceSession__c>();

        if (!Schema.SObjectType.ServiceSession__c.isAccessible()) {
            return serviceSessions;
        }

        serviceSessions = [
            SELECT Id, Name, Status__c, SessionStart__c, SessionEnd__c, ServiceSchedule__c
            FROM ServiceSession__c
            WHERE ServiceSchedule__c = :serviceScheduleId AND SessionStart__c > TODAY
            ORDER BY SessionStart__c
        ];

        return Security.stripInaccessible(AccessType.READABLE, serviceSessions)
            .getRecords();
    }

    public List<ServiceSession__c> getServiceSessionsByStartDate(String dateLiteral) {
        List<ServiceSession__c> allSessions = new List<ServiceSession__c>();
        Set<String> allowedSessionStatuses = getAllowedServiceSessionStatusValues();

        if (!Schema.SObjectType.ServiceSession__c.isAccessible()) {
            return new List<ServiceSession__c>();
        }

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

        queryBuilder.withOrderBy(String.valueOf(ServiceSession__c.SessionStart__c));

        allSessions = Database.query(queryBuilder.buildSoqlQuery());

        return Security.stripInaccessible(AccessType.READABLE, allSessions).getRecords();
    }

    public Set<String> getAllowedServiceSessionStatusValues() {
        List<String> bucketNames = new List<String>{ PENDING_BUCKET, COMPLETE_BUCKET };
        Set<String> statuses = new Set<String>();

        Schema.SObjectType serviceSessionSObjType = ServiceSession__c.SObjectType;
        Schema.SObjectField serviceSessionStatusField = ServiceSession__c.Status__c;

        for (
            Bucket__mdt bucket : bucketSelector.getBuckets(
                bucketNames,
                serviceSessionSObjType,
                serviceSessionStatusField
            )
        ) {
            for (BucketedValue__mdt value : bucket.BucketedValues__r) {
                statuses.add(value.Value__c);
            }
        }

        return statuses;
    }
}
