/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

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
    private static BasicStub permValidatorStub = new BasicStub(PermissionValidator.class);

    @TestSetup
    private static void setupTestData() {
        TestDataFactory.generateServiceData();
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
        ServiceScheduleModel actualModel = service.getServiceScheduleModel(null);
        Test.stopTest();

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
        Integer durationInHours = 36;
        DateTime firstSessionEnd = System.now().addHours(durationInHours);
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
            OtherServiceProvider__c = otherServiceProvider.Id,
            CreateServiceSessionRecords__c = true,
            MonthlyRecurrenceOption__c = '1MO'
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
                DateTime.class,
                String.class
            },
            rRuleString
        );
        recurrenceServiceStub.withReturnValue(
            generateMethod,
            new List<Type>{ DateTime.class, String.class, Integer.class },
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
                    SessionEnd__c = sessionDateTime.addHours(durationInHours)
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
            String.valueOf(expected.serviceSessions),
            String.valueOf(actual.serviceSessions),
            'Sessions not returned from the service as expected.'
        );
        System.assertEquals(
            String.valueOf(expected.serviceSchedule),
            String.valueOf(actual.serviceSchedule),
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
                DateTime.class,
                String.class
            },
            new List<Object>{
                schedule.Frequency__c,
                Integer.valueOf(schedule.Interval__c),
                schedule.ServiceScheduleEndDate__c,
                Integer.valueOf(schedule.NumberOfServiceSessions__c),
                new List<Integer>{ 1, 2, 3, 4, 5, 6, 7 },
                firstSessionStart,
                schedule.MonthlyRecurrenceOption__c
            }
        );
        recurrenceServiceStub.assertCalledWith(
            generateMethod,
            new List<Type>{ DateTime.class, String.class, Integer.class },
            new List<Object>{
                schedule.FirstSessionStart__c,
                rRuleString,
                model.maxSessions
            }
        );
        serviceSelectorStub.assertCalledWith(
            getServiceProviderMethod,
            Set<Id>.class,
            new Set<Id>{ primaryServiceProvider.Id, otherServiceProvider.Id }
        );
    }

    @IsTest
    private static void shouldProcessScheduleOverDST() {
        String createMethod = 'createRRule';
        String generateMethod = 'generate';
        String rRuleString = 'abc';
        DateTime firstSessionStart = DateTime.newInstance(2020, 10, 30, 22, 0, 0); // 10 PM Oct 31
        // DST starts at 2AM on Nov 1 2020, so the second 6-hour session SHOULD end at 3AM, not 4AM.
        // All other sessions should end at 4AM.
        // Note this test will only pass when run by users using locales that obey DST.
        Integer durationInHours = 6;
        DateTime firstSessionEnd = firstSessionStart.addHours(durationInHours);
        ServiceSchedule__c schedule = new ServiceSchedule__c(
            Name = 'test',
            FirstSessionStart__c = firstSessionStart,
            FirstSessionEnd__c = firstSessionEnd,
            Interval__c = 1,
            Frequency__c = 'DAILY',
            NumberOfServiceSessions__c = 4,
            DaysOfWeek__c = '1;2;3;4;5;6;7',
            CreateServiceSessionRecords__c = true
        );
        ServiceScheduleModel model = new ServiceScheduleModel();
        model.serviceSchedule = schedule;

        List<DateTime> expectedDateTimes = new List<DateTime>{
            firstSessionStart,
            Datetime.newInstance(2020, 10, 31, 22, 0, 0),
            Datetime.newInstance(2020, 11, 1, 22, 0, 0),
            Datetime.newInstance(2020, 11, 2, 22, 0, 0)
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
            new List<Type>{ DateTime.class, String.class, Integer.class },
            expectedDateTimes
        );
        service.recurrenceService = (RecurrenceService) recurrenceServiceStub.createMock();

        List<ServiceSession__c> expectedSessions = new List<ServiceSession__c>();
        for (DateTime sessionDateTime : expectedDateTimes) {
            expectedSessions.add(
                new ServiceSession__c(
                    Name = sessionDateTime.date().format() + ': ' + schedule.Name,
                    SessionStart__c = sessionDateTime,
                    SessionEnd__c = sessionDateTime.addHours(durationInHours)
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
            String.valueOf(expected.serviceSessions),
            String.valueOf(actual.serviceSessions),
            'Sessions not returned from the service as expected.'
        );
        System.assertEquals(
            Datetime.newInstance(2020, 10, 31, 4, 0, 0),
            actual.serviceSessions[0].SessionEnd__c
        );
        System.assertEquals(
            Datetime.newInstance(2020, 11, 1, 3, 0, 0),
            actual.serviceSessions[1].SessionEnd__c
        );
        System.assertEquals(
            Datetime.newInstance(2020, 11, 2, 4, 0, 0),
            actual.serviceSessions[2].SessionEnd__c
        );
        System.assertEquals(
            Datetime.newInstance(2020, 11, 3, 4, 0, 0),
            actual.serviceSessions[3].SessionEnd__c
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
        Integer hours = 2;
        DateTime firstSessionEnd = System.now().addHours(hours);
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
            OtherServiceProvider__c = null,
            CreateServiceSessionRecords__c = true
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
                DateTime.class,
                String.class
            },
            rRuleString
        );
        recurrenceServiceStub.withReturnValue(
            generateMethod,
            new List<Type>{ DateTime.class, String.class, Integer.class },
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
                    SessionEnd__c = sessionDateTime.addHours(hours)
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
            String.valueOf(expected.serviceSessions),
            String.valueOf(actual.serviceSessions),
            'Sessions not returned from the service as expected.'
        );
        System.assertEquals(
            String.valueOf(expected.serviceSchedule),
            String.valueOf(actual.serviceSchedule),
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
                DateTime.class,
                String.class
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
            new List<Type>{ DateTime.class, String.class, Integer.class },
            new List<Object>{
                schedule.FirstSessionStart__c,
                rRuleString,
                model.maxSessions
            }
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
        Integer hours = 2;
        DateTime firstSessionEnd = System.now().addHours(hours);
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
            OtherServiceProvider__c = null,
            CreateServiceSessionRecords__c = true
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
                DateTime.class,
                String.class
            },
            rRuleString
        );
        recurrenceServiceStub.withReturnValue(
            generateMethod,
            new List<Type>{ DateTime.class, String.class, Integer.class },
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
                    SessionEnd__c = sessionDateTime.addHours(hours)
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
            String.valueOf(expected.serviceSessions),
            String.valueOf(actual.serviceSessions),
            'Sessions not returned from the service as expected.'
        );
        System.assertEquals(
            String.valueOf(expected.serviceSchedule),
            String.valueOf(actual.serviceSchedule),
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
                DateTime.class,
                String.class
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
            new List<Type>{ DateTime.class, String.class, Integer.class },
            new List<Object>{
                schedule.FirstSessionStart__c,
                rRuleString,
                model.maxSessions
            }
        );
        serviceSelectorStub.assertNotCalled(getServiceProviderMethod, Set<Id>.class);
    }

    @IsTest
    private static void shouldProcessScheduleWithoutCreatingSessions() {
        ServiceSchedule__c schedule = new ServiceSchedule__c(
            Name = 'test',
            CreateServiceSessionRecords__c = false
        );
        ServiceScheduleModel model = new ServiceScheduleModel();
        model.serviceSchedule = schedule;

        List<ServiceSession__c> expectedSessions = new List<ServiceSession__c>();

        ServiceScheduleModel expected = new ServiceScheduleModel();
        expected.serviceSchedule = schedule;
        expected.serviceSessions = expectedSessions;

        Test.startTest();
        ServiceScheduleModel actual = service.processSchedule(model);
        Test.stopTest();
        System.assertEquals(
            String.valueOf(expected.serviceSessions),
            String.valueOf(actual.serviceSessions),
            'Expected an empty list of sessions to be returned.'
        );
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
            NumberOfServiceSessions__c = 2,
            CreateServiceSessionRecords__c = true
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
                DateTime.class,
                String.class
            },
            rRuleString
        );
        recurrenceServiceStub.withReturnValue(
            generateMethod,
            new List<Type>{ DateTime.class, String.class, Integer.class },
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
        List<ServiceSession__c> actual = service.getSessions(schedule, null);
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
                DateTime.class,
                String.class
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
            new List<Type>{ DateTime.class, String.class, Integer.class },
            new List<Object>{ schedule.FirstSessionStart__c, rRuleString, null }
        );
    }

    @IsTest
    private static void shouldDeleteSessionsAfter() {
        String selectorMethod = 'getSessionsAfter';
        String deleteMethod = 'deleteSessions';
        List<ServiceSession__c> expectedSessions = new List<ServiceSession__c>{
            new ServiceSession__c(Name = 'test')
        };
        Date startDate = System.today();
        Id scheduleId = TestUtil.mockId(ServiceSchedule__c.SObjectType);
        serviceSelectorStub.withReturnValue(
            selectorMethod,
            new List<Type>{ Id.class, Date.class },
            expectedSessions
        );
        service.serviceSelector = (ServiceSelector) serviceSelectorStub.createMock();
        service.domain = (ServiceScheduleDomain) domainStub.createMock();

        Test.startTest();
        Integer actual = service.deleteSessionsAfter(scheduleId, startDate);
        Test.stopTest();

        System.assertEquals(
            expectedSessions.size(),
            actual,
            'Number of deleted sessions not returned from the service as expected.'
        );

        serviceSelectorStub.assertCalledWith(
            selectorMethod,
            new List<Type>{ Id.class, Date.class },
            new List<Object>{ scheduleId, startDate }
        );
        domainStub.assertCalledWith(
            deleteMethod,
            List<ServiceSession__c>.class,
            expectedSessions
        );
    }

    @IsTest
    private static void shouldCallSelectorAndDomainOnAddParticipants() {
        String selectorMethod = 'getScheduleById';
        String domainMethod = 'insertParticipants';
        Id scheduleId = TestUtil.mockId(ServiceSchedule__c.SObjectType);
        List<ProgramEngagement__c> engagements = new List<ProgramEngagement__c>();
        ServiceSchedule__c expectedSchedule = new ServiceSchedule__c();
        serviceSelectorStub.withReturnValue(selectorMethod, Id.class, expectedSchedule);

        service.serviceSelector = (ServiceSelector) serviceSelectorStub.createMock();
        service.domain = (ServiceScheduleDomain) domainStub.createMock();

        Test.startTest();
        service.addParticipants(engagements, scheduleId);
        Test.stopTest();

        serviceSelectorStub.assertCalledWith(selectorMethod, Id.class, scheduleId);
        domainStub.assertCalledWith(
            domainMethod,
            new List<Type>{ List<ProgramEngagement__c>.class, ServiceSchedule__c.class },
            new List<Object>{ engagements, expectedSchedule }
        );
    }

    @IsTest
    private static void shouldCallSelectorOnGetExistingParticipants() {
        String selectorMethod = 'getExistingParticipantContactIdsByScheduleId';
        Id scheduleId = TestUtil.mockId(ServiceSchedule__c.SObjectType);
        List<Id> expected = new List<Id>();
        serviceSelectorStub.withReturnValue(selectorMethod, Id.class, expected);

        service.serviceSelector = (ServiceSelector) serviceSelectorStub.createMock();

        Test.startTest();
        List<Id> actual = service.getExistingParticipantContactIds(scheduleId);
        Test.stopTest();

        serviceSelectorStub.assertCalledWith(selectorMethod, Id.class, scheduleId);
        System.assertEquals(expected, actual);
    }

    @IsTest
    private static void shouldCallPermissionValidator() {
        String fieldAccessMethodName = 'hasFLSAccessForFields';
        String objectAccessMethodName = 'hasObjectAccess';

        permValidatorStub.withReturnValue(
            objectAccessMethodName,
            new List<Type>{ SObjectType.class, PermissionValidator.CRUDAccessType.class },
            true
        );
        permValidatorStub.withReturnValue(
            fieldAccessMethodName,
            new List<Type>{ List<Schema.SObjectField>.class, String.class },
            true
        );
        PermissionValidator.instance = (PermissionValidator) permValidatorStub.createMock();

        Boolean expected = true;

        Test.startTest();
        Boolean actual = service.checkAddParticipantsPermissions();
        Test.stopTest();

        permValidatorStub.assertCalled(
            fieldAccessMethodName,
            new List<Type>{ List<Schema.SObjectField>.class, String.class }
        );
        permValidatorStub.assertCalled(
            objectAccessMethodName,
            new List<Type>{ SObjectType.class, PermissionValidator.CRUDAccessType.class }
        );
        System.assertEquals(
            expected,
            actual,
            'Field permissions not returned from Perm Validator as expected.'
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
            new List<Type>{ Id.class, Set<String>.class, Set<String>.class },
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
            new List<Type>{ Id.class, Set<String>.class, Set<String>.class },
            new List<Object>{
                programId,
                service.getSelectFieldsWithToLabel(actual),
                ServiceScheduleService.ACTIVE_ENGAGEMENT_STAGES
            }
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
        ServiceScheduleModel model = service.getServiceScheduleModel(null);
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
            OtherServiceProvider__c = serviceProviders[1].Id,
            CreateServiceSessionRecords__c = true
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
        model.selectedEngagements = participantModel.programEngagements;

        // Step 4
        service.persist(model);
        ServiceSchedule__c actualSchedule = [
            SELECT Id
            FROM ServiceSchedule__c
            ORDER BY Id DESC
            LIMIT 1
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
        List<ServiceSession__c> actual = service.getSessions(schedule, null);
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'Sessions not returned from the service as expected.'
        );
    }
}
