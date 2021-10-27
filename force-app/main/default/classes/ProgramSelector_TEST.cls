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
    private static BasicStub permissionValidatorStub = new BasicStub(
        PermissionValidator.class
    );

    @IsTest
    private static void testGetProgramCohortsFromProgramId() {
        TestDataFactory.generateProgramData();

        Id programId = TestDataFactory.programs[0].Id;

        List<ProgramCohort__c> cohorts = programSelector.getProgramCohortsFromProgramId(
            programId
        );

        System.assert(cohorts.size() > 0, 'Should return at least one cohort');

        Set<Id> cohortIdsForProgram = new Set<Id>();
        for (ProgramCohort__c cohort : TestDataFactory.programCohorts) {
            if (cohort.Program__c == programId) {
                cohortIdsForProgram.add(cohort.Id);
            }
        }
        for (ProgramCohort__c cohort : cohorts) {
            System.assert(
                cohortIdsForProgram.contains(cohort.Id),
                'Should return cohorts only for the requested program'
            );
        }
    }

    @IsTest
    private static void returnsEmptyCohortListWithoutReadAccess() {
        TestDataFactory.generateProgramData();
        Id programId = TestDataFactory.programs[0].Id;

        permissionValidatorStub.withReturnValue(
            'hasObjectAccess',
            new List<Type>{ SObjectType.class, PermissionValidator.CRUDAccessType.class },
            false
        );

        Test.startTest();
        PermissionValidator.instance = (PermissionValidator) permissionValidatorStub.createMock();
        List<ProgramCohort__c> cohorts = programSelector.getProgramCohortsFromProgramId(
            programId
        );
        Test.stopTest();

        System.assert(cohorts.isEmpty(), 'Expected an empty list to be returned.');

        permissionValidatorStub.assertCalledWith(
            'hasObjectAccess',
            new List<Type>{ SObjectType.class, PermissionValidator.CRUDAccessType.class },
            new List<Object>{
                ProgramCohort__c.SObjectType,
                PermissionValidator.CRUDAccessType.READABLE
            }
        );
    }
}
