/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */
public class ProgramEngagementRollupsSchedulable implements Database.Batchable<SObject>, System.Schedulable, Database.Stateful {
    @TestVisible
    private QueryBuilder queryBuilder = new QueryBuilder();
    @TestVisible
    private ServiceDeliveryRollupsService rollupsService = new ServiceDeliveryRollupsService();

    /*
     * Both the Schedulable and Batch jobs are within this class, the schedule
     * will call execute batch on a new Instance of this class
     */
    public void execute(SchedulableContext context) {
        Database.executeBatch(new ProgramEngagementRollupsSchedulable(), 2000);
    }

    /*
     * Find all of the records that have had any rollups in the past
     */
    public Database.Querylocator start(Database.BatchableContext bc) {
        String query = engagementWithRollupDataQuery();
        return Database.getQueryLocator(query);
    }

    /*
     * The batch job will iterate all of the records and only add them to the
     * set of Ids if they do not have related service deliveries. Note that we
     * need stateful in order to maintain all Ids across each batch iteration.
     */
    public void execute(
        Database.BatchableContext bc,
        List<ProgramEngagement__c> programEngagements
    ) {
        rollupsService.resetParentsWithoutDeliveries(programEngagements);
    }

    /*
     * Once all of the records that no longer have service delivery records
     * have been reset we kick off the batch job to rollup all service delivery
     * records for this sObjectType
     */
    public void finish(Database.BatchableContext bc) {
        Database.executeBatch(
            new ServiceDeliveryRollupsBatch(ProgramEngagement__c.SObjectType),
            2000
        );
    }

    private String engagementWithRollupDataQuery() {
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
