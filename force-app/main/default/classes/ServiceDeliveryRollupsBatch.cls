/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public class ServiceDeliveryRollupsBatch implements Database.Batchable<SObject>, Database.Stateful {
    private ServiceDeliveryRollupsService rollupsService;
    private SObjectField lookupField;

    public ServiceDeliveryRollupsBatch(
        SObjectType sObjectType,
        SObjectField lookupField
    ) {
        this.lookupField = lookupField;
        this.rollupsService = new ServiceDeliveryRollupsService(sObjectType, lookupField);
    }

    public Database.Querylocator start(Database.BatchableContext bc) {
        String query = rollupsService.getDeliveryRollupsQuery();

        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext bc, List<ServiceDelivery__c> scope) {
        rollupsService.rollupDeliveryRecords(scope);
        rollupsService.commitRollups();
    }

    public void finish(Database.BatchableContext bc) {
    }
}
