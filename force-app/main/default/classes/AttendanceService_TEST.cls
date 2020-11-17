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
    private static BasicStub attendanceSelectorStub = new BasicStub(
        AttendanceSelector.class
    );
    private static BasicStub domainStub = new BasicStub(ServiceDeliveryDomain.class);
    private static BasicStub permValidatorStub = new BasicStub(PermissionValidator.class);

    private static AttendanceService service = new AttendanceService();

    @IsTest
    private static void getRosterShouldCallSelector() {
        String getServiceDeliveriesBySessionId = 'getServiceDeliveriesBySessionId';
        String getServiceParticipantsByScheduleId = 'getServiceParticipantsByScheduleId';
        String getSession = 'getSession';
        Id sessionId = TestUtil.mockId(ServiceSession__c.SObjectType);
        Id scheduleId = TestUtil.mockId(ServiceSchedule__c.SObjectType);
        service.attendanceSelector = (AttendanceSelector) attendanceSelectorStub.createMock();
        attendanceSelectorStub.withReturnValue(
            getServiceDeliveriesBySessionId,
            Id.class,
            new List<ServiceDelivery__c>()
        );
        attendanceSelectorStub.withReturnValue(
            getServiceParticipantsByScheduleId,
            new List<Type>{ Id.class, Set<Id>.class },
            new List<ServiceParticipant__c>()
        );
        attendanceSelectorStub.withReturnValue(
            getSession,
            Id.class,
            new ServiceSession__c(ServiceSchedule__c = scheduleId)
        );

        Test.startTest();
        service.generateRoster(sessionId);
        Test.stopTest();

        attendanceSelectorStub.assertCalledWith(
            getServiceDeliveriesBySessionId,
            Id.class,
            sessionId
        );

        attendanceSelectorStub.assertCalledWith(
            getServiceParticipantsByScheduleId,
            new List<Type>{ Id.class, Set<Id>.class },
            new List<Object>{ scheduleId, new Set<Id>() }
        );
    }

    @IsTest
    private static void getRosterShouldReturnExistingDeliveries() {
        String getServiceDeliveriesBySessionId = 'getServiceDeliveriesBySessionId';
        String getServiceParticipantsByScheduleId = 'getServiceParticipantsByScheduleId';
        String getSession = 'getSession';
        List<ServiceDelivery__c> deliveriesToReturn = new List<ServiceDelivery__c>{
            createMockDelivery()
        };
        Id scheduleId = TestUtil.mockId(ServiceSchedule__c.SObjectType);

        service.attendanceSelector = (AttendanceSelector) attendanceSelectorStub.createMock();
        attendanceSelectorStub.withReturnValue(
            getServiceDeliveriesBySessionId,
            Id.class,
            deliveriesToReturn
        );
        attendanceSelectorStub.withReturnValue(
            getServiceParticipantsByScheduleId,
            new List<Type>{ Id.class, Set<Id>.class },
            new List<ServiceParticipant__c>()
        );
        attendanceSelectorStub.withReturnValue(
            getSession,
            Id.class,
            new ServiceSession__c(ServiceSchedule__c = scheduleId)
        );

        Test.startTest();
        System.assertEquals(
            deliveriesToReturn,
            service.generateRoster(deliveriesToReturn[0].ServiceSession__c),
            'Expected only the service deliveries returned by the selector.'
        );
        Test.stopTest();

        attendanceSelectorStub.assertCalledWith(
            getServiceParticipantsByScheduleId,
            new List<Type>{ Id.class, Set<Id>.class },
            new List<Object>{
                scheduleId,
                new Set<Id>{ deliveriesToReturn[0].Contact__c }
            }
        );
    }

    @IsTest
    private static void getRosterShouldReturnParticipantsAsDeliveries() {
        String getServiceDeliveriesBySessionId = 'getServiceDeliveriesBySessionId';
        String getServiceParticipantsByScheduleId = 'getServiceParticipantsByScheduleId';
        String getSession = 'getSession';
        Id sessionId = TestUtil.mockId(ServiceSession__c.SObjectType);
        Id scheduleId = TestUtil.mockId(ServiceSchedule__c.SObjectType);
        Id serviceId = TestUtil.mockId(Service__c.SObjectType);
        List<ServiceParticipant__c> participantsToReturn = new List<ServiceParticipant__c>{
            createMockParticipant(),
            createMockParticipant()
        };
        List<ServiceDelivery__c> actualDeliveries;

        service.attendanceSelector = (AttendanceSelector) attendanceSelectorStub.createMock();
        attendanceSelectorStub.withReturnValue(
            getServiceDeliveriesBySessionId,
            Id.class,
            new List<ServiceDelivery__c>()
        );
        attendanceSelectorStub.withReturnValue(
            getServiceParticipantsByScheduleId,
            new List<Type>{ Id.class, Set<Id>.class },
            participantsToReturn
        );
        attendanceSelectorStub.withReturnValue(
            getSession,
            Id.class,
            new ServiceSession__c(
                Id = sessionId,
                ServiceSchedule__c = scheduleId,
                ServiceSchedule__r = new ServiceSchedule__c(Service__c = serviceId)
            )
        );

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

        attendanceSelectorStub.assertCalledWith(
            getServiceParticipantsByScheduleId,
            new List<Type>{ Id.class, Set<Id>.class },
            new List<Object>{ scheduleId, new Set<Id>{} }
        );
    }

    @IsTest
    private static void getRosterShouldCombineDeliveriesAndParticipants() {
        String getServiceDeliveriesBySessionId = 'getServiceDeliveriesBySessionId';
        String getServiceParticipantsByScheduleId = 'getServiceParticipantsByScheduleId';
        String getSession = 'getSession';
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

        service.attendanceSelector = (AttendanceSelector) attendanceSelectorStub.createMock();
        attendanceSelectorStub.withReturnValue(
            getServiceDeliveriesBySessionId,
            Id.class,
            deliveriesToReturn
        );
        attendanceSelectorStub.withReturnValue(
            getServiceParticipantsByScheduleId,
            new List<Type>{ Id.class, Set<Id>.class },
            participantsToReturn
        );
        attendanceSelectorStub.withReturnValue(
            getSession,
            Id.class,
            new ServiceSession__c(ServiceSchedule__c = scheduleId)
        );

        Test.startTest();
        actualDeliveries = service.generateRoster(sessionId);
        Test.stopTest();

        System.assertEquals(
            participantsToReturn.size() + deliveriesToReturn.size(),
            actualDeliveries.size(),
            'Expected participants returned by the selector as service deliveries with the existing service deliveries to be returned.'
        );
    }

    @IsTest
    private static void functionalGenerateRosterWithExistingDelivery() {
        List<ServiceDelivery__c> actualDeliveries;
        TestDataFactory.generateAttendanceData();
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
        String methodName = 'upsertServiceDeliveries';
        List<ServiceDelivery__c> deliveries = new List<ServiceDelivery__c>();
        service.domain = (ServiceDeliveryDomain) domainStub.createMock();

        Test.startTest();
        service.upsertServiceDeliveries(deliveries);
        Test.stopTest();

        domainStub.assertCalledWith(
            methodName,
            List<ServiceDelivery__c>.class,
            deliveries
        );
    }

    @IsTest
    private static void shouldRollbackAndRethrowDomainException() {
        String methodName = 'upsertServiceDeliveries';
        List<ServiceDelivery__c> deliveries = new List<ServiceDelivery__c>();
        Exception actualException;
        Integer dmlLimitBefore;
        Integer dmlLimitAfter;
        domainStub.withThrowException(methodName, List<ServiceDelivery__c>.class);
        service.domain = (ServiceDeliveryDomain) domainStub.createMock();

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

        domainStub.assertCalledWith(
            methodName,
            List<ServiceDelivery__c>.class,
            deliveries
        );
    }

    @IsTest
    private static void shouldCallPermissionValidator() {
        String methodName = 'hasFLSAccessForFields';
        permValidatorStub.withReturnValue(
            methodName,
            new List<Type>{ String.class, List<String>.class, String.class },
            true
        );
        service.permValidator = (PermissionValidator) permValidatorStub.createMock();

        Map<String, Boolean> expected = new Map<String, Boolean>{
            'read' => true,
            'write' => true
        };

        Test.startTest();
        Map<String, Boolean> actual = service.checkFieldPermissions();
        Test.stopTest();

        permValidatorStub.assertCalled(
            methodName,
            new List<Type>{ String.class, List<String>.class, String.class }
        );
        System.assertEquals(expected, actual);
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
