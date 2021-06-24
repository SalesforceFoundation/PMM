/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@isTest
private class SessionRollupsSchedulable_TEST {
    private static Id accountRecordId;
    private static Contact contactRecord;
    private static Service__c service;
    private static ProgramEngagement__c programEngagement;
    private static Program__c program;
    private static ServiceSchedule__c serviceSchedule;
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

        SessionRollupsSchedulable sessionRollups = new SessionRollupsSchedulable();
        Database.executeBatch(sessionRollups);

        Test.stopTest();
        List<ServiceSession__c> sessions = [
            SELECT Id, NumAbsentServiceDeliveries__c, NumPresentServiceDeliveries__c
            FROM ServiceSession__c
            ORDER BY SessionStart__c DESC
        ];

        System.assertEquals(2, sessions[0].NumPresentServiceDeliveries__c);
        System.assertEquals(0, sessions[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(null, sessions[1].NumPresentServiceDeliveries__c);
        System.assertEquals(null, sessions[1].NumAbsentServiceDeliveries__c);
        System.assertEquals(null, sessions[2].NumPresentServiceDeliveries__c);
        System.assertEquals(null, sessions[2].NumAbsentServiceDeliveries__c);
        System.assertEquals(2, sessions[3].NumPresentServiceDeliveries__c);
        System.assertEquals(1, sessions[3].NumAbsentServiceDeliveries__c);
    }

    @IsTest
    private static void shouldIncrementCountOnUpdate() {
        testDataSetup();

        Test.startTest();
        TestUtil.turnOffFeatureGates();
        serviceDeliveries[3].AttendanceStatus__c = ABSENCE_STATUS;
        serviceDeliveries[3].Quantity__c = 0;
        update serviceDeliveries[3];

        SessionRollupsSchedulable sessionRollups = new SessionRollupsSchedulable();
        Database.executeBatch(sessionRollups);

        Test.stopTest();
        requery();

        System.assertEquals(1, sessions[0].NumPresentServiceDeliveries__c);
        System.assertEquals(1, sessions[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(null, sessions[1].NumPresentServiceDeliveries__c);
        System.assertEquals(null, sessions[1].NumAbsentServiceDeliveries__c);
    }

    @IsTest
    private static void shouldDecrementCountOnDelete() {
        testDataSetup();

        Test.startTest();
        TestUtil.turnOffFeatureGates();
        delete serviceDeliveries[3];

        SessionRollupsSchedulable sessionRollups = new SessionRollupsSchedulable();
        Database.executeBatch(sessionRollups);

        Test.stopTest();
        requery();

        System.assertEquals(1, sessions[0].NumPresentServiceDeliveries__c);
        System.assertEquals(0, sessions[0].NumAbsentServiceDeliveries__c);
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

        SessionRollupsSchedulable sessionRollups = new SessionRollupsSchedulable();
        Database.executeBatch(sessionRollups);
        Test.stopTest();
        requery();

        System.assertEquals(null, sessions[0].NumPresentServiceDeliveries__c);
        System.assertEquals(null, sessions[0].NumAbsentServiceDeliveries__c);
    }

    @IsTest
    private static void shouldScheduleSessionRollupsBatch() {
        Test.startTest();

        //parse to cron expression
        String scheduledTime = '0 0 12 * * ?';

        SessionRollupsSchedulable sessionRollups = new SessionRollupsSchedulable();
        String jobId = System.schedule(
            'Job Started At ' + scheduledTime,
            scheduledTime,
            sessionRollups
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

        System.assertEquals(null, sessions[0].NumPresentServiceDeliveries__c);
        System.assertEquals(null, sessions[0].NumAbsentServiceDeliveries__c);

        ServiceSession__c newSession = new ServiceSession__c();
        newSession.ServiceSchedule__c = serviceSchedule.Id;
        newSession.SessionStart__c = serviceSchedule.FirstSessionStart__c;
        newSession.SessionEnd__c = serviceSchedule.FirstSessionEnd__c;
        newSession.PrimaryServiceProvider__c = serviceSchedule.PrimaryServiceProvider__c;
        newSession.OtherServiceProvider__c = serviceSchedule.OtherServiceProvider__c;
        newSession.NumAbsentServiceDeliveries__c = 1;
        newSession.NumPresentServiceDeliveries__c = 2;
        newSession.Status__c = 'Complete';
        insert newSession;

        serviceDeliveries = new List<ServiceDelivery__c>{
            new ServiceDelivery__c(
                Name = 'test',
                Service__c = service.Id,
                Contact__c = contactRecord.Id,
                ServiceSession__c = newSession.Id,
                ProgramEngagement__c = programEngagement.Id,
                Quantity__c = 0,
                AttendanceStatus__c = ABSENCE_STATUS,
                DeliveryDate__c = System.today() - 1
            ),
            new ServiceDelivery__c(
                Name = 'test2',
                Service__c = service.Id,
                Contact__c = contactRecord.Id,
                ServiceSession__c = newSession.Id,
                ProgramEngagement__c = programEngagement.Id,
                Quantity__c = 1,
                AttendanceStatus__c = PRESENT_STATUS,
                DeliveryDate__c = System.today()
            ),
            new ServiceDelivery__c(
                Name = 'test3',
                Service__c = service.Id,
                Contact__c = contactRecord.Id,
                ServiceSession__c = newSession.Id,
                ProgramEngagement__c = programEngagement.Id,
                Quantity__c = 1,
                AttendanceStatus__c = PRESENT_STATUS,
                DeliveryDate__c = System.today() - 5
            ),
            new ServiceDelivery__c(
                Name = 'test4',
                Service__c = service.Id,
                Contact__c = contactRecord.Id,
                ServiceSession__c = sessions[0].Id,
                ProgramEngagement__c = programEngagement.Id,
                Quantity__c = 1,
                AttendanceStatus__c = PRESENT_STATUS,
                DeliveryDate__c = System.today() - 2
            ),
            new ServiceDelivery__c(
                Name = 'test5',
                Service__c = service.Id,
                Contact__c = contactRecord.Id,
                ServiceSession__c = sessions[0].Id,
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

        sessions = [
            SELECT
                Id,
                NumPresentServiceDeliveries__c,
                NumAbsentServiceDeliveries__c,
                SessionStart__c
            FROM ServiceSession__c
            ORDER BY SessionStart__c DESC
            LIMIT 2
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

        serviceSchedule = [
            SELECT
                Id,
                FirstSessionStart__c,
                FirstSessionEnd__c,
                PrimaryServiceProvider__c,
                OtherServiceProvider__c
            FROM ServiceSchedule__c
            LIMIT 1
        ];
    }
}
