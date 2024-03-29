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
    private static final String ACTIVE_BUCKET = 'ProgramCohortStatusActive';
    private static ProgramSelector programSelector = new ProgramSelector();
    private static BasicStub permissionValidatorStub = new BasicStub(
        PermissionValidator.class
    );
    private static TestStub bucketSelectorStub;

    @IsTest
    private static void testGetProgramCohortsFromProgramId() {
        String methodName = 'getBuckets';
        TestDataFactory.generateProgramData();
        Schema.SObjectType programCohortSObjType = ProgramCohort__c.SObjectType;
        Schema.SObjectField statusField = ProgramCohort__c.Status__c;

        Id programId = TestDataFactory.programs[0].Id;

        List<Bucket__mdt> cohortStatusBuckets = createBuckets();

        //Insert a cohort with different status so we check that we return
        //program cohorts in active status
        ProgramCohort__c cohort = new ProgramCohort__c();
        cohort.Name = 'New Cohort';
        cohort.Program__c = programId;
        cohort.StartDate__c = System.today();
        cohort.Status__c = 'Planned';

        insert cohort;

        List<ProgramCohort__c> cohorts = programSelector.getProgramCohortsFromProgramId(
            programId
        );

        System.assert(cohorts.size() > 0, 'Should return at least one cohort');
        System.assertEquals(
            'Planned',
            cohorts[1].Status__c,
            'Expected the status on the returned cohort record to be planned'
        );
    }

    @IsTest
    private static void testGetActiveProgramCohortsFromProgramId() {
        String methodName = 'getBuckets';
        List<String> buckets = new List<String>{ ACTIVE_BUCKET };
        Schema.SObjectType programCohortSObjType = ProgramCohort__c.SObjectType;
        Schema.SObjectField statusField = ProgramCohort__c.Status__c;

        TestDataFactory.generateProgramData();
        Id programId = TestDataFactory.programs[0].Id;

        List<Bucket__mdt> cohortStatusBuckets = createBuckets();

        //Insert a cohort with different status so we check that we return
        //program cohorts in active status
        ProgramCohort__c cohort = new ProgramCohort__c();
        cohort.Name = 'New Cohort';
        cohort.Program__c = programId;
        cohort.StartDate__c = System.today();
        cohort.Status__c = 'Planned';

        insert cohort;

        List<ProgramCohort__c> actualCohorts = new List<ProgramCohort__c>();

        bucketSelectorStub = new StubBuilder(FieldBucketSelector.class)
            .when(
                methodName,
                List<String>.class,
                Schema.SObjectType.class,
                Schema.SObjectField.class
            )
            .calledWith(buckets, programCohortSObjType, statusField)
            .thenReturn(cohortStatusBuckets)
            .build();

        programSelector.bucketSelector = (FieldBucketSelector) bucketSelectorStub.create();

        Test.startTest();
        actualCohorts = programSelector.getProgramCohortsFromProgramId(programId);
        Test.stopTest();

        System.assertEquals(
            1,
            actualCohorts.size(),
            'Should return atleast one active cohort'
        );

        System.assertEquals(
            programId,
            actualCohorts[0].Program__c,
            'Expected the programId on the returned cohort record to be the same as the expectedProgramId'
        );

        System.assertEquals(
            'Active',
            actualCohorts[0].Status__c,
            'Expected the status on the returned cohort record to be active'
        );
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

    private static List<Bucket__mdt> createBuckets() {
        BucketedField__mdt bucketedField = (BucketedField__mdt) new TestUtil.BucketedFieldBuilder()
            .withDeveloperName('ProgramCohortStatuses')
            .withQualifiedApiName(Util.prefixNamespace('ProgramCohortStatuses'))
            .withField('Status__c')
            .withObject('ProgramCohort__c')
            .build();

        List<BucketedValue__mdt> activeCohortValues = new List<BucketedValue__mdt>();
        activeCohortValues.add(
            (BucketedValue__mdt) new TestUtil.BucketedValueBuilder()
                .withDeveloperName('ProgramCohortStatusActive')
                .withQualifiedApiName(Util.prefixNamespace('ProgramCohortStatusActive'))
                .withBucket('programCohortActiveBucket')
                .withValue('Active')
                .withMockId()
                .build()
        );

        Bucket__mdt programCohortActiveBucket = (Bucket__mdt) new TestUtil.BucketBuilder()
            .withBucketedField(bucketedField)
            .withBucketedValues(activeCohortValues)
            .withDeveloperName('ProgramCohortStatusActive')
            .withQualifiedApiName(Util.prefixNamespace('ProgramCohortStatusActive'))
            .withMockId()
            .build();

        return new List<Bucket__mdt>{ programCohortActiveBucket };
    }
}
