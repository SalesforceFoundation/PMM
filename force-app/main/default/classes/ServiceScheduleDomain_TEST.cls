@IsTest
private with sharing class ServiceScheduleDomain_TEST {
    private static ServiceScheduleDomain domain = new ServiceScheduleDomain();
    private static BasicStub validatorStub = new BasicStub(PermissionValidator.class);

    @TestSetup
    private static void setupTestData() {
        ProgramTestDataFactory.insertTestData(true);
    }

    @IsTest
    private static void shouldInsertScheduleWithoutRelatedRecords() {
        ServiceScheduleModel model = new ServiceScheduleModel();
        ServiceSchedule__c schedule = new ServiceSchedule__c();
        Service__c service = [SELECT Id, Program__c FROM Service__c LIMIT 1];

        schedule.Service__c = service.Id;
        schedule.Name = 'Homework Office Hours';
        schedule.FirstSessionStart__c = DateTime.newInstance(2020, 9, 18, 9, 30, 0);
        schedule.Frequency__c = 'Weekly';
        schedule.ServiceScheduleEnds__c = 'On';
        schedule.ServiceScheduleEndDate__c = Date.newInstance(2020, 10, 16);
        model.serviceSchedule = schedule;

        Test.startTest();
        domain.insertModel(model);
        Test.stopTest();

        System.assertNotEquals(
            null,
            schedule.Id,
            'Expected the schedule record to have been inserted and given an Id.'
        );
    }

    @IsTest
    private static void shouldInsertScheduleAndRelatedRecords() {
        ServiceScheduleModel model = new ServiceScheduleModel();
        ServiceSchedule__c schedule = new ServiceSchedule__c();
        List<ServiceSession__c> sessions = new List<ServiceSession__c>();
        List<ServiceParticipant__c> participants = new List<ServiceParticipant__c>();

        Service__c service = [SELECT Id, Program__c FROM Service__c LIMIT 1];
        List<ProgramEngagement__c> selectedEngagements = [
            SELECT Id, Contact__c
            FROM ProgramEngagement__c
            WHERE Program__c = :service.Program__c
            LIMIT 1
        ];

        schedule.Service__c = service.Id;
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

        Test.startTest();
        model.serviceSchedule = schedule;
        model.serviceSessions = sessions;
        model.selectedParticipants = selectedEngagements;
        domain.insertModel(model);
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
            model.serviceParticipants[0].Id,
            'Expected the participant record to have been inserted and given an Id.'
        );
        System.assertEquals(
            schedule.Id,
            model.serviceParticipants[0].ServiceSchedule__c,
            'Expected the participant record to have been related to the Schedule.'
        );
        System.assertEquals(
            schedule.Service__c,
            model.serviceParticipants[0].Service__c,
            'Expected the participant record to have been related to the Service record related to the Schedule.'
        );
        System.assertEquals(
            selectedEngagements[0].Id,
            model.serviceParticipants[0].ProgramEngagement__c,
            'Expected the participant record to have been related to the Selected Engagement Record.'
        );
        System.assertEquals(
            selectedEngagements[0].Contact__c,
            model.serviceParticipants[0].Contact__c,
            'Expected the participant record to have been related to the Selected Engagement\'s Contact Record.'
        );
    }

    @IsTest
    private static void throwsExceptionWhenNameTooLong() {
        ServiceScheduleModel model = new ServiceScheduleModel();
        ServiceSchedule__c schedule = new ServiceSchedule__c();
        Exception actualException;

        Service__c service = [SELECT Id FROM Service__c LIMIT 1];
        schedule.Service__c = service.Id;
        schedule.Name = 'This name is way too long but I am not really sure if an error will get thrown because of it.';

        Test.startTest();
        try {
            model.serviceSchedule = schedule;
            domain.insertModel(model);
        } catch (Exception ex) {
            actualException = ex;
        }

        Test.stopTest();

        System.assertEquals(
            null,
            schedule.Id,
            'Expected the insert of the schedule record to have caused an exception.'
        );

        System.assert(
            actualException instanceof DmlException,
            'Expected a dml exception.'
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
            domain.insertModel(new ServiceScheduleModel());
        } catch (Exception ex) {
            dmlLimitAfter = System.Limits.getDmlStatements();
            actualException = ex;
        }
        Test.stopTest();

        System.assert(
            actualException instanceof ServiceScheduleDomain.ServiceScheduleDomainException,
            'Expected the domain to throw the exception.'
        );

        System.assertEquals(
            0,
            dmlLimitAfter,
            'Expected the exception to be thrown before any dml statements.'
        );
    }
}
