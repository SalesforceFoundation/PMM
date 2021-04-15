/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public class ContactRollup_Tarren_Part1 implements Database.Batchable<SObject>, Schedulable, Database.Stateful {
    public void execute(SchedulableContext context) {
        Database.executeBatch(new ContactRollup_Tarren_Part1());
    }

    public Database.Querylocator start(Database.BatchableContext bc) {
        String query = 'SELECT Id, NumAbsentServiceDeliveries__c, NumPresentServiceDeliveries__c FROM Contact WHERE NumAbsentServiceDeliveries__c != null OR NumPresentServiceDeliveries__c != null';

        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext bc, List<Contact> scope) {
        //Move to service class
        for (Contact con : scope) {
            con.NumAbsentServiceDeliveries__c = null;
            con.NumPresentServiceDeliveries__c = null;
        }
        update scope;
    }

    public void finish(Database.BatchableContext bc) {
        Database.executeBatch(new ContactRollup_Tarren_Part2(), 2000);
    }
}
