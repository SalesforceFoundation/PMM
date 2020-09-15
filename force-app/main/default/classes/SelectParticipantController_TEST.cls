@isTest
public with sharing class SelectParticipantController_TEST {
    private static BasicStub serviceStub = new BasicStub(SelectParticipantService.class);

    @IsTest
    private static void testGetSelectParticipantModel() {
        final Id serviceId = TestUtil.mockId(Service__c.SObjectType);
        final SelectParticipantService.SelectParticipantModel modelToReturn = new SelectParticipantService.SelectParticipantModel();
        final String methodName = 'getSelectParticipantModel';

        serviceStub.withReturnValue(methodName, Id.class, modelToReturn);

        Test.startTest();

        SelectParticipantController.selectParticipantService = (SelectParticipantService) serviceStub.createMock();

        final SelectParticipantService.SelectParticipantModel actual = SelectParticipantController.getSelectParticipantModel(
            serviceId
        );

        Test.stopTest();

        System.assertNotEquals(null, actual, 'Expected that actual is not null');
        System.assertEquals(
            true,
            modelToReturn === actual,
            'Expected the model returned from the service is what is returned by the controller'
        );

        serviceStub.assertCalledWith(methodName, Id.class, serviceId);
    }

    @IsTest
    private static void testGetSelectParticipantModelException() {
        final Id serviceId = TestUtil.mockId(Service__c.SObjectType);
        final String methodName = 'getSelectParticipantModel';

        serviceStub.withThrowException(methodName, Id.class);
        Test.startTest();
        SelectParticipantController.SelectParticipantService = (SelectParticipantService) serviceStub.createMock();

        final SelectParticipantService.SelectParticipantModel actual;
        Exception actualException;

        try {
            actual = SelectParticipantController.getSelectParticipantModel(serviceId);
        } catch (Exception e) {
            actualException = e;
        }
        Test.stopTest();

        System.assertEquals(
            serviceStub.testExceptionMessage,
            actualException.getMessage(),
            'Expected the controller to throw the exception from the service.'
        );

        System.assertEquals(null, actual, 'Expected that the actual value is null');

        serviceStub.assertCalledWith(methodName, Id.class, serviceId);
    }
}
