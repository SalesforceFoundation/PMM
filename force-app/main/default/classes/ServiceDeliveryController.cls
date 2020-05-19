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
}
