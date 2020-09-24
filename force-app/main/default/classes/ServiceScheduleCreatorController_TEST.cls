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
    private static void shouldProcessSchedule() {
        String methodName = 'processSchedule';
        ServiceScheduleModel expected = new ServiceScheduleModel();
        ServiceScheduleModel model = new ServiceScheduleModel();

        serviceStub.withReturnValue(methodName, ServiceScheduleModel.class, expected);

        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();

        Test.startTest();
        ServiceScheduleModel actual = ServiceScheduleCreatorController.processSchedule(
            model
        );
        Test.stopTest();

        serviceStub.assertCalledWith(methodName, ServiceScheduleModel.class, model);
        System.assertEquals(
            expected,
            actual,
            'Sessions not passed back from Service as expected.'
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
        Test.stopTest();

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
        Test.stopTest();

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
    private static void rethrowsErrorFromProcessScheduleOnService() {
        String methodName = 'processSchedule';
        ServiceScheduleModel model = new ServiceScheduleModel();
        ServiceScheduleModel expected = new ServiceScheduleModel();
        Exception actualException;

        serviceStub.withThrowException(methodName, ServiceScheduleModel.class);

        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();

        ServiceScheduleModel actual;
        Test.startTest();
        try {
            actual = ServiceScheduleCreatorController.processSchedule(model);
        } catch (Exception ex) {
            actualException = ex;
        }
        Test.stopTest();

        System.assert(
            actualException instanceof AuraHandledException,
            actualException.getTypeName() + ': Expected an aura handled exception.'
        );
        System.assertEquals(
            serviceStub.testExceptionMessage,
            actualException.getMessage(),
            'Expected the stub test exception message to have been thrown.'
        );
        serviceStub.assertCalledWith(methodName, ServiceScheduleModel.class, model);
        System.assertEquals(null, actual);
    }

    @IsTest
    private static void testGetSelectParticipantModel() {
        Id serviceId = TestUtil.mockId(Service__c.SObjectType);
        SelectParticipantModel modelToReturn = new SelectParticipantModel();
        String methodName = 'getSelectParticipantModel';

        serviceStub.withReturnValue(methodName, Id.class, modelToReturn);

        Test.startTest();

        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();

        SelectParticipantModel actual = ServiceScheduleCreatorController.getSelectParticipantModel(
            serviceId
        );

        Test.stopTest();

        System.assertNotEquals(
            null,
            actual,
            'Expected that actual participant model is not null'
        );
        System.assertEquals(
            true,
            modelToReturn === actual,
            'Expected the model returned from the service is what is returned by the controller'
        );

        serviceStub.assertCalledWith(methodName, Id.class, serviceId);
    }

    @IsTest
    private static void testGetSelectParticipantModelException() {
        Id serviceId = TestUtil.mockId(Service__c.SObjectType);
        String methodName = 'getSelectParticipantModel';
        SelectParticipantModel actual;
        Exception actualException;

        serviceStub.withThrowException(methodName, Id.class);
        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();

        Test.startTest();
        try {
            actual = ServiceScheduleCreatorController.getSelectParticipantModel(
                serviceId
            );
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
