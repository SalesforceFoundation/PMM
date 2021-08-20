/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class ProgramSelector_TEST {
    private static ProgramSelector programSelector = new ProgramSelector();

    @IsTest
    private static void testGetCohortsForProgram() {
        Set<String> cohortFields = new Set<String>{
            String.valueOf(ProgramCohort__c.Id),
            String.valueOf(ProgramCohort__c.Name),
            String.valueOf(ProgramCohort__c.Program__c)
        };

        TestDataFactory.generateProgramData();

        Id programId = TestDataFactory.programs[0].Id;

        List<ProgramCohort__c> cohorts = programSelector.getCohortsForProgram(
            programId,
            cohortFields
        );

        System.assert(cohorts.size() > 0, 'Should return at least one cohort');

        for (ProgramCohort__c cohort : cohorts) {
            System.assertEquals(
                programId,
                cohort.Program__c,
                'Should return cohorts only for the requested program'
            );
        }
    }

    @IsTest
    private static void returnsEmptyCohortListWithoutReadAccess() {
        Set<String> cohortFields = new Set<String>{
            String.valueOf(ProgramCohort__c.Id),
            String.valueOf(ProgramCohort__c.Name),
            String.valueOf(ProgramCohort__c.Program__c)
        };

        TestDataFactory.generateProgramData();

        Id programId = TestDataFactory.programs[0].Id;

        User standardUser = TestUtil.getTestUser();
        List<ProgramCohort__c> cohorts;

        System.runAs(standardUser) {
            Test.startTest();
            cohorts = programSelector.getCohortsForProgram(programId, cohortFields);
            Test.stopTest();
        }

        System.assert(cohorts.isEmpty(), 'Expected an empty list to be returned.');
    }
}
