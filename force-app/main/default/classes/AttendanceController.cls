/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class AttendanceController {
    @TestVisible
    private static ServiceDeliveryService service = new ServiceDeliveryService();

    @AuraEnabled(cacheable=true)
    public static List<ServiceDelivery__c> generateRoster(Id sessionId) {
        try {
            return service.generateRoster(sessionId);
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }

    @AuraEnabled
    public static void upsertServiceDeliveries(
        List<ServiceDelivery__c> serviceDeliveriesToUpsert
    ) {
        try {
            service.upsertServiceDeliveries(serviceDeliveriesToUpsert);
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }

    @AuraEnabled(cacheable=true)
    public static Map<String, Boolean> checkFieldPermissions() {
        try {
            return service.checkFieldPermissions();
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }
}
