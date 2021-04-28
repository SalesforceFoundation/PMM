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
    private static ServiceDeliveryService deliveryService = new ServiceDeliveryService();

    public void execute(SchedulableContext context) {
        Database.executeBatch(new ServiceRollupsSchedulable());
    }

    public Database.Querylocator start(Database.BatchableContext bc) {
        List<String> attendanceStatuses = deliveryService.attendanceStatuses;

        QueryBuilder query = new QueryBuilder();
        query.withSObjectType(Service__c.SObjectType);
        query.withSelectFields(
            new List<String>{
                String.valueOf(Service__c.NumPresentServiceDeliveries__c),
                String.valueOf(Service__c.NumAbsentServiceDeliveries__c)
            }
        );

        QueryBuilder subQuery = new QueryBuilder();
        subQuery.withChildRelationshipName('ServiceDeliveries__r');
        subquery.withSelectFields(
            new List<String>{
                String.valueOf(ServiceDelivery__c.Service__c),
                String.valueOf(ServiceDelivery__c.AttendanceStatus__c)
            }
        );
        // Service__c with any delivery records with attendance
        subQuery.addCondition(
            String.valueOf(ServiceDelivery__c.AttendanceStatus__c) +
            ' IN :attendanceStatuses'
        );

        query.addSubQuery(subQuery);

        // // Service__c with any of our rollup fields populated
        // // Note: Can't filter for this since we need to use subquery above since ORs aren't allowed in joins

        return Database.getQueryLocator(query.buildSoqlQuery());
    }

    public void execute(Database.BatchableContext bc, List<Service__c> scope) {
        // deliveryService.doRollups(Service__c.SObjectType, scope);
    }

    public void finish(Database.BatchableContext bc) {
    }
}
