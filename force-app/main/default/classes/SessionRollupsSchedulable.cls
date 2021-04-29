/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public class SessionRollupsSchedulable implements Database.Batchable<SObject>, Schedulable {
    @TestVisible
    private QueryBuilder queryBuilder = new QueryBuilder();
    @TestVisible
    private Set<Id> sessionIds = new Set<Id>();

    public void execute(SchedulableContext context) {
        Database.executeBatch(new SessionRollupsSchedulable(), 2000);
    }

    public Database.Querylocator start(Database.BatchableContext bc) {
        String query = sessionWithRollupDataQuery();
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext bc, List<ServiceSession__c> sessions) {
        for (ServiceSession__c sessionRecord : sessions) {
            sessionIds.add(sessionRecord.Id);
        }
    }

    public void finish(Database.BatchableContext bc) {
        Database.executeBatch(
            new ServiceDeliveryRollups(
                ServiceSession__c.SObjectType,
                ServiceDelivery__c.ServiceSession__c,
                sessionIds
            ),
            2000
        );
    }

    private String sessionWithRollupDataQuery() {
        // Find sessions that have had previous rollups and send them to the session delivery
        // batch in order to null the field values when sessions no longer have rollup data.
        // For example: all session delivery records were reparented to a different session.
        // If the session has updated rollup values we expect the session delivery batch to update them.
        // When sessions do not have a change to rollup values we expect them not to be touched.
        queryBuilder.withSObjectType(ServiceSession__c.SObjectType)
            .withSelectFields(new List<String>{ String.valueOf(ServiceSession__c.Id) })
            .addCondition(
                String.valueOf(ServiceSession__c.NumPresentServiceDeliveries__c) +
                ' >= 0 OR ' +
                String.valueOf(ServiceSession__c.NumAbsentServiceDeliveries__c) +
                ' >= 0'
            );
        return queryBuilder.buildSoqlQuery();
    }
}
