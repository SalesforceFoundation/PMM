/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class AttendanceService_TEST {
    private static Stub selectorStub = new Stub(AttendanceSelector.class);
    private static Stub.Signature getServiceParticipantsByScheduleId = new Stub.Signature(
        'getServiceParticipantsByScheduleId',
        new List<Type>{ Id.class, Set<Id>.class }
    );
    private static Stub.Signature getServiceDeliveriesBySessionId = new Stub.Signature(
        'getServiceDeliveriesBySessionId',
        Id.class
    );
    private static Stub.Signature getSession = new Stub.Signature('getSession', Id.class);

    private static Stub domainStub = new Stub(ServiceDeliveryDomain.class);
    private static Stub.Signature upsertServiceDeliveries = new Stub.Signature(
        'upsertServiceDeliveries',
        List<ServiceDelivery__c>.class
    );
    private static Stub permValidatorStub = new Stub(PermissionValidator.class);
    private static Stub.Signature hasObjectAccess = new Stub.Signature(
        'hasObjectAccess',
        SObjectType.class,
        PermissionValidator.CRUDAccessType.class
    );
    private static Stub.Signature hasFLSAccessForFields = new Stub.Signature(
        'hasFLSAccessForFields',
        List<Schema.SObjectField>.class,
        String.class
    );

    private static AttendanceService service = new AttendanceService();

    @IsTest
    private static void getRosterShouldCallSelector() {
        Id sessionId = TestUtil.mockId(ServiceSession__c.SObjectType);
        Id scheduleId = TestUtil.mockId(ServiceSchedule__c.SObjectType);

        selectorStub = (new Stub.Builder())
            .forType(AttendanceSelector.class)
            .when('getServiceParticipantsByScheduleId', Id.class, Set<Id>.class)
            .calledWith(sessionId)
            .thenReturn(new List<ServiceParticipant__c>())
            .when('getServiceDeliveriesBySessionId', Id.class)
            .calledWith(scheduleId, new Set<Id>())
            .thenReturn(new List<ServiceDelivery__c>())
            .when('getSession', Id.class)
            .calledWith(sessionId)
            .thenReturn(new ServiceSession__c(ServiceSchedule__c = scheduleId))
            .build();

        service.attendanceSelector = (AttendanceSelector) selectorStub.create();

        Test.startTest();
        service.generateRoster(sessionId);
        Test.stopTest();
    }

    @IsTest
    private static void getRosterShouldReturnExistingDeliveries() {
        List<ServiceDelivery__c> deliveriesToReturn = new List<ServiceDelivery__c>{
            createMockDelivery()
        };
        Id sessionId = deliveriesToReturn[0].ServiceSession__c;
        Id scheduleId = TestUtil.mockId(ServiceSchedule__c.SObjectType);
        Set<Id> contactIds = new Set<Id>{ deliveriesToReturn[0].Contact__c };

        selectorStub
            .when(getServiceDeliveriesBySessionId)
            .calledWith(new List<Object>{ sessionId })
            .thenReturn(deliveriesToReturn);
        selectorStub
            .when(getServiceParticipantsByScheduleId)
            .calledWith(new List<Object>{ scheduleId, contactIds })
            .thenReturn(new List<ServiceParticipant__c>());
        selectorStub
            .when(getSession)
            .calledWith(new List<Object>{ sessionId })
            .thenReturn(new ServiceSession__c(ServiceSchedule__c = scheduleId));
        service.attendanceSelector = (AttendanceSelector) selectorStub.create();

        Test.startTest();
        System.assertEquals(
            deliveriesToReturn,
            service.generateRoster(sessionId),
            'Expected only the service deliveries returned by the selector.'
        );
        Test.stopTest();

        selectorStub.assert();
    }

    @IsTest
    private static void getRosterShouldReturnParticipantsAsDeliveries() {
        List<ServiceParticipant__c> participantsToReturn = new List<ServiceParticipant__c>{
            createMockParticipant(),
            createMockParticipant()
        };
        List<ServiceDelivery__c> actualDeliveries;
        Id sessionId = TestUtil.mockId(ServiceSession__c.SObjectType);
        Id scheduleId = TestUtil.mockId(ServiceSchedule__c.SObjectType);
        Id serviceId = TestUtil.mockId(Service__c.SObjectType);

        selectorStub
            .when(getServiceDeliveriesBySessionId)
            .calledWith(new List<Object>{ sessionId })
            .thenReturn(new List<ServiceDelivery__c>());
        selectorStub
            .when(getServiceParticipantsByScheduleId)
            .calledWith(new List<Object>{ scheduleId, new Set<Id>() })
            .thenReturn(participantsToReturn);
        selectorStub
            .when(getSession)
            .calledWith(new List<Object>{ sessionId })
            .thenReturn(
                new ServiceSession__c(
                    Id = sessionId,
                    ServiceSchedule__c = scheduleId,
                    ServiceSchedule__r = new ServiceSchedule__c(Service__c = serviceId)
                )
            );
        service.attendanceSelector = (AttendanceSelector) selectorStub.create();

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

        selectorStub.assert();
    }

    @IsTest
    private static void getRosterShouldCombineDeliveriesAndParticipants() {
        List<ServiceDelivery__c> deliveriesToReturn = new List<ServiceDelivery__c>{
            createMockDelivery()
        };
        List<ServiceParticipant__c> participantsToReturn = new List<ServiceParticipant__c>{
            createMockParticipant(),
            createMockParticipant()
        };
        List<ServiceDelivery__c> actualDeliveries;
        Id sessionId = deliveriesToReturn[0].ServiceSession__c;
        Id scheduleId = TestUtil.mockId(ServiceSchedule__c.SObjectType);
        Set<Id> contactIds = new Set<Id>{ deliveriesToReturn[0].Contact__c };

        selectorStub
            .when(getServiceDeliveriesBySessionId)
            .calledWith(new List<Object>{ sessionId })
            .thenReturn(deliveriesToReturn);
        selectorStub
            .when(getServiceParticipantsByScheduleId)
            .calledWith(new List<Object>{ scheduleId, contactIds })
            .thenReturn(participantsToReturn);
        selectorStub
            .when(getSession)
            .calledWith(new List<Object>{ sessionId })
            .thenReturn(new ServiceSession__c(ServiceSchedule__c = scheduleId));
        service.attendanceSelector = (AttendanceSelector) selectorStub.create();

        Test.startTest();
        actualDeliveries = service.generateRoster(sessionId);
        Test.stopTest();

        System.assertEquals(
            participantsToReturn.size() + deliveriesToReturn.size(),
            actualDeliveries.size(),
            'Expected participants returned by the selector as service deliveries with the existing service deliveries to be returned.'
        );
        selectorStub.assert();
    }

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

    @IsTest
    private static void shouldCallDomainToUpsert() {
        List<ServiceDelivery__c> deliveries = new List<ServiceDelivery__c>();

        domainStub
            .when(upsertServiceDeliveries)
            .calledWith(new List<Object>{ deliveries })
            .thenReturn(null);

        service.domain = (ServiceDeliveryDomain) domainStub.create();

        Test.startTest();
        service.upsertServiceDeliveries(deliveries);
        Test.stopTest();

        domainStub.assert();
    }

    @IsTest
    private static void shouldRollbackAndRethrowDomainException() {
        List<ServiceDelivery__c> deliveries = new List<ServiceDelivery__c>();
        Exception actualException;
        Integer dmlLimitBefore;
        Integer dmlLimitAfter;
        domainStub
            .when(upsertServiceDeliveries)
            .calledWith(new List<Object>{ deliveries })
            .thenThrowException();
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
            actualException instanceof AttendanceService.ServiceDeliveryException,
            'Expected the service to catch and rethrow the exception.'
        );

        System.assertEquals(
            2,
            dmlLimitAfter - dmlLimitBefore,
            'Expected a dml statement for the save point and the rollback.'
        );

        domainStub.assert();
    }

    @IsTest
    private static void shouldCallPermissionValidator() {
        permValidatorStub.when(hasObjectAccess).calledWithAny().thenReturn(true);
        permValidatorStub.when(hasFLSAccessForFields).calledWithAny().thenReturn(true);
        PermissionValidator.instance = (PermissionValidator) permValidatorStub.create();

        Map<String, Boolean> expected = new Map<String, Boolean>{
            'read' => true,
            'write' => true
        };

        Test.startTest();
        Map<String, Boolean> actual = service.checkFieldPermissions();
        Test.stopTest();

        permValidatorStub.assert();
    }

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
