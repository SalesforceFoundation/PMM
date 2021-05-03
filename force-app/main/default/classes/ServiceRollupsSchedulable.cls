/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */
public class ServiceRollupsSchedulable implements Database.Batchable<SObject>, Schedulable {
    @TestVisible
    private QueryBuilder queryBuilder = new QueryBuilder();
    @TestVisible
    private Set<Id> serviceIds = new Set<Id>();

    /*
     * Both the Schedulable and Batch jobs are within this class, the schedule
     * will call execute batch on a new Instance of this class
     */
    public void execute(SchedulableContext context) {
        Database.executeBatch(new ServiceRollupsSchedulable(), 2000);
    }

    /*
     * Find all of the records that have had any rollups in the past
     */
    public Database.Querylocator start(Database.BatchableContext bc) {
        String query = serviceWithRollupDataQuery();
        return Database.getQueryLocator(query);
    }

    /*
     * The batch job will iterate all of the records and only add them to the
     * set of Ids. Note that we need stateful in order to maintain all Ids across
     * each batch iteration.
     */
    public void execute(Database.BatchableContext bc, List<Service__c> services) {
        for (Service__c serviceRecord : services) {
            serviceIds.add(serviceRecord.Id);
        }
    }

    /*
     * Once all of the record Ids have been added we will pass them off to the
     * Service Delivery Rollups Batch
     */
    public void finish(Database.BatchableContext bc) {
        Database.executeBatch(
            new ServiceDeliveryRollupsBatch(
                Service__c.SObjectType,
                ServiceDelivery__c.Service__c,
                serviceIds
            ),
            2000
        );
    }

    private String serviceWithRollupDataQuery() {
        queryBuilder.withSObjectType(Service__c.SObjectType)
            .withSelectFields(new List<String>{ String.valueOf(Service__c.Id) })
            .addCondition(
                String.valueOf(Service__c.NumPresentServiceDeliveries__c) +
                ' >= 0 OR ' +
                String.valueOf(Service__c.NumAbsentServiceDeliveries__c) +
                ' >= 0'
            );
        return queryBuilder.buildSoqlQuery();
    }
}
