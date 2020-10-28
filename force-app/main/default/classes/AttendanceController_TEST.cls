@IsTest
public with sharing class AttendanceController_TEST {
    private static BasicStub serviceStub = new BasicStub(AttendanceService.class);

    @IsTest
    private static void shouldReturnServiceDeliveriesFromService() {
        String generateRoster = 'generateRoster';
        List<ServiceDelivery__c> serviceDeliveriesToReturn = new List<ServiceDelivery__c>();
        serviceStub.withReturnValue(generateRoster, Id.class, serviceDeliveriesToReturn);
        Id serviceId = TestUtil.mockId(Service__c.SObjectType);
        AttendanceController.service = (AttendanceService) serviceStub.createMock();

        Test.startTest();
        System.assert(
            serviceDeliveriesToReturn === AttendanceController.generateRoster(serviceId),
            'Expected the controller to return the list returned by the service.'
        );
        Test.stopTest();

        serviceStub.assertCalledWith(generateRoster, Id.class, serviceId);
    }
}
