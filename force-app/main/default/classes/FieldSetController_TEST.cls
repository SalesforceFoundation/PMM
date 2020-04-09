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
        final List<Map<String, String>> expected = new List<Map<String, String>>();

        fieldSetServiceStub.withReturnValue(
            'getFieldSetForLWC',
            new List<Type>{ String.class, String.class },
            expected
        );

        Test.startTest();

        FieldSetController.fieldSetService = (FieldSetService) fieldSetServiceStub.createMock();
        final List<Object> actual = FieldSetController.getFieldSetForLWC(
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
            new List<Type>{ String.class, String.class },
            new List<Object>{ objectName, fieldSetName }
        );
    }

    @IsTest
    private static void whenGetFieldSetFieldsThrowsException() {
        String objectName = 'ProgramEngagement__c';
        String fieldSetName = 'CreateProgramEngagement';

        fieldSetServiceStub.withThrowException(
            'getFieldSetForLWC',
            new List<Type>{ String.class, String.class }
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
            new List<Type>{ String.class, String.class },
            new List<Object>{ objectName, fieldSetName }
        );
    }
}
