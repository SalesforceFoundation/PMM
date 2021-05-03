/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */
public class ContactRollupsSchedulable implements Database.Batchable<SObject>, System.Schedulable, Database.Stateful {
    @TestVisible
    private QueryBuilder queryBuilder = new QueryBuilder();
    @TestVisible
    private Set<Id> contactIds = new Set<Id>();

    /*
     * Both the Schedulable and Batch jobs are within this class, the schedule
     * will call execute batch on a new Instance of this class
     */
    public void execute(SchedulableContext context) {
        Database.executeBatch(new ContactRollupsSchedulable(), 2000);
    }

    /*
     * Find all of the records that have had any rollups in the past
     */
    public Database.Querylocator start(Database.BatchableContext bc) {
        String query = contactWithRollupDataQuery();
        return Database.getQueryLocator(query);
    }

    /*
     * The batch job will iterate all of the records and only add them to the
     * set of Ids. Note that we need stateful in order to maintain all Ids across
     * each batch iteration.
     */
    public void execute(Database.BatchableContext bc, List<Contact> contacts) {
        for (Contact contactRecord : contacts) {
            contactIds.add(contactRecord.Id);
        }
    }

    /*
     * Once all of the record Ids have been added we will pass them off to the
     * Service Delivery Rollups Batch
     */
    public void finish(Database.BatchableContext bc) {
        Database.executeBatch(
            new ServiceDeliveryRollupsBatch(
                Contact.SObjectType,
                ServiceDelivery__c.Contact__c,
                contactIds
            ),
            2000
        );
    }

    private String contactWithRollupDataQuery() {
        queryBuilder.withSObjectType(Contact.SObjectType)
            .withSelectFields(new List<String>{ String.valueOf(Contact.Id) })
            .addCondition(
                String.valueOf(Contact.NumPresentServiceDeliveries__c) +
                ' >= 0 OR ' +
                String.valueOf(Contact.NumAbsentServiceDeliveries__c) +
                ' >= 0 OR ' +
                String.valueOf(Contact.LastServiceDate__c) +
                ' != null OR ' +
                String.valueOf(Contact.ConsecutiveAbsences__c) +
                ' >= 0 '
            );
        return queryBuilder.buildSoqlQuery();
    }
}
