/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@isTest
private class ServiceRollupsSchedulable_TEST {
    private static Id accountRecordId;
    private static Contact contactRecord;
    private static List<Service__c> services;
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

        ServiceRollupsSchedulable serviceRollups = new ServiceRollupsSchedulable();
        Database.executeBatch(serviceRollups);

        Test.stopTest();

        List<Service__c> services = [
            SELECT Id, NumPresentServiceDeliveries__c, NumAbsentServiceDeliveries__c
            FROM Service__c
        ];

        System.assertEquals(1, services[0].NumPresentServiceDeliveries__c);
        System.assertEquals(1, services[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(1, services[1].NumPresentServiceDeliveries__c);
        System.assertEquals(0, services[1].NumAbsentServiceDeliveries__c);
        System.assertEquals(1, services[2].NumAbsentServiceDeliveries__c);
        System.assertEquals(1, services[2].NumAbsentServiceDeliveries__c);
    }

    @IsTest
    private static void shouldIncrementCountOnUpdate() {
        testDataSetup();

        Test.startTest();
        serviceDeliveries[1].AttendanceStatus__c = PRESENT_STATUS;
        serviceDeliveries[1].Quantity__c = 3;
        update serviceDeliveries[1];

        ServiceRollupsSchedulable serviceRollups = new ServiceRollupsSchedulable();
        Database.executeBatch(serviceRollups);

        Test.stopTest();
        requery();

        System.assertEquals(2, services[0].NumPresentServiceDeliveries__c);
        System.assertEquals(0, services[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(1, services[1].NumPresentServiceDeliveries__c);
        System.assertEquals(0, services[1].NumAbsentServiceDeliveries__c);
    }

    @IsTest
    private static void shouldDecrementCountOnDelete() {
        testDataSetup();

        Test.startTest();
        delete serviceDeliveries[0];

        ServiceRollupsSchedulable serviceRollups = new ServiceRollupsSchedulable();
        Database.executeBatch(serviceRollups);

        Test.stopTest();
        requery();

        System.assertEquals(0, services[0].NumPresentServiceDeliveries__c);
        System.assertEquals(1, services[0].NumAbsentServiceDeliveries__c);
    }

    @IsTest
    private static void shouldScheduleServiceRollupsBatch() {
        Test.startTest();

        //parse to cron expression
        String scheduledTime = '0 0 12 * * ?';

        ServiceRollupsSchedulable serviceRollups = new ServiceRollupsSchedulable();
        String jobId = System.schedule(
            'Job Started At ' + scheduledTime,
            scheduledTime,
            serviceRollups
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

        System.assertEquals(null, services[0].NumPresentServiceDeliveries__c);
        System.assertEquals(null, services[0].NumAbsentServiceDeliveries__c);

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

        Service__c newService = new Service__c();
        newService.Name = 'Service 2';
        newService.Program__c = program.Id;
        newService.Status__c = 'Active';
        newService.UnitOfMeasurement__c = 'Days';
        newService.NumPresentServiceDeliveries__c = 1;
        newService.NumAbsentServiceDeliveries__c = 1;
        insert newService;

        serviceDeliveries = new List<ServiceDelivery__c>{
            new ServiceDelivery__c(
                Name = 'test',
                Service__c = services[0].Id,
                Contact__c = contactRecord.Id,
                ServiceSession__c = sessions[0].Id,
                ProgramEngagement__c = programEngagement.Id,
                Quantity__c = 1,
                AttendanceStatus__c = PRESENT_STATUS,
                DeliveryDate__c = System.today() - 1
            ),
            new ServiceDelivery__c(
                Name = 'test2',
                Service__c = services[0].Id,
                Contact__c = contactRecord.Id,
                ServiceSession__c = sessions[1].Id,
                ProgramEngagement__c = programEngagement.Id,
                Quantity__c = 1,
                AttendanceStatus__c = ABSENCE_STATUS,
                DeliveryDate__c = System.today()
            ),
            new ServiceDelivery__c(
                Name = 'test3',
                Service__c = newService.Id,
                Contact__c = newContact.Id,
                ProgramEngagement__c = engagement.Id,
                Quantity__c = 1,
                AttendanceStatus__c = PRESENT_STATUS,
                DeliveryDate__c = System.today()
            ),
            new ServiceDelivery__c(
                Name = 'test4',
                Service__c = newService.Id,
                Contact__c = newContact.Id,
                ProgramEngagement__c = engagement.Id,
                Quantity__c = 1,
                AttendanceStatus__c = ABSENCE_STATUS,
                DeliveryDate__c = System.today() - 2
            )
        };

        insert serviceDeliveries;
    }

    private static void requery() {
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

        services = [
            SELECT Id, NumPresentServiceDeliveries__c, NumAbsentServiceDeliveries__c
            FROM Service__c
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
