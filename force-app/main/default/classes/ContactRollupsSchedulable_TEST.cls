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
        TestDataFactory.generateAttendanceData('Monthly');
    }

    @IsTest
    private static void shouldQueryContactsAndExecuteBatch() {
        List<Contact> contactsWithRollupData = [
            SELECT Id
            FROM Contact
            WHERE
                NumPresentServiceDeliveries__c >= 0
                OR NumAbsentServiceDeliveries__c >= 0
                OR LastServiceDate__c != NULL
                OR ConsecutiveAbsences__c >= 0
        ];
        System.assert(
            !contactsWithRollupData.isEmpty(),
            'Expected test data to be queried.'
        );

        Test.startTest();

        ContactRollupsSchedulable contactRollups = new ContactRollupsSchedulable();
        Database.executeBatch(contactRollups);

        Test.stopTest();
    }

    @IsTest
    private static void shouldScheduleContactRollupsBatch() {
        List<Contact> contactsWithRollupData = [
            SELECT Id
            FROM Contact
            WHERE
                NumPresentServiceDeliveries__c >= 0
                OR NumAbsentServiceDeliveries__c >= 0
                OR LastServiceDate__c != NULL
                OR ConsecutiveAbsences__c >= 0
        ];
        System.assert(
            !contactsWithRollupData.isEmpty(),
            'Expected test data to be queried.'
        );

        Test.startTest();

        String hour = String.valueOf(Datetime.now().hour());
        String min = String.valueOf(Datetime.now().minute() + 1);
        String ss = String.valueOf(Datetime.now().second());

        //parse to cron expression
        String scheduledTime = ss + ' ' + min + ' ' + hour + ' * * ?';

        ContactRollupsSchedulable contactRollups = new ContactRollupsSchedulable();
        String jobId = System.schedule(
            'Job Started At ' + String.valueOf(Datetime.now()),
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
