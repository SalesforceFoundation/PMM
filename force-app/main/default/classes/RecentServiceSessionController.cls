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
    private static final Map<String, String> dateLiteralOptions = new Map<String, String>();

    @AuraEnabled(cacheable=true)
    public static Map<String, List<ServiceSession__c>> getServiceSessionsByStartDate(
        String dateLiteral
    ) {
        //Need to build the map before checking if the map contains the key
        getMenuOptions();

        if (!dateLiteralOptions.containsKey(dateLiteral)) {
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
        dateLiteralOptions.put('THIS_WEEK', System.label.This_Week);
        dateLiteralOptions.put('LAST_WEEK', System.label.Last_Week);

        return dateLiteralOptions;
    }
}
