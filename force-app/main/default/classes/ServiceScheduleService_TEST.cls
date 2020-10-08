@IsTest
public with sharing class ServiceScheduleService_TEST {
    private static BasicStub recurrenceServiceStub = new BasicStub(
        RecurrenceService.class
    );

    private static ServiceScheduleService service = new ServiceScheduleService();
    private static BasicStub domainStub = new BasicStub(ServiceScheduleDomain.class);
    private static BasicStub programEngagementSelectorStub = new BasicStub(
        ProgramEngagementSelector.class
    );
    private static BasicStub serviceSelectorStub = new BasicStub(ServiceSelector.class);

    @TestSetup
    private static void setupTestData() {
        ProgramTestDataFactory.insertTestData(true);
    }

    @IsTest
    private static void shouldReturnModel() {
        ServiceSchedule__c schedule = (ServiceSchedule__c) ServiceSchedule__c.SObjectType.newSObject(
            null,
            true
        );
        ServiceScheduleModel expectedModel = new ServiceScheduleModel();
        expectedModel.serviceSchedule = schedule;

        Test.startTest();
        ServiceScheduleModel actualModel = service.getServiceScheduleModel();
        Test.stopTest();

        System.assertEquals(
            String.valueOf(expectedModel),
            String.valueOf(actualModel),
            'Expected the service to return a new service schedule model.'
        );

        System.assertEquals(
            String.valueOf(expectedModel.serviceSchedule),
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
    private static void shouldProcessSchedule() {
        String createMethod = 'createRRule';
        String generateMethod = 'generate';
        String getServiceProviderMethod = 'getContactsByIds';
        String rRuleString = 'abc';
        Contact primaryServiceProvider = new Contact(
            Id = TestUtil.mockId(Contact.SObjectType)
        );
        Contact otherServiceProvider = new Contact(
            Id = TestUtil.mockId(Contact.SObjectType)
        );
        DateTime firstSessionStart = System.now();
        DateTime firstSessionEnd = System.now().addHours(2);
        ServiceSchedule__c schedule = new ServiceSchedule__c(
            Name = 'test',
            FirstSessionStart__c = firstSessionStart,
            FirstSessionEnd__c = firstSessionEnd,
            Interval__c = 1,
            Frequency__c = 'DAILY',
            ServiceScheduleEndDate__c = System.today().addDays(10),
            NumberOfServiceSessions__c = 2,
            DaysOfWeek__c = '1;2;3;4;5;6;7',
            PrimaryServiceProvider__c = primaryServiceProvider.Id,
            OtherServiceProvider__c = otherServiceProvider.Id
        );
        ServiceScheduleModel model = new ServiceScheduleModel();
        model.serviceSchedule = schedule;

        List<DateTime> expectedDateTimes = new List<DateTime>{
            firstSessionStart,
            firstSessionStart.addDays(1)
        };

        recurrenceServiceStub.withReturnValue(
            createMethod,
            new List<Type>{
                String.class,
                Integer.class,
                Date.class,
                Integer.class,
                List<Integer>.class,
                DateTime.class
            },
            rRuleString
        );
        recurrenceServiceStub.withReturnValue(
            generateMethod,
            new List<Type>{ DateTime.class, String.class },
            expectedDateTimes
        );
        service.recurrenceService = (RecurrenceService) recurrenceServiceStub.createMock();

        serviceSelectorStub.withReturnValue(
            getServiceProviderMethod,
            Set<Id>.class,
            new List<Contact>{ primaryServiceProvider, otherServiceProvider }
        );
        service.serviceSelector = (ServiceSelector) serviceSelectorStub.createMock();

        List<ServiceSession__c> expectedSessions = new List<ServiceSession__c>();
        for (DateTime sessionDateTime : expectedDateTimes) {
            expectedSessions.add(
                new ServiceSession__c(
                    Name = sessionDateTime.date().format() + ': ' + schedule.Name,
                    SessionStart__c = sessionDateTime,
                    SessionEnd__c = DateTime.newInstance(
                        sessionDateTime.date(),
                        firstSessionEnd.time()
                    )
                )
            );
        }

        ServiceScheduleModel expected = new ServiceScheduleModel();
        schedule.PrimaryServiceProvider__r = primaryServiceProvider;
        schedule.OtherServiceProvider__r = otherServiceProvider;
        expected.serviceSchedule = schedule;
        expected.serviceSessions = expectedSessions;

        Test.startTest();
        ServiceScheduleModel actual = service.processSchedule(model);
        Test.stopTest();
        System.assertEquals(
            expected.serviceSessions,
            actual.serviceSessions,
            'Sessions not returned from the service as expected.'
        );
        System.assertEquals(
            expected.serviceSchedule,
            actual.serviceSchedule,
            'Schedule not returned from the service as expected.'
        );

        recurrenceServiceStub.assertCalledWith(
            createMethod,
            new List<Type>{
                String.class,
                Integer.class,
                Date.class,
                Integer.class,
                List<Integer>.class,
                DateTime.class
            },
            new List<Object>{
                schedule.Frequency__c,
                Integer.valueOf(schedule.Interval__c),
                schedule.ServiceScheduleEndDate__c,
                Integer.valueOf(schedule.NumberOfServiceSessions__c),
                new List<Integer>{ 1, 2, 3, 4, 5, 6, 7 },
                firstSessionStart
            }
        );
        recurrenceServiceStub.assertCalledWith(
            generateMethod,
            new List<Type>{ DateTime.class, String.class },
            new List<Object>{ schedule.FirstSessionStart__c, rRuleString }
        );
        serviceSelectorStub.assertCalledWith(
            getServiceProviderMethod,
            Set<Id>.class,
            new Set<Id>{ primaryServiceProvider.Id, otherServiceProvider.Id }
        );
    }

    @IsTest
    private static void shouldCreateSession() {
        DateTime startDateTime = System.now();
        DateTime endDateTime = startDateTime.addHours(1);

        ServiceSession__c expectedSession = new ServiceSession__c(
            Name = startDateTime.date().format() + ': Default Name',
            SessionStart__c = startDateTime,
            SessionEnd__c = endDateTime
        );

        Test.startTest();
        ServiceSession__c actualSession = service.createSession(
            new ServiceSchedule__c(Name = 'Default Name'),
            startDateTime,
            endDateTime
        );
        Test.stopTest();

        System.assertEquals(
            expectedSession,
            actualSession,
            'Expected the session returned by the service to match.'
        );
    }

    @IsTest
    private static void shouldProcessScheduleWithPrimaryServiceProvider() {
        String createMethod = 'createRRule';
        String generateMethod = 'generate';
        String getServiceProviderMethod = 'getContactsByIds';
        String rRuleString = 'abc';
        Contact primaryServiceProvider = new Contact(
            Id = TestUtil.mockId(Contact.SObjectType)
        );
        DateTime firstSessionStart = System.now();
        DateTime firstSessionEnd = System.now().addHours(2);
        ServiceSchedule__c schedule = new ServiceSchedule__c(
            Name = 'test',
            FirstSessionStart__c = firstSessionStart,
            FirstSessionEnd__c = firstSessionEnd,
            Interval__c = 1,
            Frequency__c = 'DAILY',
            ServiceScheduleEndDate__c = System.today().addDays(10),
            NumberOfServiceSessions__c = 2,
            DaysOfWeek__c = '1;2;3;4;5;6;7',
            PrimaryServiceProvider__c = primaryServiceProvider.Id,
            OtherServiceProvider__c = null
        );
        ServiceScheduleModel model = new ServiceScheduleModel();
        model.serviceSchedule = schedule;

        List<DateTime> expectedDateTimes = new List<DateTime>{
            firstSessionStart,
            firstSessionStart.addDays(1)
        };

        recurrenceServiceStub.withReturnValue(
            createMethod,
            new List<Type>{
                String.class,
                Integer.class,
                Date.class,
                Integer.class,
                List<Integer>.class,
                DateTime.class
            },
            rRuleString
        );
        recurrenceServiceStub.withReturnValue(
            generateMethod,
            new List<Type>{ DateTime.class, String.class },
            expectedDateTimes
        );
        service.recurrenceService = (RecurrenceService) recurrenceServiceStub.createMock();

        serviceSelectorStub.withReturnValue(
            getServiceProviderMethod,
            Set<Id>.class,
            new List<Contact>{ primaryServiceProvider }
        );
        service.serviceSelector = (ServiceSelector) serviceSelectorStub.createMock();

        List<ServiceSession__c> expectedSessions = new List<ServiceSession__c>();
        for (DateTime sessionDateTime : expectedDateTimes) {
            expectedSessions.add(
                new ServiceSession__c(
                    Name = sessionDateTime.date().format() + ': ' + schedule.Name,
                    SessionStart__c = sessionDateTime,
                    SessionEnd__c = DateTime.newInstance(
                        sessionDateTime.date(),
                        firstSessionEnd.time()
                    )
                )
            );
        }

        ServiceScheduleModel expected = new ServiceScheduleModel();
        schedule.PrimaryServiceProvider__r = primaryServiceProvider;
        expected.serviceSchedule = schedule;
        expected.serviceSessions = expectedSessions;

        Test.startTest();
        ServiceScheduleModel actual = service.processSchedule(model);
        Test.stopTest();
        System.assertEquals(
            expected.serviceSessions,
            actual.serviceSessions,
            'Sessions not returned from the service as expected.'
        );
        System.assertEquals(
            expected.serviceSchedule,
            actual.serviceSchedule,
            'Schedule not returned from the service as expected.'
        );

        recurrenceServiceStub.assertCalledWith(
            createMethod,
            new List<Type>{
                String.class,
                Integer.class,
                Date.class,
                Integer.class,
                List<Integer>.class,
                DateTime.class
            },
            new List<Object>{
                schedule.Frequency__c,
                Integer.valueOf(schedule.Interval__c),
                schedule.ServiceScheduleEndDate__c,
                Integer.valueOf(schedule.NumberOfServiceSessions__c),
                new List<Integer>{ 1, 2, 3, 4, 5, 6, 7 },
                firstSessionStart
            }
        );
        recurrenceServiceStub.assertCalledWith(
            generateMethod,
            new List<Type>{ DateTime.class, String.class },
            new List<Object>{ schedule.FirstSessionStart__c, rRuleString }
        );
        serviceSelectorStub.assertCalledWith(
            getServiceProviderMethod,
            Set<Id>.class,
            new Set<Id>{ primaryServiceProvider.Id }
        );
    }

    @IsTest
    private static void shouldProcessScheduleWithoutServiceProviders() {
        String createMethod = 'createRRule';
        String generateMethod = 'generate';
        String getServiceProviderMethod = 'getContactsByIds';
        String rRuleString = 'abc';
        DateTime firstSessionStart = System.now();
        DateTime firstSessionEnd = System.now().addHours(2);
        ServiceSchedule__c schedule = new ServiceSchedule__c(
            Name = 'test',
            FirstSessionStart__c = firstSessionStart,
            FirstSessionEnd__c = firstSessionEnd,
            Interval__c = 1,
            Frequency__c = 'DAILY',
            ServiceScheduleEndDate__c = System.today().addDays(10),
            NumberOfServiceSessions__c = 2,
            DaysOfWeek__c = '1;2;3;4;5;6;7',
            PrimaryServiceProvider__c = null,
            OtherServiceProvider__c = null
        );
        ServiceScheduleModel model = new ServiceScheduleModel();
        model.serviceSchedule = schedule;

        List<DateTime> expectedDateTimes = new List<DateTime>{
            firstSessionStart,
            firstSessionStart.addDays(1)
        };

        recurrenceServiceStub.withReturnValue(
            createMethod,
            new List<Type>{
                String.class,
                Integer.class,
                Date.class,
                Integer.class,
                List<Integer>.class,
                DateTime.class
            },
            rRuleString
        );
        recurrenceServiceStub.withReturnValue(
            generateMethod,
            new List<Type>{ DateTime.class, String.class },
            expectedDateTimes
        );
        service.recurrenceService = (RecurrenceService) recurrenceServiceStub.createMock();
        service.serviceSelector = (ServiceSelector) serviceSelectorStub.createMock();

        List<ServiceSession__c> expectedSessions = new List<ServiceSession__c>();
        for (DateTime sessionDateTime : expectedDateTimes) {
            expectedSessions.add(
                new ServiceSession__c(
                    Name = sessionDateTime.date().format() + ': ' + schedule.Name,
                    SessionStart__c = sessionDateTime,
                    SessionEnd__c = DateTime.newInstance(
                        sessionDateTime.date(),
                        firstSessionEnd.time()
                    )
                )
            );
        }

        ServiceScheduleModel expected = new ServiceScheduleModel();
        expected.serviceSchedule = schedule;
        expected.serviceSessions = expectedSessions;

        Test.startTest();
        ServiceScheduleModel actual = service.processSchedule(model);
        Test.stopTest();
        System.assertEquals(
            expected.serviceSessions,
            actual.serviceSessions,
            'Sessions not returned from the service as expected.'
        );
        System.assertEquals(
            expected.serviceSchedule,
            actual.serviceSchedule,
            'Schedule not returned from the service as expected.'
        );

        recurrenceServiceStub.assertCalledWith(
            createMethod,
            new List<Type>{
                String.class,
                Integer.class,
                Date.class,
                Integer.class,
                List<Integer>.class,
                DateTime.class
            },
            new List<Object>{
                schedule.Frequency__c,
                Integer.valueOf(schedule.Interval__c),
                schedule.ServiceScheduleEndDate__c,
                Integer.valueOf(schedule.NumberOfServiceSessions__c),
                new List<Integer>{ 1, 2, 3, 4, 5, 6, 7 },
                firstSessionStart
            }
        );
        recurrenceServiceStub.assertCalledWith(
            generateMethod,
            new List<Type>{ DateTime.class, String.class },
            new List<Object>{ schedule.FirstSessionStart__c, rRuleString }
        );
        serviceSelectorStub.assertNotCalled(getServiceProviderMethod, Set<Id>.class);
    }

    @IsTest
    private static void shouldGetSessionsWithMinimalInfo() {
        String createMethod = 'createRRule';
        String generateMethod = 'generate';
        String rRuleString = 'abc';
        DateTime firstSessionStart = System.now();
        ServiceSchedule__c schedule = new ServiceSchedule__c(
            Name = 'test',
            FirstSessionStart__c = firstSessionStart,
            Frequency__c = 'DAILY',
            NumberOfServiceSessions__c = 2
        );
        List<DateTime> expectedDateTimes = new List<DateTime>{
            firstSessionStart,
            firstSessionStart.addDays(1)
        };
        recurrenceServiceStub.withReturnValue(
            createMethod,
            new List<Type>{
                String.class,
                Integer.class,
                Date.class,
                Integer.class,
                List<Integer>.class,
                DateTime.class
            },
            rRuleString
        );
        recurrenceServiceStub.withReturnValue(
            generateMethod,
            new List<Type>{ DateTime.class, String.class },
            expectedDateTimes
        );
        service.recurrenceService = (RecurrenceService) recurrenceServiceStub.createMock();

        List<ServiceSession__c> expected = new List<ServiceSession__c>();
        for (DateTime sessionDateTime : expectedDateTimes) {
            expected.add(
                new ServiceSession__c(
                    Name = sessionDateTime.date().format() + ': ' + schedule.Name,
                    SessionStart__c = sessionDateTime,
                    SessionEnd__c = null
                )
            );
        }

        Test.startTest();
        List<ServiceSession__c> actual = service.getSessions(schedule);
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'Sessions not returned from the service as expected.'
        );

        recurrenceServiceStub.assertCalledWith(
            createMethod,
            new List<Type>{
                String.class,
                Integer.class,
                Date.class,
                Integer.class,
                List<Integer>.class,
                DateTime.class
            },
            new List<Object>{
                schedule.Frequency__c,
                null,
                null,
                Integer.valueOf(schedule.NumberOfServiceSessions__c),
                null,
                firstSessionStart
            }
        );
        recurrenceServiceStub.assertCalledWith(
            generateMethod,
            new List<Type>{ DateTime.class, String.class },
            new List<Object>{ schedule.FirstSessionStart__c, rRuleString }
        );
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

    @IsTest
    private static void functionalCreateDailySchedule() {
        Id serviceId = [SELECT Id FROM Service__c LIMIT 1].Id;
        List<Contact> serviceProviders = [SELECT Id, Name FROM Contact LIMIT 2];
        System.assertEquals(
            2,
            serviceProviders.size(),
            'Sanity check: expected the factory to generate at least 2 contacts.'
        );

        // Step 1
        ServiceScheduleModel model = service.getServiceScheduleModel();
        DateTime firstSessionStart = System.now();
        DateTime firstSessionEnd = System.now().addHours(2);
        ServiceSchedule__c schedule = new ServiceSchedule__c(
            Name = 'End to End',
            FirstSessionStart__c = firstSessionStart,
            FirstSessionEnd__c = firstSessionEnd,
            Interval__c = 1,
            Frequency__c = 'DAILY',
            NumberOfServiceSessions__c = 2,
            PrimaryServiceProvider__c = serviceProviders[0].Id,
            OtherServiceProvider__c = serviceProviders[1].Id
        );
        model.serviceSchedule = schedule;

        // Step 2
        service.processSchedule(model);
        System.assertEquals(
            model.serviceSchedule.PrimaryServiceProvider__r,
            serviceProviders[0],
            'Expected the primary service provider contact to be added to the schedule.'
        );
        System.assertEquals(
            model.serviceSchedule.OtherServiceProvider__r,
            serviceProviders[1],
            'Expected the other service provider contact to be added to the schedule.'
        );
        System.assertEquals(
            2,
            model.serviceSessions.size(),
            'Expected 2 sessions to be generated.'
        );

        // Step 3
        SelectParticipantModel participantModel = service.getSelectParticipantModel(
            serviceId
        );
        System.assert(
            !participantModel.programEngagements.isEmpty(),
            'Sanity check: expected at least 1 engagement record related to the service to be created by the test factory.'
        );
        model.selectedParticipants = participantModel.programEngagements;

        // Step 4
        service.persist(model);
        ServiceSchedule__c actualSchedule = [
            SELECT Id
            FROM ServiceSchedule__c
            WHERE Name = :schedule.Name
        ];
        List<ServiceSession__c> actualSessions = [
            SELECT Id
            FROM ServiceSession__c
            WHERE ServiceSchedule__c = :actualSchedule.Id
        ];
        List<ServiceParticipant__c> actualParticipants = [
            SELECT Id
            FROM ServiceParticipant__c
            WHERE ServiceSchedule__c = :actualSchedule.Id
        ];
        System.assertNotEquals(
            null,
            actualSchedule.Id,
            'Expected the schedule to have been inserted.'
        );
        System.assertEquals(
            model.serviceSessions.size(),
            actualSessions.size(),
            'Expected the sessions to have been inserted.'
        );
        System.assertEquals(
            model.serviceParticipants.size(),
            actualParticipants.size(),
            'Expected the participants to have been inserted.'
        );
    }

    @IsTest
    private static void shouldGetSessionsForOneTimeFrequency() {
        DateTime firstSessionStart = System.now();
        ServiceSchedule__c schedule = new ServiceSchedule__c(
            Name = 'test',
            FirstSessionStart__c = firstSessionStart,
            Frequency__c = 'ONE TIME'
        );
        List<DateTime> expectedDateTimes = new List<DateTime>{ firstSessionStart };

        List<ServiceSession__c> expected = new List<ServiceSession__c>();
        for (DateTime sessionDateTime : expectedDateTimes) {
            expected.add(
                new ServiceSession__c(
                    Name = sessionDateTime.date().format() + ': ' + schedule.Name,
                    SessionStart__c = sessionDateTime,
                    SessionEnd__c = null
                )
            );
        }

        Test.startTest();
        List<ServiceSession__c> actual = service.getSessions(schedule);
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'Sessions not returned from the service as expected.'
        );
    }
}
