/*
 *
 *  * Copyright (c) 2022, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class ProgramEngagementService_TEST {
    private static TestStub bucketSelectorStub;

    private static ProgramEngagementService service = new ProgramEngagementService();

    @IsTest
    private static void shouldGetActiveStages() {
        List<String> bucketNames = new List<String>{ 'Active' };

        Schema.SObjectType programEngagementSObjType = ProgramEngagement__c.SObjectType;
        Schema.SObjectField stageField = ProgramEngagement__c.Stage__c;

        List<Bucket__mdt> stageBuckets = createBuckets();

        bucketSelectorStub = new StubBuilder(FieldBucketSelector.class)
            .when(
                'getBuckets',
                List<String>.class,
                Schema.SObjectType.class,
                Schema.SObjectField.class
            )
            .calledWith(bucketNames, programEngagementSObjType, stageField)
            .thenReturn(stageBuckets)
            .build();

        service.bucketSelector = (FieldBucketSelector) bucketSelectorStub.create();

        Set<String> expectedStages = new Set<String>{ 'Active', 'Enrolled' };

        Test.startTest();
        Set<String> returnedStages = service.activeStages;
        Test.stopTest();

        for (String stageName : expectedStages) {
            System.assert(
                returnedStages.contains(stageName),
                'Expected the stage ' +
                stageName +
                ' to be returned.'
            );
        }
        bucketSelectorStub.assertCalledAsExpected();
    }

    @IsTest
    private static void shouldGetActiveStagesByValue() {
        Schema.SObjectType programEngagementSObjType = ProgramEngagement__c.SObjectType;
        Schema.SObjectField stageField = ProgramEngagement__c.Stage__c;

        Map<String, String> expectedStageMap = new Map<String, String>();
        expectedStageMap.put('Active', 'Active');
        expectedStageMap.put('Enrolled', 'Enrolled');

        Test.startTest();
        Map<String, String> actualStageMap = service.getActiveStagesByValue();
        Test.stopTest();
        System.assertEquals(
            expectedStageMap.size(),
            actualStageMap.size(),
            'Returned incorrect number of mappings'
        );
    }

    private static List<Bucket__mdt> createBuckets() {
        BucketedField__mdt bucketedField = (BucketedField__mdt) new TestUtil.BucketedFieldBuilder()
            .withDeveloperName('ProgramEngagementStage')
            .withQualifiedApiName(Util.prefixNamespace('ProgramEngagementStage'))
            .withField('Stage__c')
            .withObject('ProgramEngagement__c')
            .withMockId()
            .build();

        List<BucketedValue__mdt> activeValues = new List<BucketedValue__mdt>();
        activeValues.add(
            (BucketedValue__mdt) new TestUtil.BucketedValueBuilder()
                .withDeveloperName('Active')
                .withQualifiedApiName(Util.prefixNamespace('Active'))
                .withBucket('Active')
                .withValue('Active')
                .withMockId()
                .build()
        );
        activeValues.add(
            (BucketedValue__mdt) new TestUtil.BucketedValueBuilder()
                .withDeveloperName('Enrolled')
                .withQualifiedApiName(Util.prefixNamespace('Enrolled'))
                .withBucket('Active')
                .withValue('Enrolled')
                .withMockId()
                .build()
        );

        Bucket__mdt activeBucket = (Bucket__mdt) new TestUtil.BucketBuilder()
            .withBucketedField(bucketedField)
            .withBucketedValues(activeValues)
            .withDeveloperName('Active')
            .withQualifiedApiName(Util.prefixNamespace('Active'))
            .withMockId()
            .build();

        return new List<Bucket__mdt>{ activeBucket };
    }
}
