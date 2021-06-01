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

    private static final String PRESENT_STATUS = 'Present';
    private static final String ABSENCE_STATUS = 'Excused Absence';
    private static ServiceDelivery__c oldRecord = new ServiceDelivery__c();
    private static ServiceDelivery__c newRecord = new ServiceDelivery__c();
    private static final SObjectField ATTENDANCE_STATUS_FIELD = ServiceDelivery__c.AttendanceStatus__c;
    private static Map<SObjectField, Set<Id>> recordIdsByLookupField = new Map<SObjectField, Set<Id>>();

    @TestSetup
    private static void createServiceData() {
        // By turning off none, we turn on all
        TestUtil.turnOffFeatureGates(new Set<String>{});
        TestDataFactory.generateAttendanceData('Monthly');
    }

    // ////////// Functional Tests //////////
    @IsTest
    private static void shouldIncrementOnInsert() {
        setupTest(new Set<String>{});
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
        System.assertEquals(0, sessions[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(0, sessions[1].NumPresentServiceDeliveries__c);
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
    private static void shouldNotIncrementOnInsertWhenFeatureIsOff() {
        setupTest(new Set<String>{ 'ServiceDeliveriesToContact' });
        requery();

        // The attendance records were inserted in the setupTest method
        System.assertEquals(1, contactRecord.NumPresentServiceDeliveries__c);
        System.assertEquals(0, contactRecord.NumAbsentServiceDeliveries__c);
        System.assertEquals(
            serviceDeliveries[1].DeliveryDate__c,
            contactRecord.LastServiceDate__c
        );
        System.assertEquals(0, contactRecord.ConsecutiveAbsences__c);
        System.assertEquals(1, service.NumPresentServiceDeliveries__c);
        System.assertEquals(1, service.NumAbsentServiceDeliveries__c);
        System.assertEquals(1, sessions[0].NumPresentServiceDeliveries__c);
        System.assertEquals(0, sessions[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(0, sessions[1].NumPresentServiceDeliveries__c);
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
        setupTest(new Set<String>{});

        Test.startTest();
        // this SD was absent
        serviceDeliveries[1].AttendanceStatus__c = PRESENT_STATUS;
        update serviceDeliveries[1];
        Test.stopTest();

        requery();

        System.assertEquals(3, contactRecord.NumPresentServiceDeliveries__c);
        System.assertEquals(0, contactRecord.NumAbsentServiceDeliveries__c);
        System.assertEquals(
            serviceDeliveries[1].DeliveryDate__c,
            contactRecord.LastServiceDate__c
        );
        System.assertEquals(0, contactRecord.ConsecutiveAbsences__c);
        System.assertEquals(2, service.NumPresentServiceDeliveries__c);
        System.assertEquals(0, service.NumAbsentServiceDeliveries__c);
        System.assertEquals(1, sessions[0].NumPresentServiceDeliveries__c);
        System.assertEquals(0, sessions[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(1, sessions[1].NumPresentServiceDeliveries__c);
        System.assertEquals(0, sessions[1].NumAbsentServiceDeliveries__c);
        System.assertEquals(2, programEngagement.NumPresentServiceDeliveries__c);
        System.assertEquals(0, programEngagement.NumAbsentServiceDeliveries__c);
        System.assertEquals(
            serviceDeliveries[1].DeliveryDate__c,
            programEngagement.LastServiceDate__c
        );
        System.assertEquals(0, programEngagement.ConsecutiveAbsences__c);
    }

    @IsTest
    private static void shouldNotIncrementOnUpdateWhenFeatureIsOff() {
        setupTest(new Set<String>{ 'ServiceDeliveriesToContact' });

        Test.startTest();
        // this SD was absent
        serviceDeliveries[1].AttendanceStatus__c = PRESENT_STATUS;
        update serviceDeliveries[1];
        Test.stopTest();

        requery();

        // The attendance records were inserted in the setupTest method
        System.assertEquals(1, contactRecord.NumPresentServiceDeliveries__c);
        System.assertEquals(0, contactRecord.NumAbsentServiceDeliveries__c);
        System.assertEquals(
            serviceDeliveries[1].DeliveryDate__c,
            contactRecord.LastServiceDate__c
        );
        System.assertEquals(0, contactRecord.ConsecutiveAbsences__c);
        System.assertEquals(2, service.NumPresentServiceDeliveries__c);
        System.assertEquals(0, service.NumAbsentServiceDeliveries__c);
        System.assertEquals(1, sessions[0].NumPresentServiceDeliveries__c);
        System.assertEquals(0, sessions[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(1, sessions[1].NumPresentServiceDeliveries__c);
        System.assertEquals(0, sessions[1].NumAbsentServiceDeliveries__c);
        System.assertEquals(2, programEngagement.NumPresentServiceDeliveries__c);
        System.assertEquals(0, programEngagement.NumAbsentServiceDeliveries__c);
        System.assertEquals(
            serviceDeliveries[1].DeliveryDate__c,
            programEngagement.LastServiceDate__c
        );
        System.assertEquals(0, programEngagement.ConsecutiveAbsences__c);
    }

    @IsTest
    private static void shouldIncrementNewParentAndDecrementOriginal() {
        setupTest(new Set<String>{});
        Contact newParent = new Contact(LastName = 'Charlie', FirstName = 'Georgia');
        insert newParent;

        Test.startTest();
        // this SD was absent
        serviceDeliveries[1].Contact__c = newParent.Id;
        serviceDeliveries[1].ProgramEngagement__c = null;
        update serviceDeliveries[1];
        Test.stopTest();

        requery();
        newParent = [
            SELECT
                Id,
                NumPresentServiceDeliveries__c,
                NumAbsentServiceDeliveries__c,
                LastServiceDate__c,
                ConsecutiveAbsences__c,
                LastModifiedDate
            FROM Contact
            WHERE Id = :newParent.Id
        ];

        ServiceDelivery__c serviceDelivery = [
            SELECT Id, DeliveryDate__c
            FROM ServiceDelivery__c
            ORDER BY Id
            LIMIT 1
        ];

        System.assertEquals(2, contactRecord.NumPresentServiceDeliveries__c);
        System.assertEquals(0, contactRecord.NumAbsentServiceDeliveries__c);
        System.assertEquals(
            serviceDelivery.DeliveryDate__c,
            contactRecord.LastServiceDate__c
        );
        System.assertEquals(0, contactRecord.ConsecutiveAbsences__c);
        System.assertEquals(0, newParent.NumPresentServiceDeliveries__c);
        System.assertEquals(1, newParent.NumAbsentServiceDeliveries__c);
        System.assertEquals(
            serviceDeliveries[1].DeliveryDate__c,
            newParent.LastServiceDate__c
        );
        System.assertEquals(1, newParent.ConsecutiveAbsences__c);
    }

    @IsTest
    private static void shouldUpdateLastServiceDateOnQuantityUpdate() {
        setupTest(new Set<String>{});

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
        setupTest(new Set<String>{});

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
        setupTest(new Set<String>{});

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
        System.assertEquals(0, service.NumPresentServiceDeliveries__c);
        System.assertEquals(1, service.NumAbsentServiceDeliveries__c);
        System.assertEquals(null, sessions[0].NumPresentServiceDeliveries__c);
        System.assertEquals(null, sessions[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(0, sessions[1].NumPresentServiceDeliveries__c);
        System.assertEquals(1, sessions[1].NumAbsentServiceDeliveries__c);
        System.assertEquals(0, programEngagement.NumPresentServiceDeliveries__c);
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
        setupTest(new Set<String>{});
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
        System.assertEquals(0, sessions[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(0, sessions[1].NumPresentServiceDeliveries__c);
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
    private static void shouldCallExecuteMethod() {
        setupTest(new Set<String>{});

        Test.startTest();
        ServiceDeliveryTriggerHandler triggerHandler = new ServiceDeliveryTriggerHandler();
        triggerHandler.execute();
        Test.stopTest();

        requery();
        //assert that none of the records were updated
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
        System.assertEquals(0, sessions[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(0, sessions[1].NumPresentServiceDeliveries__c);
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
    private static void shouldPassInvalidOperationType() {
        setupTest(new Set<String>{});

        Test.startTest();
        new ServiceDeliveryTriggerHandler().delegate();
        Test.stopTest();

        requery();

        //assert that none of the records were updated
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
        System.assertEquals(0, sessions[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(0, sessions[1].NumPresentServiceDeliveries__c);
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

    private static void setupTest(Set<String> featureGatesToDisable) {
        TestUtil.turnOffFeatureGates(featureGatesToDisable);
        requery();

        System.assertEquals(1, contactRecord.NumPresentServiceDeliveries__c);
        System.assertEquals(0, contactRecord.NumAbsentServiceDeliveries__c);
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
            ),
            new ServiceDelivery__c(
                Name = 'test3',
                Service__c = service.Id,
                Contact__c = contactRecord.Id,
                ServiceSession__c = sessions[1].Id,
                ProgramEngagement__c = programEngagement.Id,
                Quantity__c = 0,
                DeliveryDate__c = System.today()
            )
        };

        insert serviceDeliveries;
    }

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
}
