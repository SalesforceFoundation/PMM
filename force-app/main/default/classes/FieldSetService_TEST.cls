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
    private static void shouldReturnFieldPropertiesByFieldPath() {
        FieldSetService fieldSetService = new FieldSetService();
        Schema.FieldSet fieldSet = Schema.SObjectType.ProgramEngagement__c.FieldSets.SessionParticipantView;

        Map<String, Map<String, Object>> actualFieldByFieldPath = fieldSetService.getFieldByFieldPath(
            String.valueOf(ProgramEngagement__c.SObjectType),
            fieldSet.getName()
        );
        String expectedPath =
            ProgramEngagement__c.Contact__c.getDescribe().getRelationshipName() +
            '.' +
            String.valueOf(Contact.Name);

        System.assert(
            actualFieldByFieldPath.containsKey(expectedPath),
            'Expected the client name field to be returned by it\'s full path.'
        );

        System.assertEquals(
            'Full Name',
            (String) actualFieldByFieldPath.get(expectedPath).get('label'),
            'Expected the label for Contact Name to be returned.'
        );
    }

    @IsTest
    private static void shouldReturnEmptyFieldPropertiesByFieldPathForInvalidFieldSet() {
        FieldSetService fieldSetService = new FieldSetService();
        Map<String, Map<String, Object>> actualFieldByFieldPath = fieldSetService.getFieldByFieldPath(
            String.valueOf(ProgramEngagement__c.SObjectType),
            'invalidName'
        );

        System.assert(
            actualFieldByFieldPath.isEmpty(),
            'Expected an empty map to be returned.'
        );
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
        String expectedFieldName = String.valueOf(Contact.MailingAddress);
        DescribeFieldResult actualField = new FieldSetService()
            .getCompoundFieldDescribe(
                SObjectType.Contact,
                SObjectType.Contact.fields.MailingStreet,
                String.valueOf(Contact.MailingStreet)
            );

        System.assertEquals(
            expectedFieldName,
            actualField.getName(),
            'Expected the Compound Field to be returned.'
        );
    }

    @IsTest
    private static void shouldReturnCompoundFieldDescribeFromRelatedObject() {
        String expectedFieldName = String.valueOf(Contact.MailingAddress);
        DescribeFieldResult actualField = new FieldSetService()
            .getCompoundFieldDescribe(
                SObjectType.ProgramEngagement__c,
                SObjectType.Contact.fields.MailingStreet,
                ProgramEngagement__c.Contact__c.getDescribe().getRelationshipName() +
                '.' +
                String.valueOf(Contact.MailingStreet)
            );

        System.assertEquals(
            expectedFieldName,
            actualField.getName(),
            'Expected the Compound Field from the related object to be returned.'
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

    @IsTest
    private static void shouldReturnFieldSetByNameOnServiceDelivery() {
        FieldSetService fieldSetService = new FieldSetService();
        List<Schema.FieldSet> fieldSets = new List<Schema.FieldSet>{
            Schema.SObjectType.ServiceDelivery__c.FieldSets.Attendance_Service_Deliveries,
            Schema.SObjectType.ServiceDelivery__c.FieldSets.Bulk_Service_Deliveries
        };

        List<Map<String, Object>> fieldsResult = fieldSetService.getFieldSetForLWC(
            String.valueOf(ServiceDelivery__c.SObjectType),
            fieldSets[0].getName(),
            false
        );

        Map<String, Object> fieldSetByName = fieldSetService.getFieldSetsByName(
            String.valueOf(ServiceDelivery__c.SObjectType)
        );

        for (Schema.FieldSet fieldSet : fieldSets) {
            System.assert(
                fieldSetByName.containsKey(fieldSet.getName()),
                'Expected the map to return both field sets from Service Delivery.'
            );
        }
        System.assertEquals(
            String.valueOf(fieldsResult),
            String.valueOf(fieldSetByName.get(fieldSets[0].getName())),
            'Expected the field set object to be returned.'
        );
    }

    @IsTest
    private static void shouldThrowErrorForInvalidFieldSet() {
        String actualException;
        String objectName = String.valueOf(Contact.SObjectType);
        String fieldSetName = 'FakeFieldSet';
        String expectedException = String.format(
            System.Label.NoFieldSetFound,
            new List<String>{ fieldSetName, objectName }
        );

        try {
            new FieldSetService().getFieldSetFieldInfos(objectName, fieldSetName, false);
        } catch (Exception ex) {
            actualException = ex.getMessage();
        }

        System.assertEquals(
            expectedException,
            actualException,
            'The exception message was not as expected.'
        );
    }

    @IsTest
    private static void shouldReturnNullNameFieldForNonReferenceField() {
        String message =
            'When getFieldForLWC is called with a non-lookup ' +
            'field, the returned map should have a null value for both ' +
            'referenceTo and referenceNameField';

        Map<String, Object> field = (new FieldSetService())
            .getFieldForLWC(Schema.Contact.Name.getDescribe());

        System.assertEquals(null, field.get('referenceTo'), message);
        System.assertEquals(null, field.get('referenceNameField'), message);
    }

    @IsTest
    private static void shouldReturnNameFieldForPolymorphicLookupField() {
        String message =
            'When getFieldForLWC is called with a polymorphic ' +
            'lookup field, the return map should have the name and name field of ' +
            'the "first" object type referenced by the polymorphic lookup';

        Map<String, Object> field = (new FieldSetService())
            .getFieldForLWC(Schema.Case.OwnerId.getDescribe());

        System.assertEquals('Group', field.get('referenceTo'), message);
        System.assertEquals('Name', field.get('referenceNameField'), message);
    }

    @IsTest
    private static void shouldReturnNameFieldForPolymorphicLookupField2() {
        String message =
            'When getFieldForLWC is called with a polymorphic ' +
            'lookup field, the return map should have the name and name field of ' +
            'the "first" object type referenced by the polymorphic lookup, ' +
            'even if this object has a non-standard name field';

        Map<String, Object> field = (new FieldSetService())
            .getFieldForLWC(Schema.PermissionSet.LicenseId.getDescribe());

        System.assertEquals('PermissionSetLicense', field.get('referenceTo'), message);
        System.assertEquals('DeveloperName', field.get('referenceNameField'), message);
    }

    @IsTest
    private static void shouldReturnNameFieldForStandardLookupField() {
        String message =
            'When getFieldForLWC is called with a lookup field to ' +
            'a standard object, the return map should have the name and name ' +
            'field of the standard object';

        Map<String, Object> field = (new FieldSetService())
            .getFieldForLWC(Schema.Case.ParentId.getDescribe());

        System.assertEquals('Case', field.get('referenceTo'), message);
        System.assertEquals('CaseNumber', field.get('referenceNameField'), message);
    }

    @IsTest
    private static void shouldReturnNameFieldForPackagedLookupField() {
        String message =
            'When getFieldForLWC is called with a lookup field to ' +
            'an object in the same package, the return map should have the name ' +
            'and name field of the referenced object with the namespace ' +
            'prefixed if the code is running in a namespaced context';

        Map<String, Object> field = (new FieldSetService())
            .getFieldForLWC(Schema.ProgramEngagement__c.Program__c.getDescribe());

        String expectedObjectName = 'Program__c';

        String className = String.valueOf(FieldSetService_TEST.class);
        Boolean isNamespaced = className.contains('.');

        if (isNamespaced) {
            String namespacePrefix = className.substringBefore('.');
            expectedObjectName = namespacePrefix + '__Program__c';
        }

        System.assertEquals(expectedObjectName, field.get('referenceTo'), message);
        System.assertEquals('Name', field.get('referenceNameField'), message);
    }
}
