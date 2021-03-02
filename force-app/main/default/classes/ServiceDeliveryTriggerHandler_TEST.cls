/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class ServiceDeliveryTriggerHandler_TEST {
    private static Contact contactRecord;
    private static Service__c service;
    private static List<ServiceSession__c> sessions;
    private static ProgramEngagement__c programEngagement;
    private static List<ServiceDelivery__c> serviceDeliveries;
    private static ServiceDeliveryTriggerHandler handler = new ServiceDeliveryTriggerHandler();
    private static BasicStub serviceStub = new BasicStub(AttendanceService.class);

    private static final String ROLLUP_ATTENDANCE_METHOD = 'rollupAttendance';
    private static final String PRESENT_STATUS = 'Present';
    private static final String ABSENCE_STATUS = 'Excused Absence';
    private static ServiceDelivery__c oldRecord = new ServiceDelivery__c();
    private static ServiceDelivery__c newRecord = new ServiceDelivery__c();
    private static final SObjectField ATTENDANCE_STATUS_FIELD = ServiceDelivery__c.AttendanceStatus__c;
    private static Map<SObjectField, Set<Id>> recordIdsByLookupField = new Map<SObjectField, Set<Id>>();

    @TestSetup
    private static void createServiceData() {
        TestDataFactory.generateAttendanceData('Monthly');
    }

    ////////// Unit Tests //////////

    private static void shouldCallRollupWhenStatusChanges() {
        handler.service = (AttendanceService) serviceStub.createMock();
        oldRecord.AttendanceStatus__c = PRESENT_STATUS;
        newRecord.AttendanceSTatus__c = ABSENCE_STATUS;

        Test.startTest();
        handler.extractRecordIdsToRecalculate(
            oldRecord,
            newRecord,
            ATTENDANCE_STATUS_FIELD,
            recordIdsByLookupField
        );
        Test.stopTest();

        serviceStub.assertCalled(ROLLUP_ATTENDANCE_METHOD);
    }

    private static void shouldCallRollupWhenStatusNulled() {
        handler.service = (AttendanceService) serviceStub.createMock();

        oldRecord.AttendanceStatus__c = PRESENT_STATUS;
        newRecord.AttendanceSTatus__c = null;

        Test.startTest();
        handler.extractRecordIdsToRecalculate(
            oldRecord,
            newRecord,
            ATTENDANCE_STATUS_FIELD,
            recordIdsByLookupField
        );
        Test.stopTest();

        serviceStub.assertCalled(ROLLUP_ATTENDANCE_METHOD);
    }

    private static void shouldCallRollupWhenStatusSet() {
        handler.service = (AttendanceService) serviceStub.createMock();

        oldRecord.AttendanceStatus__c = null;
        newRecord.AttendanceSTatus__c = PRESENT_STATUS;

        Test.startTest();
        handler.extractRecordIdsToRecalculate(
            oldRecord,
            newRecord,
            ATTENDANCE_STATUS_FIELD,
            recordIdsByLookupField
        );
        Test.stopTest();

        serviceStub.assertCalled(ROLLUP_ATTENDANCE_METHOD);
    }

    private static void shouldCallRollupWhenOnlyContactChanges() {
        handler.service = (AttendanceService) serviceStub.createMock();

        oldRecord.AttendanceStatus__c = PRESENT_STATUS;
        newRecord.AttendanceSTatus__c = PRESENT_STATUS;
        oldRecord.Contact__c = TestUtil.mockId(Contact.SObjectType);
        newRecord.Contact__c = TestUtil.mockId(Contact.SObjectType);
        //TODO: add an assertion that these are different?

        Test.startTest();
        handler.extractRecordIdsToRecalculate(
            oldRecord,
            newRecord,
            ATTENDANCE_STATUS_FIELD,
            recordIdsByLookupField
        );
        Test.stopTest();

        serviceStub.assertCalledWith(
            ROLLUP_ATTENDANCE_METHOD,
            Map<SObjectField, Set<Id>>.class,
            new Map<SObjectField, Set<Id>>{
                ServiceDelivery__c.Contact__c => new Set<Id>{
                    oldRecord.Contact__c,
                    newRecord.Contact__c
                }
            }
        );
    }

    private static void shouldCallRollupWhenOnlyProgramEngagementChanges() {
        handler.service = (AttendanceService) serviceStub.createMock();

        oldRecord.AttendanceStatus__c = PRESENT_STATUS;
        newRecord.AttendanceSTatus__c = PRESENT_STATUS;
        oldRecord.ProgramEngagement__c = TestUtil.mockId(
            ProgramEngagement__c.SObjectType
        );
        newRecord.ProgramEngagement__c = TestUtil.mockId(
            ProgramEngagement__c.SObjectType
        );

        Test.startTest();
        handler.extractRecordIdsToRecalculate(
            oldRecord,
            newRecord,
            ATTENDANCE_STATUS_FIELD,
            recordIdsByLookupField
        );
        Test.stopTest();

        serviceStub.assertCalledWith(
            ROLLUP_ATTENDANCE_METHOD,
            Map<SObjectField, Set<Id>>.class,
            new Map<SObjectField, Set<Id>>{
                ServiceDelivery__c.ProgramEngagement__c => new Set<Id>{
                    oldRecord.ProgramEngagement__c,
                    newRecord.ProgramEngagement__c
                }
            }
        );
    }

    private static void shouldCallRollupWhenOnlyServiceSessionChanges() {
        handler.service = (AttendanceService) serviceStub.createMock();

        oldRecord.AttendanceStatus__c = PRESENT_STATUS;
        newRecord.AttendanceSTatus__c = PRESENT_STATUS;
        oldRecord.ServiceSession__c = TestUtil.mockId(ServiceSession__c.SObjectType);
        newRecord.ServiceSession__c = TestUtil.mockId(ServiceSession__c.SObjectType);

        Test.startTest();
        handler.extractRecordIdsToRecalculate(
            oldRecord,
            newRecord,
            ATTENDANCE_STATUS_FIELD,
            recordIdsByLookupField
        );
        Test.stopTest();

        serviceStub.assertCalledWith(
            ROLLUP_ATTENDANCE_METHOD,
            Map<SObjectField, Set<Id>>.class,
            new Map<SObjectField, Set<Id>>{
                ServiceDelivery__c.ServiceSession__c => new Set<Id>{
                    oldRecord.ServiceSession__c,
                    newRecord.ServiceSession__c
                }
            }
        );
    }

    private static void shouldCallRollupWhenOnlyServiceChanges() {
        handler.service = (AttendanceService) serviceStub.createMock();

        oldRecord.AttendanceStatus__c = PRESENT_STATUS;
        newRecord.AttendanceSTatus__c = PRESENT_STATUS;
        oldRecord.Service__c = TestUtil.mockId(Service__c.SObjectType);
        newRecord.Service__c = TestUtil.mockId(Service__c.SObjectType);

        Test.startTest();
        handler.extractRecordIdsToRecalculate(
            oldRecord,
            newRecord,
            ATTENDANCE_STATUS_FIELD,
            recordIdsByLookupField
        );
        Test.stopTest();

        serviceStub.assertCalledWith(
            ROLLUP_ATTENDANCE_METHOD,
            Map<SObjectField, Set<Id>>.class,
            new Map<SObjectField, Set<Id>>{
                ServiceDelivery__c.Service__c => new Set<Id>{
                    oldRecord.Service__c,
                    newRecord.Service__c
                }
            }
        );
    }

    private static void shouldNotCallRollupWhenServiceChangesWithoutStatus() {
        // TODO: update method name? it says should not call but we are asserting the call?
        handler.service = (AttendanceService) serviceStub.createMock();

        oldRecord.Service__c = TestUtil.mockId(Service__c.SObjectType);
        newRecord.Service__c = TestUtil.mockId(Service__c.SObjectType);

        Test.startTest();
        handler.extractRecordIdsToRecalculate(
            oldRecord,
            newRecord,
            ATTENDANCE_STATUS_FIELD,
            recordIdsByLookupField
        );
        Test.stopTest();

        serviceStub.assertCalledWith(
            ROLLUP_ATTENDANCE_METHOD,
            Map<SObjectField, Set<Id>>.class,
            new Map<SObjectField, Set<Id>>{
                ServiceDelivery__c.Service__c => new Set<Id>{
                    oldRecord.Service__c,
                    newRecord.Service__c
                }
            }
        );
    }

    ////////// Functional Tests //////////

    private static void requery() {
        contactRecord = [
            SELECT
                Id,
                NumPresentServiceDeliveries__c,
                NumAbsentServiceDeliveries__c,
                LastServiceDate__c,
                ConsecutiveAbsences__c,
                LastModifiedDate
            FROM Contact
            LIMIT 1
        ];
        service = [
            SELECT Id, NumPresentServiceDeliveries__c, NumAbsentServiceDeliveries__c
            FROM Service__c
            LIMIT 1
        ];
        sessions = [
            SELECT
                Id,
                NumPresentServiceDeliveries__c,
                NumAbsentServiceDeliveries__c,
                SessionStart__c
            FROM ServiceSession__c
            ORDER BY SessionStart__c DESC
            LIMIT 2
        ];
        programEngagement = [
            SELECT
                Id,
                NumPresentServiceDeliveries__c,
                NumAbsentServiceDeliveries__c,
                LastServiceDate__c,
                ConsecutiveAbsences__c
            FROM ProgramEngagement__c
            LIMIT 1
        ];
    }

    @IsTest
    private static void shouldNotRollupWhenNotATrigger() {
        handler.service = (AttendanceService) serviceStub.createMock();
        handler.execute();

        serviceStub.assertNotCalled(ROLLUP_ATTENDANCE_METHOD);
    }

    @IsTest
    private static void shouldNotRollupWhenNotAfterTrigger() {
        handler.service = (AttendanceService) serviceStub.createMock();
        handler.delegate(System.TriggerOperation.BEFORE_INSERT);

        serviceStub.assertNotCalled(ROLLUP_ATTENDANCE_METHOD);
    }

    @IsTest
    private static void shouldIncrementOnInsert() {
        setupTest();
        requery();

        // The attendance records were inserted in the setupTest method
        System.assertEquals(2, contactRecord.NumPresentServiceDeliveries__c);
        System.assertEquals(1, contactRecord.NumAbsentServiceDeliveries__c);
        System.assertEquals(
            serviceDeliveries[1].DeliveryDate__c,
            contactRecord.LastServiceDate__c
        );
        System.assertEquals(1, contactRecord.ConsecutiveAbsences__c);
        System.assertEquals(1, service.NumPresentServiceDeliveries__c);
        System.assertEquals(1, service.NumAbsentServiceDeliveries__c);
        System.assertEquals(1, sessions[0].NumPresentServiceDeliveries__c);
        System.assertEquals(null, sessions[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(null, sessions[1].NumPresentServiceDeliveries__c);
        System.assertEquals(1, sessions[1].NumAbsentServiceDeliveries__c);
        System.assertEquals(1, programEngagement.NumPresentServiceDeliveries__c);
        System.assertEquals(1, programEngagement.NumAbsentServiceDeliveries__c);
        System.assertEquals(
            serviceDeliveries[1].DeliveryDate__c,
            programEngagement.LastServiceDate__c
        );
        System.assertEquals(1, programEngagement.ConsecutiveAbsences__c);
    }

    @IsTest
    private static void shouldIncrementOnUpdate() {
        setupTest();

        Test.startTest();
        // this SD was absent
        serviceDeliveries[1].AttendanceStatus__c = PRESENT_STATUS;
        update serviceDeliveries[1];
        Test.stopTest();

        requery();

        System.assertEquals(3, contactRecord.NumPresentServiceDeliveries__c);
        System.assertEquals(null, contactRecord.NumAbsentServiceDeliveries__c);
        System.assertEquals(
            serviceDeliveries[1].DeliveryDate__c,
            contactRecord.LastServiceDate__c
        );
        System.assertEquals(0, contactRecord.ConsecutiveAbsences__c);
        System.assertEquals(2, service.NumPresentServiceDeliveries__c);
        System.assertEquals(null, service.NumAbsentServiceDeliveries__c);
        System.assertEquals(1, sessions[0].NumPresentServiceDeliveries__c);
        System.assertEquals(null, sessions[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(1, sessions[1].NumPresentServiceDeliveries__c);
        System.assertEquals(null, sessions[1].NumAbsentServiceDeliveries__c);
        System.assertEquals(2, programEngagement.NumPresentServiceDeliveries__c);
        System.assertEquals(null, programEngagement.NumAbsentServiceDeliveries__c);
        System.assertEquals(
            serviceDeliveries[1].DeliveryDate__c,
            programEngagement.LastServiceDate__c
        );
        System.assertEquals(0, programEngagement.ConsecutiveAbsences__c);
    }

    @IsTest
    private static void shouldUpdateLastServiceDateOnQuantityUpdate() {
        setupTest();

        System.assertEquals(
            serviceDeliveries[1].DeliveryDate__c,
            contactRecord.LastServiceDate__c
        );

        List<ServiceDelivery__c> allServiceDeliveries = [
            SELECT Id, Quantity__c, DeliveryDate__c
            FROM ServiceDelivery__c
            ORDER BY DeliveryDate__c DESC
        ];

        Test.startTest();
        allServiceDeliveries[0].Quantity__c = 0;
        allServiceDeliveries[1].Quantity__c = 0;
        update allServiceDeliveries;
        Test.stopTest();

        requery();

        System.assertEquals(
            allServiceDeliveries[2].DeliveryDate__c,
            contactRecord.LastServiceDate__c
        );
    }

    @IsTest
    private static void shouldNotUpdateLastServiceDateOnIrrelevantFieldUpdate() {
        setupTest();

        System.assertEquals(
            serviceDeliveries[1].DeliveryDate__c,
            contactRecord.LastServiceDate__c
        );
        requery();
        DateTime contactModStamp = contactRecord.LastModifiedDate;

        Test.startTest();
        serviceDeliveries[1].AutonameOverride__c = true;
        update serviceDeliveries[1];
        Test.stopTest();

        requery();

        System.assertEquals(
            serviceDeliveries[1].DeliveryDate__c,
            contactRecord.LastServiceDate__c
        );
        System.assertEquals(contactModStamp, contactRecord.LastModifiedDate);
    }

    @IsTest
    private static void shouldDecrementOnDelete() {
        setupTest();

        Test.startTest();
        delete serviceDeliveries[0];
        Test.stopTest();

        requery();

        System.assertEquals(1, contactRecord.NumPresentServiceDeliveries__c);
        System.assertEquals(1, contactRecord.NumAbsentServiceDeliveries__c);
        System.assertEquals(1, contactRecord.ConsecutiveAbsences__c);
        System.assertEquals(
            serviceDeliveries[1].DeliveryDate__c,
            contactRecord.LastServiceDate__c
        );
        System.assertEquals(null, service.NumPresentServiceDeliveries__c);
        System.assertEquals(1, service.NumAbsentServiceDeliveries__c);
        System.assertEquals(null, sessions[0].NumPresentServiceDeliveries__c);
        System.assertEquals(null, sessions[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(null, sessions[1].NumPresentServiceDeliveries__c);
        System.assertEquals(1, sessions[1].NumAbsentServiceDeliveries__c);
        System.assertEquals(null, programEngagement.NumPresentServiceDeliveries__c);
        System.assertEquals(1, programEngagement.NumAbsentServiceDeliveries__c);
        System.assertEquals(
            serviceDeliveries[1].DeliveryDate__c,
            programEngagement.LastServiceDate__c
        );
        System.assertEquals(System.today(), programEngagement.LastServiceDate__c);
        System.assertEquals(1, programEngagement.ConsecutiveAbsences__c);
    }

    @IsTest
    private static void shouldIncrementOnUndelete() {
        setupTest();
        delete serviceDeliveries[0];

        Test.startTest();
        undelete serviceDeliveries[0];
        Test.stopTest();

        requery();

        System.assertEquals(2, contactRecord.NumPresentServiceDeliveries__c);
        System.assertEquals(1, contactRecord.NumAbsentServiceDeliveries__c);
        System.assertEquals(
            serviceDeliveries[1].DeliveryDate__c,
            contactRecord.LastServiceDate__c
        );
        System.assertEquals(1, contactRecord.ConsecutiveAbsences__c);
        System.assertEquals(1, service.NumPresentServiceDeliveries__c);
        System.assertEquals(1, service.NumAbsentServiceDeliveries__c);
        System.assertEquals(1, sessions[0].NumPresentServiceDeliveries__c);
        System.assertEquals(null, sessions[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(null, sessions[1].NumPresentServiceDeliveries__c);
        System.assertEquals(1, sessions[1].NumAbsentServiceDeliveries__c);
        System.assertEquals(1, programEngagement.NumPresentServiceDeliveries__c);
        System.assertEquals(1, programEngagement.NumAbsentServiceDeliveries__c);
        System.assertEquals(
            serviceDeliveries[1].DeliveryDate__c,
            programEngagement.LastServiceDate__c
        );
        System.assertEquals(1, programEngagement.ConsecutiveAbsences__c);
    }

    ////////// Helpers //////////

    private static void setupTest() {
        requery();

        System.assertEquals(1, contactRecord.NumPresentServiceDeliveries__c);
        System.assertEquals(null, contactRecord.NumAbsentServiceDeliveries__c);
        System.assertEquals(null, service.NumPresentServiceDeliveries__c);
        System.assertEquals(null, service.NumAbsentServiceDeliveries__c);
        System.assertEquals(null, sessions[0].NumPresentServiceDeliveries__c);
        System.assertEquals(null, sessions[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(null, sessions[1].NumPresentServiceDeliveries__c);
        System.assertEquals(null, sessions[1].NumAbsentServiceDeliveries__c);
        System.assertEquals(null, programEngagement.NumPresentServiceDeliveries__c);
        System.assertEquals(null, programEngagement.NumAbsentServiceDeliveries__c);

        serviceDeliveries = new List<ServiceDelivery__c>{
            new ServiceDelivery__c(
                Name = 'test',
                Service__c = service.Id,
                Contact__c = contactRecord.Id,
                ServiceSession__c = sessions[0].Id,
                ProgramEngagement__c = programEngagement.Id,
                Quantity__c = 1,
                AttendanceStatus__c = PRESENT_STATUS,
                DeliveryDate__c = System.today() - 1
            ),
            new ServiceDelivery__c(
                Name = 'test2',
                Service__c = service.Id,
                Contact__c = contactRecord.Id,
                ServiceSession__c = sessions[1].Id,
                ProgramEngagement__c = programEngagement.Id,
                Quantity__c = 1,
                AttendanceStatus__c = ABSENCE_STATUS,
                DeliveryDate__c = System.today()
            )
        };

        insert serviceDeliveries;
    }
}
