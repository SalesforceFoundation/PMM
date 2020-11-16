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
    @TestVisible
    private static final Map<String, String> DATE_LITERAL_OPTIONS = new Map<String, String>{
        'THIS_WEEK' => System.Label.This_Week,
        'LAST_WEEK' => System.Label.Last_Week
    };

    @AuraEnabled(cacheable=true)
    public static Map<String, List<ServiceSession__c>> getServiceSessionsByStartDate(
        String dateLiteral
    ) {
        if (!DATE_LITERAL_OPTIONS.containsKey(dateLiteral)) {
            return null;
        }

        try {
            return serviceSessionService.getServiceSessionsByStartDate(dateLiteral);
        } catch (Exception e) {
            throw Util.getAuraHandledException(e);
        }
    }

    @AuraEnabled(cacheable=true)
    public static Map<String, String> getMenuOptions() {
        return DATE_LITERAL_OPTIONS;
    }
}
