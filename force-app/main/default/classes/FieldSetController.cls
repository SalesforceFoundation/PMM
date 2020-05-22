/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class FieldSetController {
    @TestVisible
    private static FieldSetService fieldSetService = new FieldSetService();

    /**
     * @description Gets a custom pmm fieldset for a given object in a data structure LWC can use
     * @param       String objectName
     * @param       String fieldSetName
     * @return      List<Map<String, Object>> list of fields, each with apiName, label, etc keys
     */
    @AuraEnabled(cacheable=true)
    public static List<Map<String, Object>> getFieldSetForLWC(
        String objectName,
        String fieldSetName
    ) {
        try {
            return fieldSetService.getFieldSetForLWC(objectName, fieldSetName);
        } catch (Exception e) {
            throw Util.getAuraHandledException(e);
        }
    }
}
