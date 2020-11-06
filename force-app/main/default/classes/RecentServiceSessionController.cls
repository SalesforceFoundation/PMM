/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */
public with sharing class RecentServiceSessionController {
    @TestVisible
    private static ServiceSessionService serviceSessionService = new ServiceSessionService();

    @AuraEnabled(cacheable=true)
    public static Map<String, List<ServiceSession__c>> getServiceSessionsByStartDate(
        String dateRange
    ) {
        try {
            return serviceSessionService.getServiceSessionsByStartDate(dateRange);
        } catch (Exception e) {
            throw Util.getAuraHandledException(e);
        }
    }
}
