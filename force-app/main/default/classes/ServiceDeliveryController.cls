/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ServiceDeliveryController {
    public static ServiceService service = new ServiceService();
    @TestVisible
    private static ServiceDeliverySelector deliverySelector = new ServiceDeliverySelector();

    @AuraEnabled
    public static Integer getNumberOfServiceDeliveriesForSession(Id sessionId) {
        try {
            return deliverySelector.getNumberOfServiceDeliveriesForSession(sessionId);
        } catch (Exception e) {
            throw Util.getAuraHandledException(e);
        }
    }
    //removed cacheable = true so the picklist values will be rendered when
    //a new program engagement record is created
    @AuraEnabled
    public static Map<String, List<Object>> getServicesAndEngagements(Id contactId) {
        try {
            return service.getServicesEngagementsByContactId(contactId);
        } catch (Exception e) {
            throw Util.getAuraHandledException(e);
        }
    }

    @AuraEnabled
    public static List<Object> getServicesByProgramEngagementId(Id programEngagementId) {
        try {
            return service.getServicesByProgramEngagementId(programEngagementId);
        } catch (Exception e) {
            throw Util.getAuraHandledException(e);
        }
    }

    @AuraEnabled(cacheable=true)
    public static Map<String, Object> getServiceDeliveryFieldSets() {
        try {
            return service.getServiceDeliveryFieldSets();
        } catch (Exception e) {
            throw Util.getAuraHandledException(e);
        }
    }
}
