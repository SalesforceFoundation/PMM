@IsTest
public with sharing class AttendanceService_TEST {
    private static BasicStub attendanceSelectorStub = new BasicStub(
        AttendanceSelector.class
    );

    private static AttendanceService service = new AttendanceService();

    @IsTest
    private static void getRosterShouldCallSelector() {
        String getServiceDeliveriesByServiceId = 'getServiceDeliveriesByServiceId';
        String getServiceParticipantsByServiceId = 'getServiceParticipantsByServiceId';
        Id serviceId = TestUtil.mockId(Service__c.SObjectType);
        service.attendanceSelector = (AttendanceSelector) attendanceSelectorStub.createMock();
        attendanceSelectorStub.withReturnValue(
            getServiceDeliveriesByServiceId,
            Id.class,
            new List<ServiceDelivery__c>()
        );
        attendanceSelectorStub.withReturnValue(
            getServiceParticipantsByServiceId,
            new List<Type>{ Id.class, Set<Id>.class },
            new List<ServiceParticipant__c>()
        );

        Test.startTest();
        service.generateRoster(serviceId);
        Test.stopTest();

        attendanceSelectorStub.assertCalledWith(
            getServiceDeliveriesByServiceId,
            Id.class,
            serviceId
        );

        attendanceSelectorStub.assertCalledWith(
            getServiceParticipantsByServiceId,
            new List<Type>{ Id.class, Set<Id>.class },
            new List<Object>{ serviceId, new Set<Id>() }
        );
    }

    @IsTest
    private static void getRosterShouldReturnExistingDeliveries() {
        String getServiceDeliveriesByServiceId = 'getServiceDeliveriesByServiceId';
        String getServiceParticipantsByServiceId = 'getServiceParticipantsByServiceId';
        Id serviceId = TestUtil.mockId(Service__c.SObjectType);
    }
}
