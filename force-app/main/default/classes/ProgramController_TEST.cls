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
    private static void testGetCohortsForProgram() {
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
            .when('getCohortsForProgram', Id.class)
            .calledWith(programId)
            .thenReturn(cohortsToReturn)
            .build();

        ProgramController.service = (ProgramService) programServiceStub.create();

        Test.startTest();
        System.assertEquals(
            cohortsToReturn,
            ProgramController.getCohortsForProgram(programId),
            'Expected the controller to return list delivered by service.'
        );
        Test.stopTest();

        programServiceStub.assertCalledAsExpected();
    }
}
