@IsTest
public with sharing class ServiceScheduleService_TEST {
    private static ServiceScheduleService service = new ServiceScheduleService();
    private static BasicStub domainStub = new BasicStub(ServiceScheduleDomain.class);

    @TestSetup
    private static void setupTestData() {
        ProgramTestDataFactory.insertTestData(true);
    }

    @IsTest
    private static void shouldReturnModel() {
        ServiceScheduleModel expectedModel = new ServiceScheduleModel();

        Test.startTest();
        ServiceScheduleModel actualModel = service.getServiceScheduleModel();
        Test.stopTest();

        System.assertEquals(
            String.valueOf(expectedModel),
            String.valueOf(actualModel),
            'Expected the service to return a new service schedule model.'
        );

        System.assertEquals(
            String.valueOf(new ServiceSchedule__c()),
            String.valueOf(actualModel.serviceSchedule),
            'Expected the model to have a new service schedule record.'
        );
        System.assert(
            actualModel.serviceSessions.isEmpty(),
            'Expected the model to return an empty list of service sessions.'
        );
        System.assert(
            actualModel.serviceParticipants.isEmpty(),
            'Expected the model to return an empty list of service participants.'
        );
    }

    @IsTest
    private static void shouldProvideModelToDomainOnPersist() {
        String methodName = 'insertModel';
        ServiceScheduleModel model = new ServiceScheduleModel();
        service.domain = (ServiceScheduleDomain) domainStub.createMock();

        Test.startTest();
        service.persist(model);
        Test.stopTest();

        domainStub.assertCalledWith(methodName, ServiceScheduleModel.class, model);
    }

    @IsTest
    private static void shouldRollbackAndRethrowDomainException() {
        String methodName = 'insertModel';
        ServiceScheduleModel model = new ServiceScheduleModel();
        Exception actualException;
        Integer dmlLimitBefore;
        Integer dmlLimitAfter;
        model.serviceSchedule = new ServiceSchedule__c();
        domainStub.withThrowException(methodName, ServiceScheduleModel.class);
        service.domain = (ServiceScheduleDomain) domainStub.createMock();

        Test.startTest();
        try {
            dmlLimitBefore = System.Limits.getDmlStatements();
            service.persist(model);
        } catch (Exception ex) {
            actualException = ex;
            dmlLimitAfter = System.Limits.getDmlStatements();
        }

        Test.stopTest();

        System.assert(
            actualException instanceof ServiceScheduleService.ServiceScheduleServiceException,
            'Expected the service to catch and rethrow the exception.'
        );

        System.assertEquals(
            2,
            dmlLimitAfter - dmlLimitBefore,
            'Expected a dml statement for the save point and the rollback.'
        );

        domainStub.assertCalledWith(methodName, ServiceScheduleModel.class, model);
    }
}
