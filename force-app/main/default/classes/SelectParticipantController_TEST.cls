@isTest
public with sharing class SelectParticipantController_TEST {
    private static BasicStub serviceStub = new BasicStub(SelectParticipantService.class);

    @isTest
    private static void testGetInitialDataSetup() {
        final Id serviceId = TestUtil.mockId(Service__c.SObjectType);
        final SelectParticipantService.InitialDataAndSetup expected = new SelectParticipantService.InitialDataAndSetup();

        serviceStub.withReturnValue('getInitialDataSetup', Id.class, expected);

        Test.startTest();

        SelectParticipantController.selectParticipantService = (SelectParticipantService) serviceStub.createMock();

        final SelectParticipantService.InitialDataAndSetup actual = SelectParticipantController.getInitialDataSetup(
            serviceId
        );

        Test.stopTest();

        System.assertNotEquals(null, actual, 'Expected that actual is not null');
        System.assertEquals(
            true,
            expected === actual,
            'Expected that actual and expected reference the same exact memory location'
        );

        serviceStub.assertCalledWith('getInitialDataSetup', Id.class, serviceId);
    }

    @isTest
    private static void testGetInitialDataSetupException() {
        final Id serviceId = TestUtil.mockId(Service__c.SObjectType);
        serviceStub.withThrowException('getInitialDataSetup', Id.class);

        Test.startTest();
        SelectParticipantController.selectParticipantService = (SelectParticipantService) serviceStub.createMock();

        final SelectParticipantService.InitialDataAndSetup actual;
        Exception actualException;

        try {
            actual = SelectParticipantController.getInitialDataSetup(serviceId);
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

        serviceStub.assertCalledWith('getInitialDataSetup', Id.class, serviceId);
    }
}
