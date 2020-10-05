/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class FieldSetService_TEST {
    @IsTest
    private static void shouldReturnFieldProperties() {
        Test.startTest();

        FieldSetService fieldSetService = new FieldSetService();
        Schema.FieldSet fieldSet = Schema.SObjectType.ProgramEngagement__c.FieldSets.CreateProgramEngagement;

        List<Map<String, Object>> fieldsResult = fieldSetService.getFieldSetForLWC(
            String.valueOf(ProgramEngagement__c.SObjectType),
            fieldSet.getName(),
            false
        );

        Test.stopTest();

        Map<String, Map<String, Object>> fieldsResultByApiName = new Map<String, Map<String, Object>>();
        for (Map<String, Object> fieldMap : fieldsResult) {
            fieldsResultByApiName.put(String.valueof(fieldMap.get('apiName')), fieldMap);
        }

        for (Schema.FieldSetMember fieldSetMember : fieldSet.getFields()) {
            DescribeFieldResult fieldDescribe = fieldSetMember.getSObjectField()
                .getDescribe();

            System.assertEquals(
                fieldDescribe.getLabel(),
                fieldsResultByApiName.get(fieldSetMember.getFieldPath()).get('label')
            );

            System.assertEquals(
                fieldDescribe.getName(),
                fieldsResultByApiName.get(fieldSetMember.getFieldPath()).get('apiName')
            );

            System.assertEquals(
                fieldDescribe.getType().name(),
                fieldsResultByApiName.get(fieldSetMember.getFieldPath()).get('type')
            );

            System.assertEquals(
                !fieldDescribe.isNillable(),
                fieldsResultByApiName.get(fieldSetMember.getFieldPath()).get('isRequired')
            );

            System.assertEquals(
                fieldDescribe.getInlineHelpText(),
                fieldsResultByApiName.get(fieldSetMember.getFieldPath()).get('helpText')
            );

            System.assertEquals(
                fieldDescribe.isAccessible(),
                fieldsResultByApiName.get(fieldSetMember.getFieldPath())
                    .get('isAccessible')
            );
        }

        System.assertEquals(fieldSet.getFields().size(), fieldsResult.size());
    }

    @IsTest
    private static void shouldSkipUnsupportedFieldTypes() {
        Test.startTest();

        FieldSetService fieldSetService = new FieldSetService();
        fieldSetService.unsupportedFieldTypes = new Set<String>{ 'DATE' };
        Schema.FieldSet fieldSet = Schema.SObjectType.ProgramEngagement__c.FieldSets.CreateProgramEngagement;

        List<Map<String, Object>> fieldsResult = fieldSetService.getFieldSetForLWC(
            String.valueOf(ProgramEngagement__c.SObjectType),
            fieldSet.getName(),
            false
        );

        Test.stopTest();

        Map<String, Map<String, Object>> fieldsResultByApiName = new Map<String, Map<String, Object>>();
        for (Map<String, Object> fieldMap : fieldsResult) {
            fieldsResultByApiName.put(String.valueof(fieldMap.get('apiName')), fieldMap);
        }

        for (Schema.FieldSetMember fieldSetMember : fieldSet.getFields()) {
            if (fieldSetMember.getType().name() == 'DATE') {
                System.assert(
                    !fieldsResultByApiName.containsKey(fieldSetMember.getFieldPath()),
                    'The field should have been skipped: ' + fieldSetMember.getFieldPath()
                );
                continue;
            }

            System.assert(
                fieldsResultByApiName.containsKey(fieldSetMember.getFieldPath()),
                'The field should not have been skipped: ' + fieldSetMember.getFieldPath()
            );
        }

        System.assertNotEquals(
            fieldSet.getFields().size(),
            fieldsResult.size(),
            'Expected the fieldsResult size to be less than the fieldSet size.'
        );
    }

    @IsTest
    private static void shouldReturnCompoundFieldDescribe() {
        String expectedFieldName = String.valueOf(Contact.Name);
        DescribeFieldResult actualField = new FieldSetService()
            .getCompoundFieldDescribe(
                SObjectType.Contact,
                SObjectType.Contact.fields.FirstName
            );

        System.assertEquals(
            expectedFieldName,
            actualField.getName(),
            'Expected the Compound Field to be returned.'
        );
    }

    @IsTest
    private static void shouldReturnUILabel() {
        Map<DescribeFieldResult, String> expectedLabelByField = new Map<DescribeFieldResult, String>{
            SObjectType.Contact.fields.AccountId => Schema.Account.Name.getDescribe()
                .getLabel(),
            SObjectType.Opportunity.fields.ContactId => Schema.Contact.Name.getDescribe()
                .getLabel(),
            SObjectType.Account.fields.OwnerId => System.Label.Owner_Field
        };

        for (DescribeFieldResult field : expectedLabelByField.keySet()) {
            System.assertEquals(
                expectedLabelByField.get(field),
                new FieldSetService().getLabel(field),
                'Expected the special handling of standard object Id fields'
            );
        }
    }

    @IsTest
    private static void shouldReturnPicklistValuesWhenAPicklist() {
        Map<String, Object> actualPicklistField = new FieldSetService()
            .getPicklistFieldForLWC(Schema.Account.Industry.getDescribe());

        System.assert(
            actualPicklistField.containsKey('picklistValues'),
            'Expected picklist values to be returned.'
        );
    }

    @IsTest
    private static void shouldNotReturnPicklistValuesWhenNotAPicklist() {
        Map<String, Object> actualPicklistField = new FieldSetService()
            .getPicklistFieldForLWC(Schema.Account.Name.getDescribe());

        System.assert(
            !actualPicklistField.containsKey('picklistValues'),
            'Did not expect picklist values to be returned. ' +
            actualPicklistField.get('picklistValues')
        );
    }
}
