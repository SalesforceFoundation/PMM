/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@isTest
private class ProgramEngagementRollupsSchedulable_TEST {
    private static Id accountRecordId;
    private static Contact contactRecord;
    private static Service__c service;
    private static List<ServiceSession__c> sessions;
    private static List<ProgramEngagement__c> programEngagements;
    private static Program__c program;
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

        ProgramEngagementRollupsSchedulable programEngagementRollups = new ProgramEngagementRollupsSchedulable();
        Database.executeBatch(programEngagementRollups);

        Test.stopTest();

        List<ProgramEngagement__c> programEngagements = [
            SELECT
                Id,
                NumPresentServiceDeliveries__c,
                NumAbsentServiceDeliveries__c,
                ConsecutiveAbsences__c,
                LastServiceDate__c
            FROM ProgramEngagement__c
        ];

        System.assertEquals(2, programEngagements[0].NumPresentServiceDeliveries__c);
        System.assertEquals(1, programEngagements[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(0, programEngagements[0].ConsecutiveAbsences__c);
        System.assertEquals(System.today(), programEngagements[0].LastServiceDate__c);
        System.assertEquals(1, programEngagements[1].NumPresentServiceDeliveries__c);
        System.assertEquals(0, programEngagements[1].NumAbsentServiceDeliveries__c);
        System.assertEquals(0, programEngagements[1].ConsecutiveAbsences__c);
        System.assertEquals(System.today() - 2, programEngagements[1].LastServiceDate__c);
        System.assertEquals(1, programEngagements[2].NumPresentServiceDeliveries__c);
        System.assertEquals(0, programEngagements[2].NumAbsentServiceDeliveries__c);
        System.assertEquals(0, programEngagements[2].ConsecutiveAbsences__c);
        System.assertEquals(System.today(), programEngagements[2].LastServiceDate__c);
    }

    @IsTest
    private static void shouldIncrementCountOnUpdate() {
        testDataSetup();

        Test.startTest();
        TestUtil.turnOffFeatureGates();
        serviceDeliveries[0].AttendanceStatus__c = PRESENT_STATUS;
        serviceDeliveries[0].Quantity__c = 1;
        update serviceDeliveries[0];

        ProgramEngagementRollupsSchedulable programEngagementRollups = new ProgramEngagementRollupsSchedulable();
        Database.executeBatch(programEngagementRollups);

        Test.stopTest();

        requery();

        System.assertEquals(3, programEngagements[0].NumPresentServiceDeliveries__c);
        System.assertEquals(0, programEngagements[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(0, programEngagements[0].ConsecutiveAbsences__c);
        System.assertEquals(System.today(), programEngagements[0].LastServiceDate__c);
        System.assertEquals(1, programEngagements[1].NumPresentServiceDeliveries__c);
        System.assertEquals(0, programEngagements[1].NumAbsentServiceDeliveries__c);
        System.assertEquals(0, programEngagements[1].ConsecutiveAbsences__c);
        System.assertEquals(System.today() - 2, programEngagements[1].LastServiceDate__c);
    }

    @IsTest
    private static void shouldDecrementCountOnDelete() {
        testDataSetup();

        Test.startTest();
        TestUtil.turnOffFeatureGates();
        delete serviceDeliveries[0];

        ProgramEngagementRollupsSchedulable programEngagementRollups = new ProgramEngagementRollupsSchedulable();
        Database.executeBatch(programEngagementRollups);

        Test.stopTest();

        requery();

        System.assertEquals(2, programEngagements[0].NumPresentServiceDeliveries__c);
        System.assertEquals(0, programEngagements[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(0, programEngagements[0].ConsecutiveAbsences__c);
        System.assertEquals(System.today(), programEngagements[0].LastServiceDate__c);
    }

    @IsTest
    private static void shouldResetParentsWithoutDeliveries() {
        testDataSetup();

        Test.startTest();
        TestUtil.turnOffFeatureGates();

        List<ServiceDelivery__c> deliveries = [
            SELECT Id
            FROM ServiceDelivery__c
            WHERE ProgramEngagement__c = :programEngagements[0].Id
        ];
        delete deliveries;

        ProgramEngagementRollupsSchedulable programEngagementRollups = new ProgramEngagementRollupsSchedulable();
        Database.executeBatch(programEngagementRollups);
        Test.stopTest();
        requery();

        System.assertEquals(null, programEngagements[0].NumPresentServiceDeliveries__c);
        System.assertEquals(null, programEngagements[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(null, programEngagements[0].ConsecutiveAbsences__c);
        System.assertEquals(null, programEngagements[0].LastServiceDate__c);
    }

    @IsTest
    private static void shouldScheduleProgramEngagementRollupsBatch() {
        Test.startTest();

        //parse to cron expression
        String scheduledTime = '0 0 12 * * ?';

        ProgramEngagementRollupsSchedulable programEngagementRollups = new ProgramEngagementRollupsSchedulable();
        String jobId = System.schedule(
            'Job Started At ' + scheduledTime,
            scheduledTime,
            programEngagementRollups
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

        System.assertEquals(null, programEngagements[0].NumPresentServiceDeliveries__c);
        System.assertEquals(null, programEngagements[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(null, programEngagements[0].ConsecutiveAbsences__c);
        System.assertEquals(null, programEngagements[0].LastServiceDate__c);

        Contact newContact = new Contact();
        newContact.LastName = 'Test Batch Contact';
        newContact.AccountId = accountRecordId;
        newContact.NumAbsentServiceDeliveries__c = 0;
        newContact.NumPresentServiceDeliveries__c = 1;
        newContact.ConsecutiveAbsences__c = 0;
        newContact.LastServiceDate__c = System.today();
        insert newContact;

        ProgramEngagement__c engagement = new ProgramEngagement__c();
        engagement.Name = 'Program Engagement for the new contact';
        engagement.Stage__c = 'Enrolled';
        engagement.Contact__c = newContact.Id;
        engagement.Program__c = program.Id;
        engagement.Role__c = 'Client';
        engagement.NumPresentServiceDeliveries__c = 1;
        engagement.NumAbsentServiceDeliveries__c = 0;
        engagement.ConsecutiveAbsences__c = 0;
        engagement.LastServiceDate__c = System.today();
        insert engagement;

        serviceDeliveries = new List<ServiceDelivery__c>{
            new ServiceDelivery__c(
                Name = 'test',
                Service__c = service.Id,
                Contact__c = contactRecord.Id,
                ServiceSession__c = sessions[0].Id,
                ProgramEngagement__c = programEngagements[0].Id,
                Quantity__c = 0,
                AttendanceStatus__c = ABSENCE_STATUS,
                DeliveryDate__c = System.today() - 1
            ),
            new ServiceDelivery__c(
                Name = 'test2',
                Service__c = service.Id,
                Contact__c = contactRecord.Id,
                ServiceSession__c = sessions[1].Id,
                ProgramEngagement__c = programEngagements[0].Id,
                Quantity__c = 1,
                AttendanceStatus__c = PRESENT_STATUS,
                DeliveryDate__c = System.today()
            ),
            new ServiceDelivery__c(
                Name = 'test3',
                Service__c = service.Id,
                Contact__c = contactRecord.Id,
                ServiceSession__c = sessions[1].Id,
                ProgramEngagement__c = programEngagements[0].Id,
                Quantity__c = 1,
                AttendanceStatus__c = PRESENT_STATUS,
                DeliveryDate__c = System.today() - 10
            ),
            new ServiceDelivery__c(
                Name = 'test4',
                Service__c = service.Id,
                Contact__c = newContact.Id,
                ProgramEngagement__c = engagement.Id,
                Quantity__c = 1,
                AttendanceStatus__c = PRESENT_STATUS,
                DeliveryDate__c = System.today()
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

        programEngagements = [
            SELECT
                Id,
                NumPresentServiceDeliveries__c,
                NumAbsentServiceDeliveries__c,
                LastServiceDate__c,
                ConsecutiveAbsences__c
            FROM ProgramEngagement__c
            LIMIT 2
        ];

        program = [SELECT Id, Name FROM Program__c LIMIT 1];
    }
}
