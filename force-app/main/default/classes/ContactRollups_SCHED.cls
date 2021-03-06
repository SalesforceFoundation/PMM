/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public class ContactRollups_SCHED implements Database.Batchable<SObject>, Schedulable {
    @TestVisible
    private static AttendanceService attendanceService = new AttendanceService();

    @TestVisible
    private final static Integer DEFAULT_BATCH_SIZE = 10;

    @TestVisible
    private Integer batchSize {
        get {
            // Allowing for future customization of batch size.
            return DEFAULT_BATCH_SIZE;
        }
        set;
    }

    public void execute(SchedulableContext context) {
        Database.executeBatch(new ContactRollups_SCHED(), batchSize);
    }

    public Database.Querylocator start(Database.BatchableContext bc) {
        List<String> attendanceStatuses = attendanceService.getAttendanceStatuses();

        QueryBuilder query = new QueryBuilder();
        query.withSObjectType(Contact.SObjectType);
        query.withSelectFields(
            new List<String>{
                String.valueOf(Contact.NumPresentServiceDeliveries__c),
                String.valueOf(Contact.NumAbsentServiceDeliveries__c),
                String.valueOf(Contact.ConsecutiveAbsences__c),
                String.valueOf(Contact.LastServiceDate__c)
            }
        );

        QueryBuilder subQuery = new QueryBuilder();
        subQuery.withChildRelationshipName('Service_Deliveries__r');
        subquery.withSelectFields(
            new List<String>{
                String.valueOf(ServiceDelivery__c.Contact__c),
                String.valueOf(ServiceDelivery__c.AttendanceStatus__c),
                String.valueOf(ServiceDelivery__c.DeliveryDate__c),
                String.valueOf(ServiceDelivery__c.Quantity__c)
            }
        );
        // Contact with any delivery records with attendance
        // Contact with any delivery records with delivery date and qty
        subQuery.addCondition(
            String.valueOf(ServiceDelivery__c.AttendanceStatus__c) +
            ' IN :attendanceStatuses OR (' +
            String.valueOf(ServiceDelivery__c.DeliveryDate__c) +
            ' <= TODAY AND ' +
            String.valueOf(ServiceDelivery__c.Quantity__c) +
            ' > 0) '
        );

        query.addSubQuery(subQuery);

        // Contact with any of our rollup fields populated
        // Note: Can't filter for this since we need to use subquery above since ORs aren't allowed in joins

        return Database.getQueryLocator(query.buildSoqlQuery());
    }

    public void execute(Database.BatchableContext bc, List<Contact> scope) {
        attendanceService.doRollups(scope);
    }

    public void finish(Database.BatchableContext bc) {
    }
}
