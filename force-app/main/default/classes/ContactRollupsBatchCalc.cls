/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public class ContactRollupsBatchCalc implements Database.Batchable<SObject>, Database.Stateful {
    public ContactRollupsBatchCalc(Set<Id> contactIds) {
        this.contactIds = contactIds;
    }

    @TestVisible
    private Set<Id> contactIds;
    @TestVisible
    private List<String> attendanceStatuses;
    @TestVisible
    private Set<String> presentStatuses;
    @TestVisible
    private Set<String> absentStatuses;
    @TestVisible
    private Map<Id, Contact> contactMap = new Map<Id, Contact>();
    @TestVisible
    private AttendanceSelector attendanceSelector = new AttendanceSelector();
    @TestVisible
    private AttendanceService attendanceService = new AttendanceService();
    @TestVisible
    private SystemAccess systemAccess = new SystemAccess();

    public Database.Querylocator start(Database.BatchableContext bc) {
        presentStatuses = new Set<String>(attendanceService.presentStatuses);
        absentStatuses = new Set<String>(attendanceService.absentStatuses);
        attendanceStatuses = attendanceService.getAttendanceStatuses();

        QueryBuilder query = constructQuery();

        return Database.getQueryLocator(query.buildSoqlQuery());
    }

    public void execute(Database.BatchableContext bc, List<ServiceDelivery__c> scope) {
        processBatch(scope);
    }

    public void finish(Database.BatchableContext bc) {
        //Update the Contacts processed by the last batch
        checkUpdateStatus(contactMap);

        //Remove ids processed in the last batch
        contactIds.removeAll(contactMap.keySet());

        //What remains in contactIds are contacts that need to be reset
        List<Contact> contactsToReset = new List<Contact>();
        for (Id contactId : contactIds) {
            contactsToReset.add(constructNewContact(contactId));
        }
        update contactsToReset;
    }

    private Contact constructNewContact(Id contactId) {
        return new Contact(
            Id = contactId,
            NumAbsentServiceDeliveries__c = 0,
            NumPresentServiceDeliveries__c = 0,
            LastServiceDate__c = null,
            ConsecutiveAbsences__c = 0
        );
    }

    private QueryBuilder constructQuery() {
        QueryBuilder query = new QueryBuilder();
        query.withSObjectType(ServiceDelivery__c.SObjectType);
        query.withSelectFields(
            new List<String>{
                String.valueOf(ServiceDelivery__c.AttendanceStatus__c),
                String.valueOf(ServiceDelivery__c.DeliveryDate__c),
                String.valueOf(ServiceDelivery__c.Contact__c),
                String.valueOf(ServiceDelivery__c.Quantity__c)
            }
        );
        query.addCondition(
            '( ' +
            String.valueOf(ServiceDelivery__c.AttendanceStatus__c) +
            ' IN :attendanceStatuses OR ( ' +
            String.valueOF(ServiceDelivery__c.Quantity__c) +
            ' > 0 AND ' +
            String.valueOf(ServiceDelivery__c.DeliveryDate__c) +
            ' != null )) AND ' +
            String.valueOf(ServiceDelivery__c.Contact__c) +
            ' != null '
        );

        query.withOrderBy(
            String.valueOf(ServiceDelivery__c.Contact__c) +
            ', ' +
            String.valueOf(ServiceDelivery__c.DeliveryDate__c) +
            ' ASC '
        );
        return query;
    }

    //Here we update the contact based on information from the delivery in the iteration
    private Contact processContact(ServiceDelivery__c delivery, Contact thisContact) {
        if (presentStatuses.contains(delivery.AttendanceStatus__c)) {
            thisContact.NumPresentServiceDeliveries__c += 1;
            thisContact.ConsecutiveAbsences__c = 0;
        } else if (absentStatuses.contains(delivery.AttendanceStatus__c)) {
            thisContact.NumAbsentServiceDeliveries__c += 1;
            thisContact.ConsecutiveAbsences__c += 1;
        }
        //Last Service Date
        if (
            (delivery.Quantity__c > 0 && delivery.DeliveryDate__c != null) &&
            (thisContact.LastServiceDate__c == null ||
            delivery.DeliveryDate__c > thisContact.LastServiceDate__c)
        ) {
            thisContact.LastServiceDate__c = delivery.DeliveryDate__c;
        }
        return thisContact;
    }

    //Here we iterate the deliveries that are a part of the batch
    private void processBatch(List<ServiceDelivery__c> deliveries) {
        Set<Id> batchContactIds = new Set<Id>();
        for (ServiceDelivery__c del : deliveries) {
            //Add the contactId to the universe of ids for the batch, we'll need this at the end of the method
            batchContactIds.add(del.Contact__c);
            //Add the contact to the map, if it doesn't exist already
            if (!contactMap.containsKey(del.Contact__c)) {
                contactMap.put(del.Contact__c, constructNewContact(del.Contact__c));
            }

            //Update contact attributes based on current ServiceDelivery__c
            Contact thisContact = contactMap.get(del.Contact__c);
            thisContact = processContact(del, thisContact);
        }
        handleContactUpdates(batchContactIds);
    }

    //Here we find out which contacts have been fully processed and update them
    //If they are no longer in the batch, they are ready to be updated
    private void handleContactUpdates(Set<Id> batchContactIds) {
        List<Contact> contactsToUpdate = new List<Contact>();
        Map<Id, Contact> contactsToUpdateMap = new Map<Id, Contact>();
        for (Contact con : contactMap.values()) {
            if (!batchContactIds.contains(con.Id)) {
                contactsToUpdate.add(con);
                contactsToUpdateMap.put(con.Id, con);
                contactMap.remove(con.Id);
                contactIds.remove(con.Id);
            }
        }
        checkUpdateStatus(contactsToUpdateMap);
    }

    //New method that checks if records need to be updated
    private void checkUpdateStatus(Map<Id, Contact> contacts) {
        List<Contact> contactsToUpdate = new List<Contact>();
        for (Contact con : [
            SELECT
                NumPresentServiceDeliveries__c,
                NumAbsentServiceDeliveries__c,
                LastServiceDate__c,
                ConsecutiveAbsences__c
            FROM Contact
            WHERE Id IN :contacts.keySet()
        ]) {
            Boolean updateContact = false;
            Contact mappedContact = contacts.get(con.Id);

            if (
                con.NumPresentServiceDeliveries__c !=
                mappedContact.NumPresentServiceDeliveries__c
            ) {
                updateContact = true;
            }
            if (
                con.NumAbsentServiceDeliveries__c !=
                mappedContact.NumAbsentServiceDeliveries__c
            ) {
                updateContact = true;
            }
            if (con.LastServiceDate__c != mappedContact.LastServiceDate__c) {
                updateContact = true;
            }
            if (con.ConsecutiveAbsences__c != mappedContact.ConsecutiveAbsences__c) {
                updateContact = true;
            }

            if (updateContact) {
                contactsToUpdate.add(mappedContact);
            }
        }
        systemAccess.updateRecords(contactsToUpdate);
    }
}
