@IsTest
public with sharing class ServiceScheduleCreatorController_TEST {
    private static BasicStub serviceStub = new BasicStub(ServiceScheduleService.class);

    @IsTest
    private static void shouldGetModelFromService() {
        String methodName = 'getServiceScheduleModel';
        ServiceScheduleModel modelToReturn = new ServiceScheduleModel();

        serviceStub.withReturnValue(methodName, modelToReturn);
        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();

        Test.startTest();
        ServiceScheduleModel actualModel = ServiceScheduleCreatorController.getServiceScheduleModel();
        Test.stopTest();

        System.assertEquals(
            modelToReturn,
            actualModel,
            'Expected the controller to return the model from the Service.'
        );

        serviceStub.assertCalled(methodName);
    }

    @IsTest
    private static void shouldPassModelToServiceOnPersist() {
        String methodName = 'persist';
        ServiceScheduleModel modelToPersist = new ServiceScheduleModel();

        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();

        Test.startTest();
        ServiceScheduleCreatorController.persist(modelToPersist);
        Test.stopTest();

        serviceStub.assertCalledWith(
            methodName,
            ServiceScheduleModel.class,
            modelToPersist
        );
    }

    @IsTest
    private static void rethrowsErrorFromGetModelOnService() {
        String methodName = 'getServiceScheduleModel';
        Exception actualException;

        serviceStub.withThrowException(methodName);
        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();

        Test.startTest();
        try {
            ServiceScheduleCreatorController.getServiceScheduleModel();
        } catch (Exception ex) {
            actualException = ex;
        }

        System.assert(
            actualException instanceof AuraHandledException,
            actualException.getTypeName() + ': Expected an aura handled exception.'
        );
        System.assertEquals(
            serviceStub.testExceptionMessage,
            actualException.getMessage(),
            'Expected the stub test exception message to have been thrown.'
        );
    }

    @IsTest
    private static void rethrowsErrorFromPersistOnService() {
        String methodName = 'persist';
        Exception actualException;

        serviceStub.withThrowException(methodName, ServiceScheduleModel.class);
        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();

        Test.startTest();
        try {
            ServiceScheduleCreatorController.persist(new ServiceScheduleModel());
        } catch (Exception ex) {
            actualException = ex;
        }

        System.assert(
            actualException instanceof AuraHandledException,
            actualException.getTypeName() + ': Expected an aura handled exception.'
        );
        System.assertEquals(
            serviceStub.testExceptionMessage,
            actualException.getMessage(),
            'Expected the stub test exception message to have been thrown.'
        );
    }
}
