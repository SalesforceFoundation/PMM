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
    @IsTest
    private static void testGetCohortsForProgram() {
        ProgramSelector programSelector = new ProgramSelector();

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
                'Should return cohorts only for the request program'
            );
        }
    }
}
