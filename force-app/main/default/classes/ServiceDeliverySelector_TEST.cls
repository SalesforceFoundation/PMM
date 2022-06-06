/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class ServiceDeliverySelector_TEST {
    private static ServiceDeliverySelector selector = new ServiceDeliverySelector();
    private static BasicStub validatorStub = new BasicStub(PermissionValidator.class);
    private static FieldSet defaultFieldSet = SObjectType.ServiceDelivery__c.FieldSets.Attendance_Service_Deliveries;

    @TestSetup
    private static void setupServiceSessionData() {
        TestDataFactory.generateAttendanceData('Monthly');
    }

    @IsTest
    private static void testGetNumberOfServiceDeliveriesForSessionNoAccess() {
        Id sessionId = [SELECT Id FROM ServiceSession__c LIMIT 1].Id;

        validatorStub.withReturnValue(
            'hasObjectAccess',
            new List<Type>{ SObjectType.class, PermissionValidator.CRUDAccessType.class },
            false
        );

        Test.startTest();
        PermissionValidator.instance = (PermissionValidator) validatorStub.createMock();
        Integer actualNumberOfDeliveries = selector.getNumberOfServiceDeliveriesForSession(
            sessionId
        );
        Test.stopTest();

        System.assertEquals(
            0,
            actualNumberOfDeliveries,
            'Expected 0 count of service deliveries since the user does not have access to the object'
        );

        validatorStub.assertCalledWith(
            'hasObjectAccess',
            new List<Type>{ SObjectType.class, PermissionValidator.CRUDAccessType.class },
            new List<Object>{
                ServiceDelivery__c.SObjectType,
                PermissionValidator.CRUDAccessType.READABLE
            }
        );
    }

    @IsTest
    private static void testGetServiceDeliveriesForSessionNoAccess() {
        Id sessionId = [SELECT Id FROM ServiceSession__c LIMIT 1].Id;

        validatorStub.withReturnValue(
            'hasObjectAccess',
            new List<Type>{ SObjectType.class, PermissionValidator.CRUDAccessType.class },
            false
        );

        Test.startTest();
        PermissionValidator.instance = (PermissionValidator) validatorStub.createMock();
        List<ServiceDelivery__c> actualDeliveries = selector.getServiceDeliveriesForSession(
            sessionId
        );
        Test.stopTest();

        System.assertEquals(
            0,
            actualDeliveries.size(),
            'Expected empty list of service deliveries since the user does not have access to the object'
        );

        validatorStub.assertCalledWith(
            'hasObjectAccess',
            new List<Type>{ SObjectType.class, PermissionValidator.CRUDAccessType.class },
            new List<Object>{
                ServiceDelivery__c.SObjectType,
                PermissionValidator.CRUDAccessType.READABLE
            }
        );
    }

    @IsTest
    private static void testGetNumberOfServiceDeliveriesForSession() {
        Id sessionId = [SELECT Id FROM ServiceSession__c LIMIT 1].Id;

        Integer expectedNumberOfDeliveries = ([
                SELECT Id
                FROM ServiceDelivery__c
                WHERE ServiceSession__c = :sessionId
            ])
            .size();
        Test.startTest();
        Integer actualNumberOfDeliveries = selector.getNumberOfServiceDeliveriesForSession(
            sessionId
        );
        Test.stopTest();

        System.assertNotEquals(
            0,
            actualNumberOfDeliveries,
            'There should be more than 0 matching service deliveries for a valid test'
        );

        System.assertEquals(
            expectedNumberOfDeliveries,
            actualNumberOfDeliveries,
            'The selector should have returned the expected count of service deliveries'
        );
    }

    @IsTest
    private static void testGetServiceDeliveriesForSession() {
        Id sessionId = [SELECT Id FROM ServiceSession__c LIMIT 1].Id;

        List<ServiceDelivery__c> expectedDeliveries = [
            SELECT Id
            FROM ServiceDelivery__c
            WHERE ServiceSession__c = :sessionId
        ];
        Test.startTest();
        List<ServiceDelivery__c> actualDeliveries = selector.getServiceDeliveriesForSession(
            sessionId
        );
        Test.stopTest();

        System.assertNotEquals(
            0,
            actualDeliveries.size(),
            'There should be more than 0 matching service deliveries for a valid test'
        );

        System.assertEquals(
            expectedDeliveries.size(),
            actualDeliveries.size(),
            'The selector should have returned the expected count of service deliveries'
        );

        Set<Id> expectedDeliveryIds = new Map<Id, ServiceDelivery__c>(expectedDeliveries)
            .keySet();
        for (ServiceDelivery__c delivery : actualDeliveries) {
            System.assert(expectedDeliveryIds.contains(delivery.Id));
        }
    }

    @IsTest
    private static void getServiceDeliveriesFiltersWithClient() {
        List<ServiceDelivery__c> actualDeliveries;
        Id sessionId = [SELECT Id FROM ServiceSession__c LIMIT 1].Id;

        ServiceDelivery__c serviceDelivery = [
            SELECT Service__c, ServiceSession__c
            FROM ServiceDelivery__c
            WHERE ServiceSession__c = :sessionId
        ];
        serviceDelivery.Contact__c = null;
        insert serviceDelivery.clone();

        Test.startTest();
        actualDeliveries = selector.getServiceDeliveriesBySessionId(
            defaultFieldSet,
            sessionId
        );
        Test.stopTest();

        List<ServiceDelivery__c> sessionDeliveries = [
            SELECT Id
            FROM ServiceDelivery__c
            WHERE ServiceSession__c = :sessionId
        ];
        System.assert(
            !actualDeliveries.isEmpty() &&
            sessionDeliveries.size() > actualDeliveries.size(),
            'Expected only sessions with contact ids to be returned, actualDeliveries: ' +
            actualDeliveries.size() +
            '; sessionDeliveries: ' +
            sessionDeliveries.size()
        );

        for (ServiceDelivery__c delivery : actualDeliveries) {
            System.assertNotEquals(
                null,
                delivery.Contact__c,
                'Expected only deliveries related to a client to be returned.'
            );
        }
    }

    @IsTest
    private static void getServiceParticipantsByScheduleIdShouldReturnAllWhenNoExistingContacts() {
        ServiceSession__c session = [
            SELECT Id, ServiceSchedule__c
            FROM ServiceSession__c
            LIMIT 1
        ];
        List<ServiceParticipant__c> participants = [
            SELECT Id, Contact__c
            FROM ServiceParticipant__c
            WHERE ServiceSchedule__c = :session.ServiceSchedule__c
        ];
        System.assert(
            participants.size() > 1,
            'Sanity check that at least 2 participants should be found.'
        );
        List<ServiceParticipant__c> actualParticipants = selector.getServiceParticipantsByScheduleId(
            session.ServiceSchedule__c,
            new Set<Id>()
        );

        System.assertEquals(
            participants.size(),
            actualParticipants.size(),
            'Expected all participant records to be returned.'
        );
    }

    @IsTest
    private static void getServiceParticipantsByScheduleIdShouldOmitExistingContacts() {
        ServiceSession__c session = [
            SELECT Id, ServiceSchedule__c
            FROM ServiceSession__c
            LIMIT 1
        ];
        List<ServiceParticipant__c> participants = [
            SELECT Id, Contact__c
            FROM ServiceParticipant__c
            WHERE ServiceSchedule__c = :session.ServiceSchedule__c
        ];
        System.assert(
            participants.size() > 1,
            'Sanity check that at least 2 participants should be found.'
        );
        List<ServiceParticipant__c> actualParticipants = selector.getServiceParticipantsByScheduleId(
            session.ServiceSchedule__c,
            new Set<Id>{ participants[0].Contact__c }
        );

        System.assertEquals(
            participants.size() - 1,
            actualParticipants.size(),
            'Expected one participant record to be excluded.'
        );
    }

    @IsTest
    private static void shouldReturnSession() {
        Id sessionId = [SELECT Id FROM ServiceSession__c LIMIT 1].Id;

        Test.startTest();
        System.assertEquals(
            sessionId,
            selector.getSession(sessionId).Id,
            'Expected the service session record to be returned.'
        );
        Test.stopTest();
    }

    @IsTest
    private static void shouldReturnNullWhenSessionNotFound() {
        Id sessionId = TestUtil.mockId(ServiceSession__c.SObjectType);

        Test.startTest();
        System.assertEquals(
            null,
            selector.getSession(sessionId),
            'Expected the service to return null when a record is not found.'
        );
        Test.stopTest();
    }

    @IsTest
    private static void returnsEmptyDeliveryListWithoutReadAccess() {
        User standardUser = TestUtil.getTestUser();
        Id sessionId = [SELECT Id FROM ServiceSession__c LIMIT 1].Id;
        List<ServiceDelivery__c> actualDeliveries;

        System.runAs(standardUser) {
            Test.startTest();
            actualDeliveries = selector.getServiceDeliveriesBySessionId(
                defaultFieldSet,
                sessionId
            );
            Test.stopTest();
        }

        System.assert(
            actualDeliveries.isEmpty(),
            'Expected an empty list to be returned.'
        );
    }

    @IsTest
    private static void returnsEmptyParticipantListWithoutReadAccess() {
        User standardUser = TestUtil.getTestUser();
        Id sessionId = [SELECT Id FROM ServiceSession__c LIMIT 1].Id;
        List<ServiceParticipant__c> actualParticipants;
        ServiceSession__c session = [
            SELECT Id, ServiceSchedule__c
            FROM ServiceSession__c
            LIMIT 1
        ];

        System.runAs(standardUser) {
            Test.startTest();
            actualParticipants = selector.getServiceParticipantsByScheduleId(
                session.ServiceSchedule__c,
                new Set<Id>()
            );
            Test.stopTest();
        }

        System.assert(
            actualParticipants.isEmpty(),
            'Expected an empty list to be returned.'
        );
    }

    @IsTest
    private static void returnsEmptyDeliveriesListWithoutReadAccess() {
    }
}
