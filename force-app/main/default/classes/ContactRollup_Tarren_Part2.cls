/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public class ContactRollup_Tarren_Part2 implements Database.Batchable<SObject>, Schedulable, Database.Stateful {
    public Map<String, Set<String>> buckets;
    public List<String> attendanceStatuses;
    public Set<String> presentStatuses;

    public Map<Id, Contact> contactMap;

    public void execute(SchedulableContext context) {
        System.debug('Calling Execute');
        Database.executeBatch(new ContactRollup_Tarren_Part2(), 2000);
    }

    public Database.Querylocator start(Database.BatchableContext bc) {
        //This should be in execute, but couldn't get it to work
        AttendanceSelector attendanceSelector = new AttendanceSelector();
        buckets = new Map<String, Set<String>>();
        presentStatuses = new Set<String>();

        for (Bucket__mdt bucket : attendanceSelector.getAttendanceBuckets()) {
            buckets.put(bucket.DeveloperName, new Set<String>());
            for (BucketedValue__mdt value : bucket.BucketedValues__r) {
                buckets.get(bucket.DeveloperName).add(value.Value__c);
            }
            if (bucket.DeveloperName == 'Present') {
                presentStatuses = buckets.get('Present');
            }
        }

        contactMap = new Map<Id, Contact>();
        //end

        AttendanceService attendanceService = new AttendanceService();
        attendanceStatuses = attendanceService.getAttendanceStatuses();
        String query = 'SELECT Contact__c, AttendanceStatus__c, DeliveryDate__c, Quantity__c FROM ServiceDelivery__c ';
        query += 'WHERE AttendanceStatus__c IN :attendanceStatuses AND Contact__c != null Order By Contact__c DESC';

        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext bc, List<ServiceDelivery__c> scope) {
        Set<Id> batchContactIds = new Set<Id>();
        for (ServiceDelivery__c del : scope) {
            //Add the contactId to the universe of ids for the batch, we'll need this at the end of the method
            batchContactIds.add(del.Contact__c);
            //Add the contact to the map, if it doesn't exist already
            if (!contactMap.containsKey(del.Contact__c)) {
                contactMap.put(
                    del.Contact__c,
                    new Contact(
                        Id = del.Contact__c,
                        NumAbsentServiceDeliveries__c = 0,
                        NumPresentServiceDeliveries__c = 0
                    )
                );
            }

            Contact thisContact = contactMap.get(del.Contact__c);
            //Since we are only getting mapped values, we assume present vs absent
            //So not in present by default means absent
            if (presentStatuses.contains(del.AttendanceStatus__c)) {
                thisContact.NumPresentServiceDeliveries__c += 1;
            } else {
                thisContact.NumAbsentServiceDeliveries__c += 1;
            }

            //Next, we're only querying mapped attendance status SDs
            List<Contact> contactsToUpdate = new List<Contact>();
            for (Contact con : contactMap.values()) {
                if (!batchContactIds.contains(con.Id)) {
                    contactsToUpdate.add(con);
                    contactMap.remove(con.Id);
                }
            }
            update contactsToUpdate;
        }

        //Step 1 : If there are Ids in the contactMap that are not in the scope, that means the contact is ready to update
        //         We should note those, and clear them from the map
    }

    public void finish(Database.BatchableContext bc) {
        //In the finish method, we simply need to save everyone that is left
        System.debug('Inside Finish');
        update contactMap.values();
    }
}
