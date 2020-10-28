@IsTest
public with sharing class AttendanceService_TEST {
    private static BasicStub attendanceSelectorStub = new BasicStub(
        AttendanceSelector.class
    );

    private static AttendanceService service = new AttendanceService();

    @IsTest
    private static void getRosterShouldCallSelector() {
        String getServiceDeliveriesBySessionId = 'getServiceDeliveriesBySessionId';
        String getServiceParticipantsBySessionId = 'getServiceParticipantsBySessionId';
        Id sessionId = TestUtil.mockId(ServiceSession__c.SObjectType);
        service.attendanceSelector = (AttendanceSelector) attendanceSelectorStub.createMock();
        attendanceSelectorStub.withReturnValue(
            getServiceDeliveriesBySessionId,
            Id.class,
            new List<ServiceDelivery__c>()
        );
        attendanceSelectorStub.withReturnValue(
            getServiceParticipantsBySessionId,
            new List<Type>{ Id.class, Set<Id>.class },
            new List<ServiceParticipant__c>()
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
            getServiceParticipantsBySessionId,
            new List<Type>{ Id.class, Set<Id>.class },
            new List<Object>{ sessionId, new Set<Id>() }
        );
    }

    @IsTest
    private static void getRosterShouldReturnExistingDeliveries() {
        String getServiceDeliveriesBySessionId = 'getServiceDeliveriesBySessionId';
        String getServiceParticipantsBySessionId = 'getServiceParticipantsBySessionId';
        List<ServiceDelivery__c> deliveriesToReturn = new List<ServiceDelivery__c>{
            createMockDelivery()
        };

        service.attendanceSelector = (AttendanceSelector) attendanceSelectorStub.createMock();
        attendanceSelectorStub.withReturnValue(
            getServiceDeliveriesBySessionId,
            Id.class,
            deliveriesToReturn
        );
        attendanceSelectorStub.withReturnValue(
            getServiceParticipantsBySessionId,
            new List<Type>{ Id.class, Set<Id>.class },
            new List<ServiceParticipant__c>()
        );

        Test.startTest();
        System.assertEquals(
            deliveriesToReturn,
            service.generateRoster(deliveriesToReturn[0].ServiceSession__c),
            'Expected only the service deliveries returned by the selector.'
        );
        Test.stopTest();

        attendanceSelectorStub.assertCalledWith(
            getServiceParticipantsBySessionId,
            new List<Type>{ Id.class, Set<Id>.class },
            new List<Object>{
                deliveriesToReturn[0].ServiceSession__c,
                new Set<Id>{ deliveriesToReturn[0].Contact__c }
            }
        );
    }

    @IsTest
    private static void getRosterShouldReturnParticipantsAsDeliveries() {
        String getServiceDeliveriesBySessionId = 'getServiceDeliveriesBySessionId';
        String getServiceParticipantsBySessionId = 'getServiceParticipantsBySessionId';
        Id sessionId = TestUtil.mockId(ServiceSession__c.SObjectType);
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
            getServiceParticipantsBySessionId,
            new List<Type>{ Id.class, Set<Id>.class },
            participantsToReturn
        );

        Test.startTest();
        actualDeliveries = service.generateRoster(sessionId);
        Test.stopTest();

        System.assertEquals(
            participantsToReturn.size(),
            actualDeliveries.size(),
            'Expected only the service participants returned by the selector as service deliveries.'
        );
        System.assertEquals(
            participantsToReturn[0].Contact__c,
            actualDeliveries[0].Contact__c,
            'Expected the contact id to have been copied from the particpant.'
        );
        System.assertEquals(
            participantsToReturn[0].Service__c,
            actualDeliveries[0].Service__c,
            'Expected the service id to have been copied from the particpant.'
        );
        System.assertEquals(
            participantsToReturn[0].ProgramEngagement__c,
            actualDeliveries[0].ProgramEngagement__c,
            'Expected the program engagement id to have been copied from the particpant.'
        );
        System.assertEquals(
            sessionId,
            actualDeliveries[0].ServiceSession__c,
            'Expected the session id to have been set.'
        );

        System.assertEquals(
            participantsToReturn[1].Contact__c,
            actualDeliveries[1].Contact__c,
            'Expected the contact id to have been copied from the particpant.'
        );
        System.assertEquals(
            participantsToReturn[1].Service__c,
            actualDeliveries[1].Service__c,
            'Expected the service id to have been copied from the particpant.'
        );
        System.assertEquals(
            participantsToReturn[1].ProgramEngagement__c,
            actualDeliveries[1].ProgramEngagement__c,
            'Expected the program engagement id to have been copied from the particpant.'
        );
        System.assertEquals(
            sessionId,
            actualDeliveries[1].ServiceSession__c,
            'Expected the session id to have been set.'
        );

        attendanceSelectorStub.assertCalledWith(
            getServiceParticipantsBySessionId,
            new List<Type>{ Id.class, Set<Id>.class },
            new List<Object>{ sessionId, new Set<Id>{} }
        );
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
            ProgramEngagement__c = TestUtil.mockId(ProgramEngagement__c.SObjectType),
            Service__c = TestUtil.mockId(Service__c.SObjectType)
        );
    }
}
