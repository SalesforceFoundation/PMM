/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class ServiceDeliveryService_TEST {
    private static Stub deliverySelectorStub;
    private static Stub domainStub;
    private static Stub permValidatorStub;
    private static Stub systemAccessStub;

    private static ServiceDeliveryService service = new ServiceDeliveryService();

    @IsTest
    private static void shouldGetBuckets() {
        List<String> bucketNames = new List<String>{ 'Absent', 'Present' };
        List<Bucket__mdt> bucketsToReturn = [
            SELECT
                Id,
                DeveloperName,
                BucketedField__r.Field__r.QualifiedApiName,
                QualifiedApiName,
                (SELECT Id, Value__c FROM BucketedValues__r)
            FROM Bucket__mdt
            WHERE DeveloperName IN :bucketNames AND NamespacePrefix = :Util.getNamespace()
            ORDER BY QualifiedApiName
        ];
        deliverySelectorStub = new StubBuilder(ServiceDeliverySelector.class)
            .when('getBuckets', List<String>.class)
            .calledWith(bucketNames)
            .thenReturn(bucketsToReturn)
            .build();

        service.deliverySelector = (ServiceDeliverySelector) deliverySelectorStub.create();

        Test.startTest();
        Map<String, List<String>> buckets = service.statusBuckets;
        Test.stopTest();

        for (String bucketName : bucketNames) {
            System.assert(
                buckets.containsKey(bucketName),
                'Expected the bucket ' +
                bucketName +
                ' to be returned.'
            );
        }

        deliverySelectorStub.assertCalledAsExpected();
    }

    @IsTest
    private static void getRosterShouldCallSelector() {
        Id sessionId = TestUtil.mockId(ServiceSession__c.SObjectType);
        Id scheduleId = TestUtil.mockId(ServiceSchedule__c.SObjectType);
        deliverySelectorStub = new StubBuilder(ServiceDeliverySelector.class)
            .when('getServiceDeliveriesBySessionId', Id.class)
            .calledWith(sessionId)
            .thenReturn(new List<ServiceDelivery__c>())
            .when('getServiceParticipantsByScheduleId', Id.class, Set<Id>.class)
            .calledWith(scheduleId, new Set<Id>())
            .thenReturn(new List<ServiceParticipant__c>())
            .when('getSession', Id.class)
            .calledWith(sessionId)
            .thenReturn(new ServiceSession__c(ServiceSchedule__c = scheduleId))
            .build();

        service.deliverySelector = (ServiceDeliverySelector) deliverySelectorStub.create();

        Test.startTest();
        service.generateRoster(sessionId);
        Test.stopTest();

        deliverySelectorStub.assertCalledAsExpected();
    }

    @IsTest
    private static void getRosterShouldReturnExistingDeliveries() {
        List<ServiceDelivery__c> deliveriesToReturn = new List<ServiceDelivery__c>{
            createMockDelivery()
        };
        Id scheduleId = TestUtil.mockId(ServiceSchedule__c.SObjectType);
        deliverySelectorStub = new StubBuilder(ServiceDeliverySelector.class)
            .when('getServiceDeliveriesBySessionId', Id.class)
            .calledWith(deliveriesToReturn[0].ServiceSession__c)
            .thenReturn(deliveriesToReturn)
            .when('getServiceParticipantsByScheduleId', Id.class, Set<Id>.class)
            .calledWith(scheduleId, new Set<Id>{ deliveriesToReturn[0].Contact__c })
            .thenReturn(new List<ServiceParticipant__c>())
            .when('getSession', Id.class)
            .calledWith(deliveriesToReturn[0].ServiceSession__c)
            .thenReturn(new ServiceSession__c(ServiceSchedule__c = scheduleId))
            .build();

        service.deliverySelector = (ServiceDeliverySelector) deliverySelectorStub.create();

        Test.startTest();
        System.assertEquals(
            deliveriesToReturn,
            service.generateRoster(deliveriesToReturn[0].ServiceSession__c),
            'Expected only the service deliveries returned by the selector.'
        );
        Test.stopTest();

        deliverySelectorStub.assertCalledAsExpected();
    }

    @IsTest
    private static void getRosterShouldReturnParticipantsAsDeliveries() {
        Id sessionId = TestUtil.mockId(ServiceSession__c.SObjectType);
        Id scheduleId = TestUtil.mockId(ServiceSchedule__c.SObjectType);
        Id serviceId = TestUtil.mockId(Service__c.SObjectType);
        List<ServiceParticipant__c> participantsToReturn = new List<ServiceParticipant__c>{
            createMockParticipant(),
            createMockParticipant()
        };
        List<ServiceDelivery__c> actualDeliveries;
        deliverySelectorStub = new StubBuilder(ServiceDeliverySelector.class)
            .when('getServiceDeliveriesBySessionId', Id.class)
            .calledWith(sessionId)
            .thenReturn(new List<ServiceDelivery__c>())
            .when('getServiceParticipantsByScheduleId', Id.class, Set<Id>.class)
            .calledWith(scheduleId, new Set<Id>())
            .thenReturn(participantsToReturn)
            .when('getSession', Id.class)
            .calledWith(sessionId)
            .thenReturn(
                new ServiceSession__c(
                    Id = sessionId,
                    ServiceSchedule__c = scheduleId,
                    ServiceSchedule__r = new ServiceSchedule__c(Service__c = serviceId)
                )
            )
            .build();

        service.deliverySelector = (ServiceDeliverySelector) deliverySelectorStub.create();

        Test.startTest();
        actualDeliveries = service.generateRoster(sessionId);
        Test.stopTest();

        System.assertEquals(
            participantsToReturn.size(),
            actualDeliveries.size(),
            'Expected only the service participants returned by the selector as service deliveries.'
        );

        for (Integer i = 0; i < participantsToReturn.size(); i++) {
            System.assertEquals(
                participantsToReturn[i].Contact__c,
                actualDeliveries[i].Contact__c,
                'Expected the contact id to have been copied from the particpant.'
            );
            System.assertEquals(
                serviceId,
                actualDeliveries[i].Service__c,
                'Expected the service id to have been copied from the Session via the Schedule.'
            );
            System.assertEquals(
                participantsToReturn[i].ProgramEngagement__c,
                actualDeliveries[i].ProgramEngagement__c,
                'Expected the program engagement id to have been copied from the particpant.'
            );
            System.assertEquals(
                sessionId,
                actualDeliveries[i].ServiceSession__c,
                'Expected the session id to have been set.'
            );
        }

        deliverySelectorStub.assertCalledAsExpected();
    }

    @IsTest
    private static void getRosterShouldCombineDeliveriesAndParticipants() {
        Id sessionId = TestUtil.mockId(ServiceSession__c.SObjectType);
        Id scheduleId = TestUtil.mockId(ServiceSchedule__c.SObjectType);
        List<ServiceDelivery__c> deliveriesToReturn = new List<ServiceDelivery__c>{
            createMockDelivery()
        };
        List<ServiceParticipant__c> participantsToReturn = new List<ServiceParticipant__c>{
            createMockParticipant(),
            createMockParticipant()
        };
        List<ServiceDelivery__c> actualDeliveries;

        deliverySelectorStub = new StubBuilder(ServiceDeliverySelector.class)
            .when('getServiceDeliveriesBySessionId', Id.class)
            .calledWith(sessionId)
            .thenReturn(deliveriesToReturn)
            .when('getServiceParticipantsByScheduleId', Id.class, Set<Id>.class)
            .calledWith(scheduleId, new Set<Id>{ deliveriesToReturn[0].Contact__c })
            .thenReturn(participantsToReturn)
            .when('getSession', Id.class)
            .calledWith(sessionId)
            .thenReturn(new ServiceSession__c(ServiceSchedule__c = scheduleId))
            .build();

        service.deliverySelector = (ServiceDeliverySelector) deliverySelectorStub.create();

        Test.startTest();
        actualDeliveries = service.generateRoster(sessionId);
        Test.stopTest();

        System.assertEquals(
            participantsToReturn.size() + deliveriesToReturn.size(),
            actualDeliveries.size(),
            'Expected participants returned by the selector as service deliveries with the existing service deliveries to be returned.'
        );

        deliverySelectorStub.assertCalledAsExpected();
    }

    @IsTest
    private static void shouldCallDomainToUpsert() {
        List<ServiceDelivery__c> deliveries = new List<ServiceDelivery__c>();
        domainStub = new StubBuilder(ServiceDeliveryDomain.class)
            .when('upsertServiceDeliveries', List<ServiceDelivery__c>.class)
            .calledWith(deliveries)
            .thenReturn()
            .build();
        service.domain = (ServiceDeliveryDomain) domainStub.create();

        Test.startTest();
        service.upsertServiceDeliveries(deliveries);
        Test.stopTest();

        domainStub.assertCalledAsExpected();
    }

    @IsTest
    private static void shouldRollbackAndRethrowDomainException() {
        List<ServiceDelivery__c> deliveries = new List<ServiceDelivery__c>();
        Exception actualException;
        Integer dmlLimitBefore;
        Integer dmlLimitAfter;

        domainStub = new StubBuilder(ServiceDeliveryDomain.class)
            .when('upsertServiceDeliveries', List<ServiceDelivery__c>.class)
            .calledWith(deliveries)
            .thenThrowException()
            .build();
        service.domain = (ServiceDeliveryDomain) domainStub.create();

        Test.startTest();
        try {
            dmlLimitBefore = System.Limits.getDmlStatements();
            service.upsertServiceDeliveries(deliveries);
        } catch (Exception ex) {
            actualException = ex;
            dmlLimitAfter = System.Limits.getDmlStatements();
        }

        Test.stopTest();

        System.assert(
            actualException instanceof ServiceDeliveryService.ServiceDeliveryException,
            'Expected the service to catch and rethrow the exception.'
        );

        System.assertEquals(
            2,
            dmlLimitAfter - dmlLimitBefore,
            'Expected a dml statement for the save point and the rollback.'
        );

        domainStub.assertCalledAsExpected();
    }

    @IsTest
    private static void shouldCallPermissionValidator() {
        permValidatorStub = new StubBuilder(PermissionValidator.class)
            .when('hasFLSAccessForFields', List<Schema.SObjectField>.class, String.class)
            .signatureMatches()
            .thenReturn(true)
            .when(
                'hasObjectAccess',
                SObjectType.class,
                PermissionValidator.CRUDAccessType.class
            )
            .signatureMatches()
            .thenReturn(true)
            .build();

        PermissionValidator.instance = (PermissionValidator) permValidatorStub.create();

        Map<String, Boolean> expected = new Map<String, Boolean>{
            'read' => true,
            'write' => true
        };

        Test.startTest();
        Map<String, Boolean> actual = service.checkFieldPermissions();
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'Field permissions not returned from Perm Validator as expected.'
        );

        permValidatorStub.assertCalledAsExpected();
    }

    ////////// Functional Tests //////////

    @IsTest
    private static void functionalGenerateRosterWithExistingDelivery() {
        List<ServiceDelivery__c> actualDeliveries;
        TestDataFactory.generateAttendanceData('Monthly');
        ServiceSession__c session = [
            SELECT Id, ServiceSchedule__c
            FROM ServiceSession__c
            LIMIT 1
        ];

        Test.startTest();
        actualDeliveries = service.generateRoster(session.Id);
        Test.stopTest();

        Integer countParticipants = [
            SELECT COUNT()
            FROM ServiceParticipant__c
            WHERE ServiceSchedule__c = :session.ServiceSchedule__c
        ];
        System.assert(
            countParticipants > 0 &&
            countParticipants == actualDeliveries.size(),
            'Expected service deliveries returned for each of the participants.'
        );

        Integer countIds = 0;
        Integer countExistingDeliveries = [
            SELECT COUNT()
            FROM ServiceDelivery__c
            WHERE ServiceSession__c = :session.Id
        ];

        for (ServiceDelivery__c delivery : actualDeliveries) {
            if (delivery.Id == null) {
                continue;
            }
            countIds++;
        }

        System.assert(
            countIds > 0 &&
            countIds < countParticipants &&
            countIds == countExistingDeliveries,
            'Expected the Ids of the existing Service Deliveries to be returned.'
        );
    }

    ////////// Helpers //////////

    private static ServiceDelivery__c createMockDelivery() {
        return new ServiceDelivery__c(
            Id = TestUtil.mockId(ServiceDelivery__c.SObjectType),
            Contact__c = TestUtil.mockId(Contact.SObjectType),
            ProgramEngagement__c = TestUtil.mockId(ProgramEngagement__c.SObjectType),
            Service__c = TestUtil.mockId(Service__c.SObjectType),
            ServiceSession__c = TestUtil.mockId(ServiceSession__c.SObjectType),
            Quantity__c = 3,
            AttendanceStatus__c = 'Attended'
        );
    }

    private static ServiceParticipant__c createMockParticipant() {
        return new ServiceParticipant__c(
            Id = TestUtil.mockId(ServiceParticipant__c.SObjectType),
            Contact__c = TestUtil.mockId(Contact.SObjectType),
            ProgramEngagement__c = TestUtil.mockId(ProgramEngagement__c.SObjectType)
        );
    }
}
