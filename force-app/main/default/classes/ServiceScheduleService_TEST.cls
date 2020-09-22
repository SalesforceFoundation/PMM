@IsTest
public with sharing class ServiceScheduleService_TEST {
    private static ServiceScheduleService service = new ServiceScheduleService();
    private static BasicStub domainStub = new BasicStub(ServiceScheduleDomain.class);
    private static BasicStub programEngagementSelectorStub = new BasicStub(
        ProgramEngagementSelector.class
    );

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

    @IsTest
    private static void testGetSelectParticipantModel() {
        final String programEngagementsMethodName = 'getProgramEngagementsByProgramId';
        final String cohortsMethodName = 'getProgramCohortsByProgramId';
        final String programMethodName = 'getProgramByServiceId';

        Id serviceId = TestUtil.mockId(Service__c.SObjectType);
        Id programId = TestUtil.mockId(Program__c.SObjectType);
        Program__c programToReturn = new Program__c(Id = programId);
        List<ProgramCohort__c> programCohortsToReturn = new List<ProgramCohort__c>();
        List<ProgramEngagement__c> programEngagementsToReturn = new List<ProgramEngagement__c>();

        programEngagementSelectorStub.withReturnValue(
            programMethodName,
            Id.class,
            programToReturn
        );

        programEngagementSelectorStub.withReturnValue(
            programEngagementsMethodName,
            Id.class,
            programEngagementsToReturn
        );

        programEngagementSelectorStub.withReturnValue(
            cohortsMethodName,
            Id.class,
            programCohortsToReturn
        );

        service.programEngagementSelector = (ProgramEngagementSelector) programEngagementSelectorStub.createMock();

        Test.startTest();
        SelectParticipantModel actual = service.getSelectParticipantModel(serviceId);
        Test.stopTest();

        System.assertNotEquals(
            null,
            actual,
            'Expected that the actual value is not null'
        );

        System.assertEquals(
            programToReturn,
            actual.program,
            'Expected the model to return the program returned by the selector.'
        );

        System.assertEquals(
            programEngagementsToReturn,
            actual.programEngagements,
            'Expected the model to return the program engagements returned by the selector.'
        );

        System.assertEquals(
            programCohortsToReturn,
            actual.programCohorts,
            'Expected the model to return the program cohorts returned by the selector.'
        );

        System.assert(
            actual.objectLabels.containsKey('program'),
            'Expected the program object labels to be returned.'
        );
        System.assert(
            actual.objectLabels.containsKey('programCohort'),
            'Expected the program cohort object labels to be returned.'
        );
        System.assert(
            actual.objectLabels.containsKey('serviceParticipant'),
            'Expected the service participant object labels to be returned.'
        );

        programEngagementSelectorStub.assertCalledWith(
            programMethodName,
            Id.class,
            serviceId
        );

        programEngagementSelectorStub.assertCalledWith(
            programEngagementsMethodName,
            Id.class,
            programId
        );

        programEngagementSelectorStub.assertCalledWith(
            cohortsMethodName,
            Id.class,
            programId
        );
    }

    @IsTest
    private static void shouldReturnNullProgramWhenProgramNotFound() {
        Test.startTest();
        SelectParticipantModel actualModel = service.getSelectParticipantModel(
            TestUtil.mockId(Service__c.SObjectType)
        );
        Test.stopTest();

        System.assertEquals(
            null,
            actualModel.program,
            'Expected a program not to be found'
        );
        System.assertEquals(
            0,
            actualModel.programEngagements.size(),
            'Expected an empty list of program engagements when no program found.'
        );
        System.assertEquals(
            0,
            actualModel.programCohorts.size(),
            'Expected an empty list of program cohorts when no program found.'
        );
    }
}
