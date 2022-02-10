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
    public static ServiceDeliveryService.Roster generateRoster(
        Id sessionId,
        String omittedServiceParticipantStatuses,
        String omittedProgramEngagementRoles,
        String omittedProgramEngagementStages
    ) {
        System.debug(' ***** [AC] ' + omittedServiceParticipantStatuses);
        System.debug(' ***** [AC] ' + omittedProgramEngagementRoles);
        System.debug(' ***** [AC] ' + omittedProgramEngagementStages);

        try {
            ServiceDeliveryService.Filters filters = null;

            filters = new ServiceDeliveryService.Filters(
                omittedServiceParticipantStatuses,
                omittedProgramEngagementRoles,
                omittedProgramEngagementStages
            );

            return service.generateRoster(sessionId, filters);
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
