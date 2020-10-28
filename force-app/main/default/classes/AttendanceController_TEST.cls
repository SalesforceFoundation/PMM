@IsTest
public with sharing class AttendanceController_TEST {
    private static BasicStub serviceStub = new BasicStub(AttendanceService.class);

    @IsTest
    private static void shouldReturnServiceDeliveriesFromService() {
        String generateRoster = 'generateRoster';
        List<ServiceDelivery__c> serviceDeliveriesToReturn = new List<ServiceDelivery__c>();
        serviceStub.withReturnValue(generateRoster, Id.class, serviceDeliveriesToReturn);
        Id sessionId = TestUtil.mockId(ServiceSession__c.SObjectType);
        AttendanceController.service = (AttendanceService) serviceStub.createMock();

        Test.startTest();
        System.assert(
            serviceDeliveriesToReturn === AttendanceController.generateRoster(sessionId),
            'Expected the controller to return the list returned by the service.'
        );
        Test.stopTest();

        serviceStub.assertCalledWith(generateRoster, Id.class, sessionId);
    }
}