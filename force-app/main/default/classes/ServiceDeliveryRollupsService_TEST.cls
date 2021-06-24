/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */
@IsTest
public with sharing class ServiceDeliveryRollupsService_TEST {
    private static ServiceDeliveryRollupsService rollupsService = new ServiceDeliveryRollupsService();
    private static TestStub systemAccessStub;
    private static Date yesterday = System.today().addDays(-1);
    private static Id mockContactId = TestUtil.mockId(Contact.SObjectType);
    private static List<String> attendanceStatuses = new ServiceDeliveryService()
        .attendanceStatuses;
    private static List<ServiceDelivery__c> mockDeliveries = new List<ServiceDelivery__c>{
        new ServiceDelivery__c(
            AttendanceStatus__c = 'Present',
            DeliveryDate__c = yesterday,
            Contact__c = mockContactId,
            Quantity__c = 3
        )
    };

    @IsTest
    private static void shouldNotBeInBatchMode() {
        System.assert(
            !rollupsService.isBatchRunning,
            'Should return false when not running in a batch context.'
        );
    }

    @IsTest
    private static void shouldGetDeliveryRollupsQueryFromSystemAccess() {
        String rollupQueryToReturn =
            'SELECT AttendanceStatus__c, DeliveryDate__c, ' +
            String.valueOf(ServiceDelivery__c.Contact__c) +
            ', Quantity__c FROM ' +
            String.valueOf(ServiceDelivery__c.SObjectType);

        systemAccessStub = new StubBuilder(SystemAccess.class)
            .when('getDeliveryRollupsQuery', String.class)
            .calledWith(String.valueOf(ServiceDelivery__c.Contact__c))
            .thenReturn(rollupQueryToReturn)
            .build();

        rollupsService.systemAccess = (SystemAccess) systemAccessStub.create();

        Test.startTest();
        System.assertEquals(
            rollupQueryToReturn,
            rollupsService.getDeliveryRollupsQuery(Contact.SObjectType),
            'Expected the stub to return the query provided.'
        );
        Test.stopTest();

        systemAccessStub.assertCalledAsExpected();
    }

    @IsTest
    private static void shouldRollupDeliveryRecords() {
        Date yesterday = System.today().addDays(-1);

        Test.startTest();
        rollupsService.rollupDeliveryRecords(Contact.SObjectType, mockDeliveries);
        Test.stopTest();

        Set<Id> processedRecords = rollupsService.processedRecordsById.keySet();

        System.assert(
            processedRecords.contains(mockContactId),
            'Expected the contact to have been processed.'
        );
        System.assertEquals(
            1,
            processedRecords.size(),
            'Expected only the one contact provided to be processed.'
        );
    }

    @IsTest
    private static void shouldExitWhenNoDeliveryRecords() {
        Date yesterday = System.today().addDays(-1);

        Test.startTest();
        rollupsService.rollupDeliveryRecords(
            Contact.SObjectType,
            new List<ServiceDelivery__c>()
        );
        Test.stopTest();

        Set<Id> processedRecords = rollupsService.processedRecordsById.keySet();

        System.assert(
            processedRecords.isEmpty(),
            'Expected nothing to be processed when no delivery records are provided.'
        );
    }

    @IsTest
    private static void shouldCommitUpdatedRecords() {
        List<SObject> mockContacts = new List<Contact>{
            new Contact(
                Id = mockContactId,
                LastServiceDate__c = yesterday,
                ConsecutiveAbsences__c = 1,
                NumAbsentServiceDeliveries__c = 1,
                NumPresentServiceDeliveries__c = 1
            )
        };

        List<SObject> expectedContacts = new List<SObject>();
        rollupsService.processedRecordsById.put(
            mockContactId,
            rollupsService.createRollupRecord(mockContactId)
        );
        rollupsService.processedRecordsById.get(mockContactId).absentCount = 0;
        expectedContacts.add(
            rollupsService.processedRecordsById.get(mockContactId).getSObject()
        );
        systemAccessStub = new StubBuilder(SystemAccess.class)
            .when('getRecordsById', SObjectType.class, Set<Id>.class, List<String>.class)
            .calledWith(
                Contact.SObjectType,
                new Set<Id>{ mockContactId },
                rollupsService.buildSelectFieldsForOriginalQuery(Contact.SObjectType)
            )
            .thenReturn(mockContacts)
            .when('updateRecords', List<SObject>.class)
            .calledWith(expectedContacts)
            .thenReturn()
            .build();

        rollupsService.systemAccess = (SystemAccess) systemAccessStub.create();

        Test.startTest();
        rollupsService.commitRollups(Contact.SObjectType);
        Test.stopTest();

        systemAccessStub.assertCalledAsExpected();
    }

    @IsTest
    private static void shouldNotCommitUnchangedRecords() {
        List<SObject> mockContacts = new List<Contact>{
            new Contact(
                Id = mockContactId,
                LastServiceDate__c = null,
                ConsecutiveAbsences__c = null,
                NumAbsentServiceDeliveries__c = 0,
                NumPresentServiceDeliveries__c = null
            )
        };

        List<SObject> expectedContacts = new List<SObject>();
        rollupsService.processedRecordsById.put(
            mockContactId,
            rollupsService.createRollupRecord(mockContactId)
        );
        rollupsService.processedRecordsById.get(mockContactId).absentCount = 0;
        expectedContacts.add(
            rollupsService.processedRecordsById.get(mockContactId).getSObject()
        );

        systemAccessStub = new StubBuilder(SystemAccess.class)
            .when('getRecordsById', SObjectType.class, Set<Id>.class, List<String>.class)
            .calledWith(
                Contact.SObjectType,
                new Set<Id>{ mockContactId },
                rollupsService.buildSelectFieldsForOriginalQuery(Contact.SObjectType)
            )
            .thenReturn(mockContacts)
            .when('updateRecords', List<SObject>.class)
            .calledWith(expectedContacts)
            .expectedNotToBeCalled()
            .build();

        rollupsService.systemAccess = (SystemAccess) systemAccessStub.create();

        Test.startTest();
        rollupsService.commitRollups(Contact.SObjectType);
        Test.stopTest();

        systemAccessStub.assertCalledAsExpected();
    }

    @IsTest
    private static void shouldSetTotalRecordCountWhenBatchIsRunning() {
        systemAccessStub = new StubBuilder(SystemAccess.class)
            .when('getDeliveryRollupsCount', String.class, Id.class)
            .calledWith(String.valueOf(ServiceDelivery__c.Contact__c), mockContactId)
            .thenReturn(5)
            .build();
        rollupsService.systemAccess = (SystemAccess) systemAccessStub.create();
        rollupsService.isBatchRunning = true;

        Test.startTest();
        rollupsService.trackCrossBatchRecordTotals(
            mockDeliveries,
            ServiceDelivery__c.Contact__c
        );
        Test.stopTest();

        System.assertEquals(
            5,
            rollupsService.rollupRecordById.get(mockContactId).totalRecords,
            'Expected the total record count to be set on the contacts rollup record.'
        );

        systemAccessStub.assertCalledAsExpected();
    }

    @IsTest
    private static void shouldNotSetTotalRecordCountWhenBatchIsNotRunning() {
        systemAccessStub = new StubBuilder(SystemAccess.class)
            .when('getDeliveryRollupsCount', String.class, Id.class, List<String>.class)
            .signatureMatches()
            .expectedNotToBeCalled()
            .build();
        rollupsService.systemAccess = (SystemAccess) systemAccessStub.create();
        rollupsService.isBatchRunning = false;

        Test.startTest();
        rollupsService.trackCrossBatchRecordTotals(
            mockDeliveries,
            ServiceDelivery__c.Contact__c
        );
        Test.stopTest();

        systemAccessStub.assertCalledAsExpected();
    }

    @IsTest
    private static void shouldNotResetParentsWhenNoParentsAreProvided() {
        TestStub systemAccessStub = new StubBuilder(SystemAccess.class)
            .when('getParentsHavingDeliveries')
            .signatureMatches()
            .expectedNotToBeCalled()
            .build();

        rollupsService.systemAccess = (SystemAccess) systemAccessStub.create();
        Test.startTest();
        rollupsService.resetParentsWithoutDeliveries(new List<SObject>());
        Test.stopTest();

        systemAccessStub.assertCalledAsExpected();
    }

    @IsTest
    private static void shouldResetParentsWithoutDeliveries() {
        List<SObject> records = new List<SObject>{
            new Contact(Id = TestUtil.mockId(Contact.SObjectType))
        };
        TestStub systemAccessStub = new StubBuilder(SystemAccess.class)
            .when(
                'getParentsHavingDeliveries',
                SObjectType.class,
                String.class,
                List<SObject>.class
            )
            .calledWith(
                Contact.SObjectType,
                String.valueOf(ServiceDelivery__c.Contact__c),
                records
            )
            .thenReturn(new List<SObject>())
            .when('updateRecords', List<SObject>.class)
            .signatureMatches()
            .expectedToBeCalled(1)
            .thenReturn()
            .build();

        rollupsService.systemAccess = (SystemAccess) systemAccessStub.create();
        Test.startTest();
        rollupsService.resetParentsWithoutDeliveries(records);
        Test.stopTest();

        systemAccessStub.assertCalledAsExpected();
    }
}
