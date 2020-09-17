@IsTest
public with sharing class ServiceScheduleService_TEST {
    private static BasicStub recurrenceServiceStub = new BasicStub(
        RecurrenceService.class
    );

    private static ServiceScheduleService service = new ServiceScheduleService();
    private static BasicStub validatorStub = new BasicStub(PermissionValidator.class);

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
    private static void shouldPersistScheduleAndRelatedRecords() {
        ServiceScheduleModel model = new ServiceScheduleModel();
        ServiceSchedule__c schedule = new ServiceSchedule__c();
        List<ServiceSession__c> sessions = new List<ServiceSession__c>();
        List<ServiceParticipant__c> participants = new List<ServiceParticipant__c>();

        Service__c serviceRecord = [SELECT Id, Program__c FROM Service__c LIMIT 1];
        ProgramEngagement__c engagementRecord = [
            SELECT Id
            FROM ProgramEngagement__c
            WHERE Program__c = :serviceRecord.Program__c
            LIMIT 1
        ];

        schedule.Service__c = serviceRecord.Id;
        schedule.Name = 'Homework Office Hours';
        schedule.FirstSessionStart__c = DateTime.newInstance(2020, 9, 18, 9, 30, 0);
        schedule.Frequency__c = 'Weekly';
        schedule.ServiceScheduleEnds__c = 'On';
        schedule.ServiceScheduleEndDate__c = Date.newInstance(2020, 10, 16);

        for (
            DateTime sessionDate = schedule.FirstSessionStart__c;
            sessionDate < schedule.ServiceScheduleEndDate__c;
            sessionDate = sessionDate.addDays(7)
        ) {
            sessions.add(new ServiceSession__c(SessionStart__c = sessionDate));
        }

        participants.add(
            new ServiceParticipant__c(ProgramEngagement__c = engagementRecord.Id)
        );

        Test.startTest();
        model.serviceSchedule = schedule;
        model.serviceSessions = sessions;
        model.serviceParticipants = participants;
        service.persist(model);
        Test.stopTest();

        System.assert(
            sessions.size() > 0,
            'Sanity check that our test setup created session records.'
        );
        System.assertNotEquals(
            null,
            schedule.Id,
            'Expected the schedule record to have been inserted and given an Id.'
        );

        for (ServiceSession__c session : sessions) {
            System.assertNotEquals(
                null,
                session.Id,
                'Expected each session record to have been inserted and given an Id.'
            );
            System.assertEquals(
                schedule.Id,
                session.ServiceSchedule__c,
                'Expected each session record to have been related to the Schedule.'
            );
        }

        System.assertNotEquals(
            null,
            participants[0].Id,
            'Expected the participant record to have been inserted and given an Id.'
        );
        System.assertEquals(
            schedule.Id,
            participants[0].ServiceSchedule__c,
            'Expected the participant record to have been related to the Schedule.'
        );
        System.assertEquals(
            schedule.Service__c,
            participants[0].Service__c,
            'Expected the participant record to have been related to the Service record related to the Schedule.'
        );
    }

    @IsTest
    private static void shouldGetSessions() {
        String createMethod = 'createRRule';
        String generateMethod = 'generate';
        String rRuleString = 'abc';
        Id primaryServiceProvider = TestUtil.mockId(Contact.SObjectType);
        Id otherServiceProvider = TestUtil.mockId(Contact.SObjectType);
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
            PrimaryServiceProvider__c = primaryServiceProvider,
            OtherServiceProvider__c = otherServiceProvider
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
                List<Integer>.class
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
                    Name = schedule.Name + ': ' + sessionDateTime.date().format(),
                    SessionStart__c = sessionDateTime,
                    SessionEnd__c = sessionDateTime.addHours(2),
                    PrimaryServiceProvider__c = primaryServiceProvider,
                    OtherServiceProvider__c = otherServiceProvider,
                    Status__c = 'Pending'
                )
            );
        }

        Test.startTest();
        List<ServiceSession__c> actual = service.getSessions(schedule);
        Test.stopTest();

        System.assertEquals(expected, actual);

        recurrenceServiceStub.assertCalledWith(
            createMethod,
            new List<Type>{
                String.class,
                Integer.class,
                Date.class,
                Integer.class,
                List<Integer>.class
            },
            new List<Object>{
                schedule.Frequency__c,
                Integer.valueOf(schedule.Interval__c),
                schedule.ServiceScheduleEndDate__c,
                Integer.valueOf(schedule.NumberOfServiceSessions__c),
                new List<Integer>{ 1, 2, 3, 4, 5, 6, 7 }
            }
        );
        recurrenceServiceStub.assertCalledWith(
            generateMethod,
            new List<Type>{ DateTime.class, String.class },
            new List<Object>{ schedule.FirstSessionStart__c, rRuleString }
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
                List<Integer>.class
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
                    Name = schedule.Name + ': ' + sessionDateTime.date().format(),
                    SessionStart__c = sessionDateTime,
                    SessionEnd__c = null,
                    PrimaryServiceProvider__c = null,
                    OtherServiceProvider__c = null,
                    Status__c = 'Pending'
                )
            );
        }

        Test.startTest();
        List<ServiceSession__c> actual = service.getSessions(schedule);
        Test.stopTest();

        System.debug(JSON.serialize(actual));
        System.debug(JSON.serialize(expected));
        System.assertEquals(expected, actual);

        recurrenceServiceStub.assertCalledWith(
            createMethod,
            new List<Type>{
                String.class,
                Integer.class,
                Date.class,
                Integer.class,
                List<Integer>.class
            },
            new List<Object>{
                schedule.Frequency__c,
                null,
                null,
                Integer.valueOf(schedule.NumberOfServiceSessions__c),
                null
            }
        );
        recurrenceServiceStub.assertCalledWith(
            generateMethod,
            new List<Type>{ DateTime.class, String.class },
            new List<Object>{ schedule.FirstSessionStart__c, rRuleString }
        );
    }

    @IsTest
    private static void throwsExceptionWhenNameTooLong() {
        ServiceScheduleModel model = new ServiceScheduleModel();
        ServiceSchedule__c schedule = new ServiceSchedule__c();
        Exception actualException;
        Integer dmlLimitBefore;
        Integer dmlLimitAfter;

        Service__c serviceRecord = [SELECT Id FROM Service__c LIMIT 1];

        schedule.Service__c = serviceRecord.Id;
        schedule.Name = 'This name is way too long but I am not really sure if an error will get thrown because of it.';
        schedule.FirstSessionStart__c = DateTime.newInstance(2020, 9, 18, 9, 30, 0);
        schedule.Frequency__c = 'Weekly';
        schedule.ServiceScheduleEnds__c = 'On';
        schedule.ServiceScheduleEndDate__c = Date.newInstance(2020, 10, 16);

        Test.startTest();
        try {
            dmlLimitBefore = System.Limits.getDmlStatements();
            model.serviceSchedule = schedule;
            service.persist(model);
        } catch (Exception ex) {
            actualException = ex;
            dmlLimitAfter = System.Limits.getDmlStatements();
        }

        Test.stopTest();

        System.assertEquals(
            null,
            schedule.Id,
            'Expected the insert of the schedule record to have caused an exception.'
        );

        System.assert(
            actualException instanceof ServiceScheduleService.ServiceScheduleServiceException,
            'Expected the service to catch and rethrow the exception.'
        );

        System.assertEquals(
            3,
            dmlLimitAfter - dmlLimitBefore,
            'Expected a dml statement for the save point; schedule and the rollback.'
        );
    }

    @IsTest
    private static void throwsExceptionWhenPermissionCheckFails() {
        String methodName = 'hasObjectAccess';
        Integer dmlLimitAfter;
        Exception actualException;

        validatorStub.withReturnValue(
            methodName,
            new List<Type>{ SObjectType.class, PermissionValidator.CRUDAccessType.class },
            false
        );

        PermissionValidator.instance = (PermissionValidator) validatorStub.createMock();

        Test.startTest();
        try {
            service.persist(new ServiceScheduleModel());
        } catch (Exception ex) {
            dmlLimitAfter = System.Limits.getDmlStatements();
            actualException = ex;
        }
        Test.stopTest();

        System.assert(
            actualException instanceof ServiceScheduleService.ServiceScheduleServiceException,
            'Expected the service to throw the exception.'
        );

        System.assertEquals(
            0,
            dmlLimitAfter,
            'Expected the exception to be thrown before any dml statements.'
        );
    }
}
