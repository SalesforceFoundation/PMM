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

        Database.executeBatch(
            new ServiceDeliveryRollups(
                Contact.SObjectType,
                ServiceDelivery__c.Contact__c,
                contactIds
            ),
            2000
        );
    }

    private String contactWithRollupDataQuery() {
        // Find contacts that have had previous rollups and send them to the service delivery
        // batch in order to null the field values when contacts no longer have rollup data.
        // For example: all service delivery records were reparented to a different contact.
        // If the contact has updated rollup values we expect the service delivery batch to update them.
        // When contacts do not have a change to rollup values we expect them not to be touched.
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
