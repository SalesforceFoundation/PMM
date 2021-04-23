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

public class ContactRollupsSchedulable implements Database.Batchable<SObject>, Schedulable, Database.Stateful {
    @TestVisible
    private SystemAccess systemAccess = new SystemAccess();

    @TestVisible
    private Set<Id> contactIds = new Set<Id>();

    public void execute(SchedulableContext context) {
        Database.executeBatch(new ContactRollupsSchedulable());
    }

    public Database.Querylocator start(Database.BatchableContext bc) {
        QueryBuilder query = constructQuery();
        return Database.getQueryLocator(query.buildSoqlQuery());
    }

    public void execute(Database.BatchableContext bc, List<Contact> scope) {
        handleExecute(scope);
    }

    public void finish(Database.BatchableContext bc) {
        Database.executeBatch(new ContactRollupsBatchCalc(contactIds), 2000);
    }

    private QueryBuilder constructQuery() {
        QueryBuilder query = new QueryBuilder();
        query.withSObjectType(Contact.SObjectType);
        query.withSelectFields(new List<String>{ String.valueOf(Contact.Id) });
        query.addCondition(
            String.valueOf(Contact.NumPresentServiceDeliveries__c) +
            ' != null OR ' +
            String.valueOf(Contact.NumAbsentServiceDeliveries__c) +
            ' != null OR ' +
            String.valueOf(Contact.LastServiceDate__c) +
            ' != null OR ' +
            String.valueOf(Contact.ConsecutiveAbsences__c) +
            ' != null '
        );
        return query;
    }

    private void handleExecute(List<Contact> contacts) {
        for (Contact con : contacts) {
            contactIds.add(con.Id);
            // con.NumAbsentServiceDeliveries__c = null;
            // con.NumPresentServiceDeliveries__c = null;
            // con.LastServiceDate__c = null;
            // con.ConsecutiveAbsences__c = null;
        }
        //systemAccess.updateRecords(contacts);
    }
}
