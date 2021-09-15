/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class ProgramController_TEST {
    @IsTest
    private static void testGetProgramCohortsFromProgramId() {
        List<ProgramCohort__c> cohortsToReturn = new List<ProgramCohort__c>();
        cohortsToReturn.add(
            new ProgramCohort__c(
                Id = TestUtil.mockId(ProgramCohort__c.SObjectType),
                Name = 'Cohort1'
            )
        );
        cohortsToReturn.add(
            new ProgramCohort__c(
                Id = TestUtil.mockId(ProgramCohort__c.SObjectType),
                Name = 'Cohort2'
            )
        );

        Id programId = TestUtil.mockId(Program__c.SObjectType);
        TestStub programServiceStub = new StubBuilder(ProgramService.class)
            .when('getProgramCohortsFromProgramId', Id.class)
            .calledWith(programId)
            .thenReturn(cohortsToReturn)
            .build();

        ProgramController.service = (ProgramService) programServiceStub.create();

        Test.startTest();
        System.assertEquals(
            cohortsToReturn,
            (List<ProgramCohort__c>) ProgramController.getProgramCohortsFromProgramId(
                programId
            ),
            'Expected the controller to return list delivered by service.'
        );
        Test.stopTest();

        programServiceStub.assertCalledAsExpected();
    }

    @IsTest
    private static void throwsExceptionOnGetProgramCohortsFromProgramId() {
        Id programId = TestUtil.mockId(Program__c.SObjectType);
        TestStub programServiceStub = new StubBuilder(ProgramService.class)
            .when('getProgramCohortsFromProgramId', Id.class)
            .calledWith(programId)
            .thenThrowException()
            .build();

        Exception actualException;

        ProgramController.service = (ProgramService) programServiceStub.create();

        Test.startTest();
        try {
            List<ProgramCohort__c> cohorts = (List<ProgramCohort__c>) ProgramController.getProgramCohortsFromProgramId(
                programId
            );
        } catch (AuraHandledException ex) {
            actualException = ex;
        } catch (Exception ex) {
            System.assert(
                false,
                'Expecting only AuraHandledException: ' + ex.getMessage()
            );
        }
        Test.stopTest();

        System.assertNotEquals(
            null,
            actualException,
            'Expected an exception to be thrown.'
        );
        programServiceStub.assertCalledAsExpected();
    }

    @IsTest
    private static void shouldCallFieldSetServiceOnGetFieldSetByObjectKey() {
        TestStub fieldSetServiceStub = new StubBuilder(fieldSetService.class)
            .when('getFieldSetForLWC', String.class, String.class, Boolean.class)
            .calledWith(
                String.valueOf(ProgramEngagement__c.SObjectType),
                'CreateProgramEngagement',
                false
            )
            .thenReturn(null)
            .when('getFieldSetForLWC', String.class, String.class, Boolean.class)
            .calledWith(String.valueOf(Contact.SObjectType), 'CreateContact', false)
            .thenReturn(null)
            .build();

        Exception actualException;

        ProgramController.fieldSetService = (FieldSetService) fieldSetServiceStub.create();

        Test.startTest();
        Map<String, Object> fieldSetByObjectKey = ProgramController.getFieldSetByObjectKey();
        Test.stopTest();

        System.assertEquals(
            2,
            fieldSetByObjectKey.keySet().size(),
            'Expected 2 items to be added.'
        );
        for (String key : fieldSetByObjectKey.keySet()) {
            System.assertEquals(
                null,
                fieldSetByObjectKey.get(key),
                'Expected the service to return null on each call.'
            );
        }
        fieldSetServiceStub.assertCalledAsExpected();
    }

    @IsTest
    private static void throwsExceptionOnGetFieldSetByObjectKey() {
        TestStub fieldSetServiceStub = new StubBuilder(fieldSetService.class)
            .when('getFieldSetForLWC', String.class, String.class, Boolean.class)
            .calledWith(
                String.valueOf(ProgramEngagement__c.SObjectType),
                'CreateProgramEngagement',
                false
            )
            .thenThrowException()
            .build();

        Exception actualException;

        ProgramController.fieldSetService = (FieldSetService) fieldSetServiceStub.create();

        Test.startTest();
        try {
            Map<String, Object> fieldSetByObjectKey = ProgramController.getFieldSetByObjectKey();
        } catch (AuraHandledException ex) {
            actualException = ex;
        } catch (Exception ex) {
            System.assert(
                false,
                'Expecting only AuraHandledException: ' + ex.getMessage()
            );
        }
        Test.stopTest();

        System.assertNotEquals(
            null,
            actualException,
            'Expected an exception to be thrown.'
        );
        fieldSetServiceStub.assertCalledAsExpected();
    }
}
