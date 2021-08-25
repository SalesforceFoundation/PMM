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
    private static void testGetProgramCohortsByProgramId() {
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
            .when('getProgramCohortsByProgramId', Id.class)
            .calledWith(programId)
            .thenReturn(cohortsToReturn)
            .build();

        ProgramController.service = (ProgramService) programServiceStub.create();

        Test.startTest();
        System.assertEquals(
            cohortsToReturn,
            ProgramController.getProgramCohortsByProgramId(programId),
            'Expected the controller to return list delivered by service.'
        );
        Test.stopTest();

        programServiceStub.assertCalledAsExpected();
    }

    @IsTest
    private static void throwsExceptionOnGetProgramCohortsByProgramId() {
        Id programId = TestUtil.mockId(Program__c.SObjectType);

        TestStub programServiceStub = new StubBuilder(ProgramService.class)
            .when('getProgramCohortsByProgramId', Id.class)
            .calledWith(programId)
            .thenThrowException()
            .build();

        Exception actualException;

        ProgramController.service = (ProgramService) programServiceStub.create();

        Test.startTest();
        try {
            List<ProgramCohort__c> cohorts = ProgramController.getProgramCohortsByProgramId(
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
}
