/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public class ServiceDeliveryRollups implements Database.Batchable<SObject>, Database.Stateful {
    @TestVisible
    private ServiceDeliveryService deliveryService = new ServiceDeliveryService();
    Rollups rollups;

    public ServiceDeliveryRollups(
        SObjectType sObjectType,
        SObjectField lookupField,
        Set<Id> unprocessedIds
    ) {
        this.rollups = new Rollups(sObjectType, lookupField, unprocessedIds);
    }

    public Database.Querylocator start(Database.BatchableContext bc) {
        String query = rollups.buildDeliveryRollupsQuery();
        List<String> attendanceStatuses = rollups.attendanceStatuses;
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext bc, List<ServiceDelivery__c> scope) {
        rollups.rollupDeliveryRecords(scope);
    }

    public void finish(Database.BatchableContext bc) {
        rollups.commitFinalRecords();
        rollups.resetUnprocessedRecords();
    }
}
