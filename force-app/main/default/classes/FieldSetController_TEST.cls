/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class FieldSetController_TEST {
    private static BasicStub fieldSetServiceStub = new BasicStub(FieldSetService.class);

    @IsTest
    private static void whenGetFieldSetReturnsSuccessfully() {
        String objectName = 'ProgramEngagement__c';
        String fieldSetName = 'CreateProgramEngagement';
        final List<Map<String, Object>> expected = new List<Map<String, Object>>();

        fieldSetServiceStub.withReturnValue(
            'getFieldSetForLWC',
            new List<Type>{ String.class, String.class, Boolean.class },
            expected
        );

        Test.startTest();

        FieldSetController.fieldSetService = (FieldSetService) fieldSetServiceStub.createMock();
        final List<Map<String, Object>> actual = FieldSetController.getFieldSetForLWC(
            objectName,
            fieldSetName
        );

        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'Expected the controller to return the list returned by the service.'
        );

        fieldSetServiceStub.assertCalledWith(
            'getFieldSetForLWC',
            new List<Type>{ String.class, String.class, Boolean.class },
            new List<Object>{ objectName, fieldSetName, false }
        );
    }

    @IsTest
    private static void whenGetFieldSetFieldsThrowsException() {
        String objectName = 'ProgramEngagement__c';
        String fieldSetName = 'CreateProgramEngagement';

        fieldSetServiceStub.withThrowException(
            'getFieldSetForLWC',
            new List<Type>{ String.class, String.class, Boolean.class }
        );

        final List<Object> expected = null;

        Test.startTest();

        FieldSetController.fieldSetService = (FieldSetService) fieldSetServiceStub.createMock();

        Exception actualException;
        List<Object> actual;

        try {
            actual = FieldSetController.getFieldSetForLWC(objectName, fieldSetName);
        } catch (Exception e) {
            actualException = e;
        }

        Test.stopTest();

        System.assertEquals(expected, actual);
        System.assertEquals(
            true,
            actualException instanceof AuraHandledException,
            actualException
        );
        System.assertEquals(
            fieldSetServiceStub.testExceptionMessage,
            actualException.getMessage()
        );

        fieldSetServiceStub.assertCalledWith(
            'getFieldSetForLWC',
            new List<Type>{ String.class, String.class, Boolean.class },
            new List<Object>{ objectName, fieldSetName, false }
        );
    }

    @IsTest
    private static void whenGetFieldByFieldPathsSuccessfully() {
        String objectName = 'ProgramEngagement__c';
        String fieldSetName = 'CreateProgramEngagement';
        final Map<String, Map<String, Object>> expected = new Map<String, Map<String, Object>>();

        fieldSetServiceStub.withReturnValue(
            'getFieldByFieldPath',
            new List<Type>{ String.class, String.class },
            expected
        );

        Test.startTest();

        FieldSetController.fieldSetService = (FieldSetService) fieldSetServiceStub.createMock();
        final Map<String, Map<String, Object>> actual = FieldSetController.getFieldByFieldPath(
            objectName,
            fieldSetName
        );

        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'Expected the controller to return the map returned by the service.'
        );

        fieldSetServiceStub.assertCalledWith(
            'getFieldByFieldPath',
            new List<Type>{ String.class, String.class },
            new List<Object>{ objectName, fieldSetName }
        );
    }

    @IsTest
    private static void whenGetFieldByFieldPathThrowsException() {
        String objectName = 'ProgramEngagement__c';
        String fieldSetName = 'CreateProgramEngagement';

        fieldSetServiceStub.withThrowException(
            'getFieldByFieldPath',
            new List<Type>{ String.class, String.class }
        );

        Test.startTest();

        FieldSetController.fieldSetService = (FieldSetService) fieldSetServiceStub.createMock();

        Exception actualException;

        try {
            FieldSetController.getFieldByFieldPath(objectName, fieldSetName);
        } catch (Exception e) {
            actualException = e;
        }

        Test.stopTest();

        System.assertEquals(
            true,
            actualException instanceof AuraHandledException,
            actualException
        );
        System.assertEquals(
            fieldSetServiceStub.testExceptionMessage,
            actualException.getMessage()
        );

        fieldSetServiceStub.assertCalledWith(
            'getFieldByFieldPath',
            new List<Type>{ String.class, String.class },
            new List<Object>{ objectName, fieldSetName }
        );
    }

    @IsTest
    private static void whenGetFieldSetsByNameSuccessfully() {
        String objectName = 'ServiceDelivery__c';

        Test.startTest();

        FieldSetController.fieldSetService = (FieldSetService) fieldSetServiceStub.createMock();
        FieldSetController.getFieldSetsByName(objectName);

        Test.stopTest();

        fieldSetServiceStub.assertCalledWith(
            'getFieldSetsByName',
            String.class,
            objectName
        );
    }

    @IsTest
    private static void whenGetFieldSetsByNameThrowsException() {
        String objectName = 'ServiceDelivery__c';

        fieldSetServiceStub.withThrowException('getFieldSetsByName', String.class);

        Test.startTest();

        FieldSetController.fieldSetService = (FieldSetService) fieldSetServiceStub.createMock();

        Exception actualException;

        try {
            FieldSetController.getFieldSetsByName(objectName);
        } catch (Exception e) {
            actualException = e;
        }

        Test.stopTest();

        System.assertEquals(
            true,
            actualException instanceof AuraHandledException,
            actualException
        );
        System.assertEquals(
            fieldSetServiceStub.testExceptionMessage,
            actualException.getMessage()
        );

        fieldSetServiceStub.assertCalledWith(
            'getFieldSetsByName',
            String.class,
            objectName
        );
    }
}
