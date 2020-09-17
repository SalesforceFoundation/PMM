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
    private static void shouldGetSessions() {
        String methodName = 'getSessions';
        ServiceSchedule__c schedule = new ServiceSchedule__c();
        List<ServiceSession__c> expected = new List<ServiceSession__c>();

        serviceStub.withReturnValue(methodName, ServiceSchedule__c.class, expected);

        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();

        Test.startTest();
        List<ServiceSession__c> actual = ServiceScheduleCreatorController.getSessions(
            schedule
        );
        Test.stopTest();

        serviceStub.assertCalledWith(methodName, ServiceSchedule__c.class, schedule);
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
    private static void rethrowsErrorFromGetSessionsOnService() {
        String methodName = 'getSessions';
        ServiceSchedule__c schedule = new ServiceSchedule__c();
        Exception actualException;

        serviceStub.withThrowException(methodName, ServiceSchedule__c.class);

        ServiceScheduleCreatorController.service = (ServiceScheduleService) serviceStub.createMock();

        Test.startTest();
        try {
            ServiceScheduleCreatorController.getSessions(schedule);
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
}
