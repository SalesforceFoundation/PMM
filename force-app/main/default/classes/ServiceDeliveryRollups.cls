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
    private Rollups rollups;
    private Set<Id> unprocessedIds;
    private SObjectField lookupField;

    public ServiceDeliveryRollups(
        SObjectType sObjectType,
        SObjectField lookupField,
        Set<Id> unprocessedIds
    ) {
        this.lookupField = lookupField;
        this.unprocessedIds = unprocessedIds;
        this.rollups = new Rollups(sObjectType, lookupField);
    }

    public Database.Querylocator start(Database.BatchableContext bc) {
        String query = deliveryService.getDeliveryRollupsQuery(
            String.valueOf(lookupField)
        );
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext bc, List<ServiceDelivery__c> scope) {
        Set<Id> idsInCurrentScope = rollups.rollupDeliveryRecords(scope);
        Set<Id> idsToUpdate = new Set<Id>();

        for (Id rollupId : rollups.getRollupRecordIds()) {
            if (!idsInCurrentScope.contains(rollupId)) {
                idsToUpdate.add(rollupId);
                unprocessedIds.remove(rollupId);
            }
        }
        rollups.commitRollups(idsToUpdate);
    }

    public void finish(Database.BatchableContext bc) {
        unprocessedIds.removeAll(rollups.getRollupRecordIds());
        rollups.commitRollups();
        rollups.resetRollupFields(unprocessedIds);
    }
}
