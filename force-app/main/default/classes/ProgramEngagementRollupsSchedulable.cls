/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public class ProgramEngagementRollupsSchedulable implements Database.Batchable<SObject>, Schedulable {
    @TestVisible
    private static AttendanceService attendanceService = new AttendanceService();

    public void execute(SchedulableContext context) {
        Database.executeBatch(new ProgramEngagementRollupsSchedulable());
    }

    public Database.Querylocator start(Database.BatchableContext bc) {
        List<String> attendanceStatuses = attendanceService.getAttendanceStatuses();

        QueryBuilder query = new QueryBuilder();
        query.withSObjectType(ProgramEngagement__c.SObjectType);
        query.withSelectFields(
            new List<String>{
                String.valueOf(ProgramEngagement__c.NumPresentServiceDeliveries__c),
                String.valueOf(ProgramEngagement__c.NumAbsentServiceDeliveries__c),
                String.valueOf(ProgramEngagement__c.ConsecutiveAbsences__c),
                String.valueOf(ProgramEngagement__c.LastServiceDate__c)
            }
        );

        QueryBuilder subQuery = new QueryBuilder();
        subQuery.withChildRelationshipName('ServiceDeliveries__r');
        subquery.withSelectFields(
            new List<String>{
                String.valueOf(ServiceDelivery__c.ProgramEngagement__c),
                String.valueOf(ServiceDelivery__c.AttendanceStatus__c),
                String.valueOf(ServiceDelivery__c.DeliveryDate__c),
                String.valueOf(ServiceDelivery__c.Quantity__c)
            }
        );
        // ProgramEngagement__c with any delivery records with attendance
        // ProgramEngagement__c with any delivery records with delivery date and qty
        subQuery.addCondition(
            String.valueOf(ServiceDelivery__c.AttendanceStatus__c) +
            ' IN :attendanceStatuses OR (' +
            String.valueOf(ServiceDelivery__c.DeliveryDate__c) +
            ' <= TODAY AND ' +
            String.valueOf(ServiceDelivery__c.Quantity__c) +
            ' > 0) '
        );

        query.addSubQuery(subQuery);

        // ProgramEngagement__c with any of our rollup fields populated
        // Note: Can't filter for this since we need to use subquery above since ORs aren't allowed in joins

        return Database.getQueryLocator(query.buildSoqlQuery());
    }

    public void execute(Database.BatchableContext bc, List<ProgramEngagement__c> scope) {
        attendanceService.doRollups(ProgramEngagement__c.SObjectType, scope);
    }

    public void finish(Database.BatchableContext bc) {
    }
}
