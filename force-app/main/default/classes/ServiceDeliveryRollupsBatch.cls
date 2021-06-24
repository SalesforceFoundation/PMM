/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public class ServiceDeliveryRollupsBatch implements Database.Batchable<SObject>, Database.Stateful {
    private ServiceDeliveryRollupsService rollupsService = new ServiceDeliveryRollupsService();
    SObjectType sObjectType;

    public ServiceDeliveryRollupsBatch(SObjectType sObjectType) {
        this.sObjectType = sObjectType;
    }

    public Database.Querylocator start(Database.BatchableContext bc) {
        String query = rollupsService.getDeliveryRollupsQuery(sObjectType);

        return Database.getQueryLocator(query);
    }

    public void execute(
        Database.BatchableContext bc,
        List<ServiceDelivery__c> deliveries
    ) {
        rollupsService.rollupDeliveryRecords(sObjectType, deliveries);
        rollupsService.commitRollups(sObjectType);
    }

    public void finish(Database.BatchableContext bc) {
    }
}
