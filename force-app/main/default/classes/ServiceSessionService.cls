/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ServiceSessionService {
    @TestVisible
    private ServiceSessionSelector serviceSessionSelector = new ServiceSessionSelector();

    @TestVisible
    private FieldBucketSelector bucketSelector = new FieldBucketSelector();

    @TestVisible
    private SystemAccess systemAccess = new SystemAccess();

    private static final String COMPLETE_BUCKET = 'ServiceSessionStatusComplete';
    private static final String PENDING_BUCKET = 'ServiceSessionStatusPending';

    public Map<String, List<ServiceSession__c>> getServiceSessionsByStartDate(
        String dateLiteral
    ) {
        Map<String, List<ServiceSession__c>> serviceSessions = new Map<String, List<ServiceSession__c>>();

        for (
            ServiceSession__c session : serviceSessionSelector.getServiceSessionsByStartDate(
                dateLiteral
            )
        ) {
            List<ServiceSession__c> sessions = new List<ServiceSession__c>();
            String sessionStartDate = session.SessionStart__c.format('EEEE, dd MMMM');

            if (serviceSessions.get(sessionStartDate) == null) {
                serviceSessions.put(sessionStartDate, new List<ServiceSession__c>());
            }

            if (serviceSessions.get(sessionStartDate) != null) {
                if (serviceSessions.containsKey(sessionStartDate)) {
                    sessions.add(session);
                    serviceSessions.get(sessionStartDate).addAll(sessions);
                }
            }
        }

        return serviceSessions;
    }

    public Map<String, List<String>> getServiceSessionStatusBuckets() {
        List<String> bucketNames = new List<String>{ COMPLETE_BUCKET, PENDING_BUCKET };
        Map<String, List<String>> buckets = new Map<String, List<String>>();

        Schema.SObjectType serviceSessionSObjType = ServiceSession__c.SObjectType;
        Schema.SObjectField bucketedField = ServiceSession__c.Status__c;

        for (
            Bucket__mdt bucket : bucketSelector.getBuckets(
                bucketNames,
                serviceSessionSObjType,
                bucketedField
            )
        ) {
            buckets.put(bucket.DeveloperName, new List<String>());
            for (BucketedValue__mdt value : bucket.BucketedValues__r) {
                buckets.get(bucket.DeveloperName).add(value.Value__c);
            }
        }

        return buckets;
    }

    public void updateOmittedContactIds(Id sessionId, String omittedContactIds) {
        // We are using system access here to update the system field without permission checks
        systemAccess.updateRecords(
            new List<SObject>{
                new ServiceSession__c(
                    Id = sessionId,
                    OmittedContactIds__c = omittedContactIds
                )
            }
        );
    }
}
