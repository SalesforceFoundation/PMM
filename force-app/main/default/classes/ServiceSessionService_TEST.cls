/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class ServiceSessionService_TEST {
    private static TestStub bucketSelectorStub;

    private static BasicStub serviceSelectorStub = new BasicStub(
        ServiceSessionSelector.class
    );

    private static ServiceSessionService service = new ServiceSessionService();

    @IsTest
    private static void testGetServiceSessionsByStartDate() {
        TestDataFactory.generateAttendanceData('Daily');

        final String dateLiteral = 'THIS_WEEK';
        final String methodName = 'getServiceSessionsByStartDate';
        final DateTime currentDate = System.now();
        final Set<String> allowedServiceSessionStatuses = new Set<String>{
            'Pending',
            'Complete'
        };

        Map<String, List<ServiceSession__c>> expected = new Map<String, List<ServiceSession__c>>();

        List<ServiceSession__c> expectedSessions = [
            SELECT Id, Name, PrimaryServiceProvider__c, Status__c, SessionStart__c
            FROM ServiceSession__c
            WHERE
                SessionStart__c = THIS_WEEK
                AND Status__c IN :allowedServiceSessionStatuses
            ORDER BY SessionStart__c
        ];

        System.assertEquals(
            2,
            expectedSessions.size(),
            'Test data should include two service sessions for this week'
        );

        expected.put(
            currentDate.format('EEEE, dd MMMM'),
            new List<ServiceSession__c>{ expectedSessions[0] }
        );

        expected.put(
            currentDate.addDays(1).format('EEEE, dd MMMM'),
            new List<ServiceSession__c>{ expectedSessions[1] }
        );

        serviceSelectorStub.withReturnValue(methodName, String.class, expectedSessions);

        Test.startTest();
        service.serviceSessionSelector = (ServiceSessionSelector) serviceSelectorStub.createMock();

        Map<String, List<ServiceSession__c>> actual = service.getServiceSessionsByStartDate(
            dateLiteral
        );

        Test.stopTest();

        System.assertEquals(
            expected.get(currentDate.format('EEEE, dd MMMM')),
            actual.get(currentDate.format('EEEE, dd MMMM')),
            'Expected values is not the same as actual values'
        );

        System.assertEquals(
            expected.get(currentDate.addDays(1).format('EEEE, dd MMMM')),
            actual.get(currentDate.addDays(1).format('EEEE, dd MMMM')),
            'Expected values is not the same as actual values'
        );

        System.assert(
            actual.containsKey(currentDate.format('EEEE, dd MMMM')),
            'Actual result does not have the key'
        );

        serviceSelectorStub.assertCalledWith(methodName, String.class, dateLiteral);
    }

    @IsTest
    private static void testGetServiceSessionStatusBuckets() {
        String status = 'Complete';
        String methodName = 'getBuckets';
        List<String> bucketNames = new List<String>{ status };

        Schema.SObjectType serviceSessionSObjType = ServiceSession__c.SObjectType;
        Schema.SObjectField statusField = ServiceSession__c.Status__c;

        List<Bucket__mdt> statusBuckets = createStatusBuckets();

        bucketSelectorStub = new StubBuilder(FieldBucketSelector.class)
            .when(
                methodName,
                List<String>.class,
                Schema.SObjectType.class,
                Schema.SObjectField.class
            )
            .calledWith(bucketNames, serviceSessionSObjType, statusField)
            .thenReturn(statusBuckets)
            .build();

        service.bucketSelector = (FieldBucketSelector) bucketSelectorStub.create();

        Set<String> expectedStatuses = new Set<String>{ status };

        Test.startTest();
        Set<String> returnedStatuses = service.getServiceSessionStatusBuckets(status);
        Test.stopTest();

        for (String statusName : expectedStatuses) {
            System.assert(
                returnedStatuses.contains(statusName),
                'Expected the status ' +
                statusName +
                ' to be returned.'
            );
        }
        bucketSelectorStub.assertCalledAsExpected();
    }

    private static List<Bucket__mdt> createStatusBuckets() {
        BucketedField__mdt bucketedField = (BucketedField__mdt) new TestUtil.BucketedFieldBuilder()
            .withDeveloperName('ServiceSessionStatuses')
            .withQualifiedApiName(Util.prefixNamespace('ServiceSessionStatuses'))
            .withField('Status__c')
            .withObject('ServiceSession__c')
            .withMockId()
            .build();

        List<BucketedValue__mdt> statusValues = new List<BucketedValue__mdt>();
        statusValues.add(
            (BucketedValue__mdt) new TestUtil.BucketedValueBuilder()
                .withDeveloperName('Complete')
                .withQualifiedApiName(Util.prefixNamespace('Complete'))
                .withBucket('Complete')
                .withValue('Complete')
                .withMockId()
                .build()
        );

        Bucket__mdt statusBucket = (Bucket__mdt) new TestUtil.BucketBuilder()
            .withBucketedField(bucketedField)
            .withBucketedValues(statusValues)
            .withDeveloperName('Complete')
            .withQualifiedApiName(Util.prefixNamespace('Complete'))
            .withMockId()
            .build();

        return new List<Bucket__mdt>{ statusBucket };
    }
}
