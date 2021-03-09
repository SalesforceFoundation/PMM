/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public class SessionRollupsSchedulable implements Database.Batchable<SObject>, Schedulable {
    @TestVisible
    private static AttendanceService attendanceService = new AttendanceService();

    public void execute(SchedulableContext context) {
        Database.executeBatch(new SessionRollupsSchedulable());
    }

    public Database.Querylocator start(Database.BatchableContext bc) {
        List<String> attendanceStatuses = attendanceService.getAttendanceStatuses();

        QueryBuilder query = new QueryBuilder();
        query.withSObjectType(ServiceSession__c.SObjectType);
        query.withSelectFields(
            new List<String>{
                String.valueOf(ServiceSession__c.NumPresentServiceDeliveries__c),
                String.valueOf(ServiceSession__c.NumAbsentServiceDeliveries__c)
            }
        );

        QueryBuilder subQuery = new QueryBuilder();
        subQuery.withChildRelationshipName('ServiceDeliveries__r');
        subquery.withSelectFields(
            new List<String>{
                String.valueOf(ServiceDelivery__c.ServiceSession__c),
                String.valueOf(ServiceDelivery__c.AttendanceStatus__c)
            }
        );
        // ServiceSession__c with any delivery records with attendance
        subQuery.addCondition(
            String.valueOf(ServiceDelivery__c.AttendanceStatus__c) +
            ' IN :attendanceStatuses'
        );

        query.addSubQuery(subQuery);

        // ServiceSession__c with any of our rollup fields populated
        // Note: Can't filter for this since we need to use subquery above since ORs aren't allowed in joins

        return Database.getQueryLocator(query.buildSoqlQuery());
    }

    public void execute(Database.BatchableContext bc, List<ServiceSession__c> scope) {
        attendanceService.doRollups(ServiceSession__c.SObjectType, scope);
    }

    public void finish(Database.BatchableContext bc) {
    }
}
