/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class Util {
    public static AuraHandledException getAuraHandledException(Exception ex) {
        String message = ex.getMessage() + ': ' + ex.getCause();

        AuraHandledException auraEx = new AuraHandledException(message);
        auraEx.setMessage(message);

        return auraEx;
    }

    public static Map<String, String> getObjectLabels(SObjectType sObjectType) {
        return new Map<String, String>{
            'objectPluralLabel' => sObjectType.getDescribe().getLabelPlural(),
            'objectLabel' => sObjectType.getDescribe().getLabel(),
            'objectApiName' => sObjectType.getDescribe().getName()
        };
    }

    public static Date getToday() {
        return System.today();
    }

    public static Integer getDayNum(Date val) {
        return Math.mod(Date.newInstance(1900, 1, 7).daysBetween(val), 7) + 1;
    }
}
