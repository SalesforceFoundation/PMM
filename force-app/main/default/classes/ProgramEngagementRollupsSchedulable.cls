/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

//Stuff to do
//1. See if we can pass this universe of IDs to the next batch.
//2.

public class ProgramEngagementRollupsSchedulable implements Database.Batchable<SObject>, System.Schedulable, Database.Stateful {
    @TestVisible
    private QueryBuilder queryBuilder = new QueryBuilder();
    @TestVisible
    private Set<Id> programEngagementIds = new Set<Id>();

    // This kicks off this scheduable / batch class as the batch job
    // Leaving the default of 200 because the Service Delivery Batch
    // will need to find all child records and maintain the state of the
    // programEngagements.
    public void execute(SchedulableContext context) {
        Database.executeBatch(new ProgramEngagementRollupsSchedulable(), 2000);
    }

    // Find all of the programEngagements that have
    public Database.Querylocator start(Database.BatchableContext bc) {
        String query = engagementWithRollupDataQuery();
        return Database.getQueryLocator(query);
    }

    // The batch job will iterate all of the programEngagements and only add them to the
    // set of Ids. Note that we need stateful in order to maintain all Ids across
    // each batch iteration.
    public void execute(
        Database.BatchableContext bc,
        List<ProgramEngagement__c> programEngagements
    ) {
        for (ProgramEngagement__c programEngagementRecord : programEngagements) {
            programEngagementIds.add(programEngagementRecord.Id);
        }
    }

    // Once all of the programEngagement Ids have been added we will pass them off to the next batch
    public void finish(Database.BatchableContext bc) {
        Database.executeBatch(
            new ServiceDeliveryRollupsBatch(
                ProgramEngagement__c.SObjectType,
                ServiceDelivery__c.ProgramEngagement__c,
                programEngagementIds
            ),
            2000
        );
    }

    private String engagementWithRollupDataQuery() {
        // Find programEngagements that have had previous rollups and send them to the service delivery
        // batch in order to null the field values when programEngagements no longer have rollup data.
        // For example: all service delivery records were reparented to a different programEngagement.
        // If the programEngagement has updated rollup values we expect the service delivery batch to update them.
        // When programEngagements do not have a change to rollup values we expect them not to be touched.
        queryBuilder.withSObjectType(ProgramEngagement__c.SObjectType)
            .withSelectFields(new List<String>{ String.valueOf(ProgramEngagement__c.Id) })
            .addCondition(
                String.valueOf(ProgramEngagement__c.NumPresentServiceDeliveries__c) +
                ' >= 0 OR ' +
                String.valueOf(ProgramEngagement__c.NumAbsentServiceDeliveries__c) +
                ' >= 0 OR ' +
                String.valueOf(ProgramEngagement__c.LastServiceDate__c) +
                ' != null OR ' +
                String.valueOf(ProgramEngagement__c.ConsecutiveAbsences__c) +
                ' >= 0 '
            );
        return queryBuilder.buildSoqlQuery();
    }
}
