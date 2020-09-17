@IsTest
public with sharing class ServiceScheduleService_TEST {
    private static ServiceScheduleService service = new ServiceScheduleService();

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
            System.debug(dmlLimitBefore);
            model.serviceSchedule = schedule;
            service.persist(model);
        } catch (Exception ex) {
            actualException = ex;
            dmlLimitAfter = System.Limits.getDmlStatements();
            System.debug(dmlLimitAfter);
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
            dmlLimitAfter,
            'Expected a dml statement for the save point; schedule and the rollback.'
        );
    }
}
