/*
 *
 *  * Copyright (c) 2022, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */
@IsTest
private class ServiceScheduleRollupsSchedulable_TEST {
    private static Id accountRecordId;
    private static Contact contactRecord;
    private static Service__c service;
    private static ProgramEngagement__c programEngagement;
    private static Program__c program;
    private static List<ServiceSchedule__c> serviceSchedules;
    private static List<ServiceSession__c> sessions;
    private static List<ServiceDelivery__c> serviceDeliveries;
    private static final String PRESENT_STATUS = 'Present';
    private static final String ABSENCE_STATUS = 'Excused Absence';

    @TestSetup
    static void setupTestData() {
        TestUtil.turnOffFeatureGates();
        TestDataFactory.generateAttendanceData('Monthly');
    }

    @IsTest
    private static void shouldIncrementCountOnInsert() {
        testDataSetup();

        Test.startTest();

        ServiceScheduleRollupsSchedulable scheduleRollups = new ServiceScheduleRollupsSchedulable();
        Database.executeBatch(scheduleRollups);

        Test.stopTest();

        List<ServiceSchedule__c> schedules = [
            SELECT Id, NumAbsentServiceDeliveries__c, NumPresentServiceDeliveries__c
            FROM ServiceSchedule__c
        ];

        System.assertEquals(4, schedules[0].NumPresentServiceDeliveries__c);
        System.assertEquals(1, schedules[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(1, schedules[1].NumPresentServiceDeliveries__c);
        System.assertEquals(0, schedules[1].NumAbsentServiceDeliveries__c);
    }

    @IsTest
    private static void shouldIncrementCountOnUpdate() {
        testDataSetup();

        Test.startTest();
        TestUtil.turnOffFeatureGates();
        serviceDeliveries[3].AttendanceStatus__c = ABSENCE_STATUS;
        serviceDeliveries[3].Quantity__c = 0;
        update serviceDeliveries[3];

        ServiceScheduleRollupsSchedulable scheduleRollups = new ServiceScheduleRollupsSchedulable();
        Database.executeBatch(scheduleRollups);

        Test.stopTest();
        requery();

        System.assertEquals(3, serviceSchedules[0].NumPresentServiceDeliveries__c);
        System.assertEquals(2, serviceSchedules[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(1, serviceSchedules[1].NumPresentServiceDeliveries__c);
        System.assertEquals(0, serviceSchedules[1].NumAbsentServiceDeliveries__c);
    }

    @IsTest
    private static void shouldDecrementCountOnDelete() {
        testDataSetup();

        Test.startTest();
        TestUtil.turnOffFeatureGates();
        delete serviceDeliveries[3];

        ServiceScheduleRollupsSchedulable scheduleRollups = new ServiceScheduleRollupsSchedulable();
        Database.executeBatch(scheduleRollups);

        Test.stopTest();
        requery();

        System.assertEquals(3, serviceSchedules[0].NumPresentServiceDeliveries__c);
        System.assertEquals(1, serviceSchedules[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(1, serviceSchedules[1].NumPresentServiceDeliveries__c);
        System.assertEquals(0, serviceSchedules[1].NumAbsentServiceDeliveries__c);
    }

    @IsTest
    private static void shouldResetParentsWithoutDeliveries() {
        testDataSetup();

        Test.startTest();
        TestUtil.turnOffFeatureGates();

        List<ServiceDelivery__c> deliveries = [
            SELECT Id
            FROM ServiceDelivery__c
            WHERE ServiceSession__c = :sessions[0].Id
        ];

        delete deliveries;

        List<ServiceDelivery__c> deliveriesToDelete = [
            SELECT Id
            FROM ServiceDelivery__c
            WHERE ServiceSession__c = :sessions[1].Id
        ];

        delete deliveriesToDelete;

        ServiceScheduleRollupsSchedulable scheduleRollups = new ServiceScheduleRollupsSchedulable();
        Database.executeBatch(scheduleRollups);
        Test.stopTest();
        requery();

        System.assertEquals(null, serviceSchedules[0].NumPresentServiceDeliveries__c);
        System.assertEquals(null, serviceSchedules[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(1, serviceSchedules[1].NumPresentServiceDeliveries__c);
        System.assertEquals(0, serviceSchedules[1].NumAbsentServiceDeliveries__c);
    }

    @IsTest
    private static void shouldScheduleServiceScheduleRollupsBatch() {
        Test.startTest();

        //parse to cron expression
        String scheduledTime = '0 0 12 * * ?';

        ServiceScheduleRollupsSchedulable scheduleRollups = new ServiceScheduleRollupsSchedulable();
        String jobId = System.schedule(
            'Job Started At ' + scheduledTime,
            scheduledTime,
            scheduleRollups
        );

        CronTrigger cronTrigger = [
            SELECT Id, CronExpression, TimesTriggered
            FROM CronTrigger
            WHERE Id = :jobId
        ];

        //Assert the job has not run yet
        System.assertEquals(0, cronTrigger.TimesTriggered);

        Test.stopTest();
    }

    private static void testDataSetup() {
        requery();

        System.assertEquals(null, serviceSchedules[0].NumPresentServiceDeliveries__c);
        System.assertEquals(null, serviceSchedules[0].NumAbsentServiceDeliveries__c);

        ServiceSchedule__c schedule = new ServiceSchedule__c();

        schedule.Name = 'New Schedule';
        schedule.Frequency__c = 'Monthly';
        schedule.FirstSessionStart__c = DateTime.newInstance(
            System.today().year(),
            System.today().month() + 1,
            10
        );
        schedule.FirstSessionEnd__c = DateTime.newInstance(
            System.today().year(),
            System.today().month() + 1,
            10
        );
        schedule.PrimaryServiceProvider__c = contactRecord.Id;
        schedule.OtherServiceProvider__c = contactRecord.Id;
        schedule.NumPresentServiceDeliveries__c = 1;
        schedule.NumAbsentServiceDeliveries__c = 0;
        schedule.Service__c = service.Id;
        insert schedule;

        ServiceSession__c session = new ServiceSession__c();
        session.ServiceSchedule__c = schedule.Id;
        session.SessionStart__c = schedule.FirstSessionStart__c;
        session.SessionEnd__c = schedule.FirstSessionEnd__c;
        session.PrimaryServiceProvider__c = schedule.PrimaryServiceProvider__c;
        session.OtherServiceProvider__c = schedule.OtherServiceProvider__c;
        session.Status__c = 'Pending';
        insert session;

        serviceDeliveries = new List<ServiceDelivery__c>{
            new ServiceDelivery__c(
                Name = 'test',
                Service__c = service.Id,
                Contact__c = contactRecord.Id,
                ServiceSession__c = sessions[0].Id,
                ProgramEngagement__c = programEngagement.Id,
                Quantity__c = 0,
                AttendanceStatus__c = ABSENCE_STATUS,
                DeliveryDate__c = System.today() - 1
            ),
            new ServiceDelivery__c(
                Name = 'test2',
                Service__c = service.Id,
                Contact__c = contactRecord.Id,
                ServiceSession__c = sessions[0].Id,
                ProgramEngagement__c = programEngagement.Id,
                Quantity__c = 1,
                AttendanceStatus__c = PRESENT_STATUS,
                DeliveryDate__c = System.today()
            ),
            new ServiceDelivery__c(
                Name = 'test3',
                Service__c = service.Id,
                Contact__c = contactRecord.Id,
                ServiceSession__c = sessions[0].Id,
                ProgramEngagement__c = programEngagement.Id,
                Quantity__c = 1,
                AttendanceStatus__c = PRESENT_STATUS,
                DeliveryDate__c = System.today() - 5
            ),
            new ServiceDelivery__c(
                Name = 'test4',
                Service__c = service.Id,
                Contact__c = contactRecord.Id,
                ServiceSession__c = sessions[1].Id,
                ProgramEngagement__c = programEngagement.Id,
                Quantity__c = 1,
                AttendanceStatus__c = PRESENT_STATUS,
                DeliveryDate__c = System.today() - 2
            ),
            new ServiceDelivery__c(
                Name = 'test5',
                Service__c = service.Id,
                Contact__c = contactRecord.Id,
                ServiceSession__c = sessions[1].Id,
                ProgramEngagement__c = programEngagement.Id,
                Quantity__c = 1,
                AttendanceStatus__c = PRESENT_STATUS,
                DeliveryDate__c = System.today() - 5
            ),
            new ServiceDelivery__c(
                Name = 'test6',
                Service__c = service.Id,
                Contact__c = contactRecord.Id,
                ServiceSession__c = session.Id,
                ProgramEngagement__c = programEngagement.Id,
                Quantity__c = 1,
                AttendanceStatus__c = PRESENT_STATUS,
                DeliveryDate__c = System.today() - 5
            )
        };

        insert serviceDeliveries;
    }

    private static void requery() {
        accountRecordId = [SELECT Id FROM Account LIMIT 1].Id;
        contactRecord = [
            SELECT
                Id,
                NumPresentServiceDeliveries__c,
                NumAbsentServiceDeliveries__c,
                LastServiceDate__c,
                ConsecutiveAbsences__c,
                LastModifiedDate
            FROM Contact
            LIMIT 1
        ];

        service = [
            SELECT Id, NumPresentServiceDeliveries__c, NumAbsentServiceDeliveries__c
            FROM Service__c
            LIMIT 1
        ];

        serviceSchedules = [
            SELECT
                Id,
                FirstSessionStart__c,
                FirstSessionEnd__c,
                PrimaryServiceProvider__c,
                OtherServiceProvider__c,
                NumPresentServiceDeliveries__c,
                NumAbsentServiceDeliveries__c
            FROM ServiceSchedule__c
            LIMIT 2
        ];

        sessions = [
            SELECT
                Id,
                NumPresentServiceDeliveries__c,
                NumAbsentServiceDeliveries__c,
                SessionStart__c
            FROM ServiceSession__c
            ORDER BY SessionStart__c DESC
        ];

        programEngagement = [
            SELECT
                Id,
                NumPresentServiceDeliveries__c,
                NumAbsentServiceDeliveries__c,
                LastServiceDate__c,
                ConsecutiveAbsences__c
            FROM ProgramEngagement__c
            LIMIT 1
        ];

        program = [SELECT Id, Name FROM Program__c LIMIT 1];
    }
}
