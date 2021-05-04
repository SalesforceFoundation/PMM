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
    @testSetup
    static void setup() {
        TestUtil.turnOffFeatureGates();
        TestDataFactory.generateRollupData();
    }

    @IsTest
    private static void shouldQueryContactsAndExecuteBatch() {
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

        System.assertEquals(1, contacts[0].NumPresentServiceDeliveries__c);
        System.assertEquals(1, contacts[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(0, contacts[0].ConsecutiveAbsences__c);
        System.assertEquals(System.today() - 2, contacts[0].LastServiceDate__c);
        System.assertEquals(1, contacts[1].NumPresentServiceDeliveries__c);
        System.assertEquals(0, contacts[1].NumAbsentServiceDeliveries__c);
        System.assertEquals(0, contacts[1].ConsecutiveAbsences__c);
        System.assertEquals(System.today() - 2, contacts[1].LastServiceDate__c);
        System.assertEquals(5, contacts[2].NumPresentServiceDeliveries__c);
        System.assertEquals(2, contacts[2].NumAbsentServiceDeliveries__c);
        System.assertEquals(0, contacts[2].ConsecutiveAbsences__c);
        System.assertEquals(System.today() - 2, contacts[2].LastServiceDate__c);
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
}
