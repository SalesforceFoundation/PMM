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

public class ContactRollupsSchedulable implements Database.Batchable<SObject>, System.Schedulable, Database.Stateful {
    @TestVisible
    private SystemAccess systemAccess = new SystemAccess();
    @TestVisible
    private QueryBuilder queryBuilder = new QueryBuilder();
    @TestVisible
    private Set<Id> contactIds = new Set<Id>();

    // This kicks off this scheduable / batch class as the batch job
    // Leaving the default of 200 because the Service Delivery Batch
    // will need to find all child records and maintain the state of the
    // contacts.
    public void execute(SchedulableContext context) {
        Database.executeBatch(new ContactRollupsSchedulable());
    }

    // Find all of the contacts that have
    public Database.Querylocator start(Database.BatchableContext bc) {
        String query = contactWithRollupDataQuery();
        return Database.getQueryLocator(query);
    }

    // The batch job will iterate all of the contacts and only add them to the
    // set of Ids. Note that we need stateful in order to maintain all Ids across
    // each batch iteration.
    public void execute(Database.BatchableContext bc, List<Contact> contacts) {
        for (Contact contactRecord : contacts) {
            contactIds.add(contactRecord.Id);
        }
    }

    // Once all of the contact Ids have been added we will pass them off to the next batch
    public void finish(Database.BatchableContext bc) {
        if (contactIds.isEmpty()) {
            return;
        }

        Database.executeBatch(new ServiceDeliveryRollups(contactIds), 2000);
    }

    private String contactWithRollupDataQuery() {
        // TODO: figure out this criteria because if the contact doesn't have rollups to begin with
        // they will not be processed
        queryBuilder.withSObjectType(Contact.SObjectType)
            .withSelectFields(new List<String>{ String.valueOf(Contact.Id) });
        return queryBuilder.buildSoqlQuery();
    }
}
