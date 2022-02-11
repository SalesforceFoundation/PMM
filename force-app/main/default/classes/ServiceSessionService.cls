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

    public Set<String> getServiceSessionStatusBuckets(String serviceSessionStatus) {
        List<String> bucketNames = new List<String>{ serviceSessionStatus };
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
