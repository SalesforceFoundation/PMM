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
    @IsTest
    private static void whenGetFieldSetReturnsSuccessfully() {
        String objectName = 'ProgramEngagement__c';
        String fieldSetName = 'CreateProgramEngagement';

        final FieldSetService_TEST.GetFieldSetForLWCMethod getFieldSetForLWC = new FieldSetService_TEST.GetFieldSetForLWCMethod();
        {
            getFieldSetForLWC.returnValue = new List<Map<String, String>>();
            getFieldSetForLWC.objectName = objectName;
            getFieldSetForLWC.fieldSetName = fieldSetName;
        }

        final Stub stub = new Stub(new List<Stub.Method>{ getFieldSetForLWC });

        final List<Object> expected = getFieldSetForLWC.returnValue;

        Test.startTest();

        FieldSetController.fieldSetService = (FieldSetService) Test.createStub(
            FieldSetService.class,
            stub
        );

        final List<Object> actual = FieldSetController.getFieldSetForLWC(
            objectName,
            fieldSetName
        );

        Test.stopTest();

        System.assertEquals(true, expected === actual);

        stub.assertMethodsCalled();
    }

    @IsTest
    private static void whenGetFieldSetFieldsThrowsException() {
        String objectName = 'ProgramEngagement__c';
        String fieldSetName = 'CreateProgramEngagement';

        final String exceptionMessage = 'Script-thrown exception';

        final FieldSetService_TEST.GetFieldSetForLWCMethod getFieldSetForLWC = new FieldSetService_TEST.GetFieldSetForLWCMethod();
        // An exception is being thrown so the returnValue is set to null
        getFieldSetForLWC.returnValue = null;
        getFieldSetForLWC.objectName = objectName;
        getFieldSetForLWC.fieldSetName = fieldSetName;
        getFieldSetForLWC.setExceptionThrownBeforeReturningValue(exceptionMessage);

        final Stub stub = new Stub(new List<Stub.Method>{ getFieldSetForLWC });

        final List<Object> expected = null;

        Test.startTest();

        FieldSetController.fieldSetService = (FieldSetService) Test.createStub(
            FieldSetService.class,
            stub
        );

        Exception actualException;
        List<Object> actual;

        try {
            actual = FieldSetController.getFieldSetForLWC(objectName, fieldSetName);
        } catch (Exception e) {
            actualException = e;
        }

        Test.stopTest();

        System.assertEquals(expected, actual);
        System.assertEquals(true, actualException instanceof AuraHandledException);
        System.assertEquals(exceptionMessage, actualException.getMessage());

        stub.assertMethodsCalled();
    }
}
