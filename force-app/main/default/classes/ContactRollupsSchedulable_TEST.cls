/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@isTest
private class ContactRollupsSchedulable_TEST {
    private static Id accountRecordId;
    private static List<Contact> contacts;
    private static Service__c service;
    private static List<ServiceSession__c> sessions;
    private static ProgramEngagement__c programEngagement;
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

        ContactRollupsSchedulable contactRollups = new ContactRollupsSchedulable();
        Database.executeBatch(contactRollups);

        Test.stopTest();
        List<Contact> contacts = [
            SELECT
                Id,
                NumAbsentServiceDeliveries__c,
                NumPresentServiceDeliveries__c,
                LastServiceDate__c,
                ConsecutiveAbsences__c
            FROM Contact
        ];

        System.assertEquals(2, contacts[0].NumPresentServiceDeliveries__c);
        System.assertEquals(1, contacts[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(0, contacts[0].ConsecutiveAbsences__c);
        System.assertEquals(System.today(), contacts[0].LastServiceDate__c);
        System.assertEquals(null, contacts[1].NumPresentServiceDeliveries__c);
        System.assertEquals(null, contacts[1].NumAbsentServiceDeliveries__c);
        System.assertEquals(null, contacts[1].ConsecutiveAbsences__c);
        System.assertEquals(1, contacts[2].NumPresentServiceDeliveries__c);
        System.assertEquals(0, contacts[2].NumAbsentServiceDeliveries__c);
        System.assertEquals(0, contacts[2].ConsecutiveAbsences__c);
        System.assertEquals(System.today(), contacts[2].LastServiceDate__c);
    }

    @IsTest
    private static void shouldIncrementCountOnUpdate() {
        testDataSetup();

        Test.startTest();
        serviceDeliveries[1].AttendanceStatus__c = ABSENCE_STATUS;
        serviceDeliveries[1].Quantity__c = 0;
        update serviceDeliveries[1];

        ContactRollupsSchedulable contactRollups = new ContactRollupsSchedulable();
        Database.executeBatch(contactRollups);

        Test.stopTest();
        requery();

        System.assertEquals(1, contacts[0].NumPresentServiceDeliveries__c);
        System.assertEquals(2, contacts[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(2, contacts[0].ConsecutiveAbsences__c);
        System.assertEquals(System.today(), contacts[0].LastServiceDate__c);
        System.assertEquals(null, contacts[1].NumPresentServiceDeliveries__c);
        System.assertEquals(null, contacts[1].NumAbsentServiceDeliveries__c);
        System.assertEquals(null, contacts[1].ConsecutiveAbsences__c);
    }

    @IsTest
    private static void shouldDecrementCountOnDelete() {
        testDataSetup();

        Test.startTest();
        delete serviceDeliveries[0];

        ContactRollupsSchedulable contactRollups = new ContactRollupsSchedulable();
        Database.executeBatch(contactRollups);

        Test.stopTest();
        requery();

        System.assertEquals(2, contacts[0].NumPresentServiceDeliveries__c);
        System.assertEquals(0, contacts[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(0, contacts[0].ConsecutiveAbsences__c);
        System.assertEquals(System.today(), contacts[0].LastServiceDate__c);
    }

    @IsTest
    private static void shouldScheduleContactRollupsBatch() {
        Test.startTest();

        //parse to cron expression
        String scheduledTime = '0 0 12 * * ?';

        ContactRollupsSchedulable contactRollups = new ContactRollupsSchedulable();
        String jobId = System.schedule(
            'Job Started At ' + scheduledTime,
            scheduledTime,
            contactRollups
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

        System.assertEquals(null, contacts[0].NumPresentServiceDeliveries__c);
        System.assertEquals(null, contacts[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(null, contacts[0].ConsecutiveAbsences__c);
        System.assertEquals(null, contacts[0].LastServiceDate__c);

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

        insert engagement;

        serviceDeliveries = new List<ServiceDelivery__c>{
            new ServiceDelivery__c(
                Name = 'test',
                Service__c = service.Id,
                Contact__c = contacts[0].Id,
                ServiceSession__c = sessions[0].Id,
                ProgramEngagement__c = programEngagement.Id,
                Quantity__c = 0,
                AttendanceStatus__c = ABSENCE_STATUS,
                DeliveryDate__c = System.today() - 1
            ),
            new ServiceDelivery__c(
                Name = 'test2',
                Service__c = service.Id,
                Contact__c = contacts[0].Id,
                ServiceSession__c = sessions[1].Id,
                ProgramEngagement__c = programEngagement.Id,
                Quantity__c = 1,
                AttendanceStatus__c = PRESENT_STATUS,
                DeliveryDate__c = System.today()
            ),
            new ServiceDelivery__c(
                Name = 'test3',
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
        contacts = [
            SELECT
                Id,
                NumPresentServiceDeliveries__c,
                NumAbsentServiceDeliveries__c,
                LastServiceDate__c,
                ConsecutiveAbsences__c,
                LastModifiedDate
            FROM Contact
            LIMIT 2
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
    }
}
