/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@isTest
public with sharing class FieldSetService_TEST {
    @isTest
    private static void testGetFieldSetForLWC() {
        Test.startTest();

        FieldSetService fieldSetService = new FieldSetService();

        Schema.FieldSet fieldSet = Schema.SObjectType.ProgramEngagement__c.FieldSets.CreateProgramEngagement;

        List<Map<String, String>> fieldsResult = fieldSetService.getFieldSetForLWC(
            'ProgramEngagement__c',
            'CreateProgramEngagement'
        );

        Test.stopTest();

        Map<String, Map<String, String>> fieldsResultByApiName = new Map<String, Map<String, String>>();

        for (Map<String, String> fieldMap : fieldsResult) {
            fieldsResultByApiName.put(fieldMap.get('apiName'), fieldMap);
        }

        System.debug(JSON.serializePretty(fieldsResultByApiName));

        for (Schema.FieldSetMember fieldSetMember : fieldSet.getFields()) {
            //special casing for label overrides
            String expectedLabel;
            /*if (fieldSetMember.getFieldPath().equalsIgnoreCase('AccountId')) {
                expectedLabel = Schema.Account.Name.getDescribe().getLabel();
            } else {*/
            expectedLabel = fieldSetMember.label;
            //}

            System.assertEquals(
                expectedLabel,
                fieldsResultByApiName.get(fieldSetMember.getFieldPath()).get('label')
            );

            System.assertEquals(
                fieldSetMember.getFieldPath(),
                fieldsResultByApiName.get(fieldSetMember.getFieldPath()).get('apiName')
            );
        }

        System.assertEquals(fieldSet.getFields().size(), fieldsResult.size());
    }
}
