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
    private QueryBuilder queryBuilder = new QueryBuilder();
    @TestVisible
    private Set<Id> serviceIds = new Set<Id>();

    public void execute(SchedulableContext context) {
        Database.executeBatch(new ServiceRollupsSchedulable(), 2000);
    }

    public Database.Querylocator start(Database.BatchableContext bc) {
        String query = serviceWithRollupDataQuery();
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext bc, List<Service__c> services) {
        for (Service__c serviceRecord : services) {
            serviceIds.add(serviceRecord.Id);
        }
    }

    public void finish(Database.BatchableContext bc) {
        Database.executeBatch(
            new ServiceDeliveryRollupsBatch(
                Service__c.SObjectType,
                ServiceDelivery__c.Service__c,
                serviceIds
            ),
            2000
        );
    }

    private String serviceWithRollupDataQuery() {
        // Find services that have had previous rollups and send them to the service delivery
        // batch in order to null the field values when services no longer have rollup data.
        // For example: all service delivery records were reparented to a different service.
        // If the service has updated rollup values we expect the service delivery batch to update them.
        // When services do not have a change to rollup values we expect them not to be touched.
        queryBuilder.withSObjectType(Service__c.SObjectType)
            .withSelectFields(new List<String>{ String.valueOf(Service__c.Id) })
            .addCondition(
                String.valueOf(Service__c.NumPresentServiceDeliveries__c) +
                ' >= 0 OR ' +
                String.valueOf(Service__c.NumAbsentServiceDeliveries__c) +
                ' >= 0'
            );
        return queryBuilder.buildSoqlQuery();
    }
}
