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
    @testSetup
    static void setup() {
        TestUtil.turnOffFeatureGates();
        TestDataFactory.generateRollupData();
    }

    @IsTest
    private static void shouldQuerySessionsAndExecuteBatch() {
        Test.startTest();

        SessionRollupsSchedulable sessionRollups = new SessionRollupsSchedulable();
        Database.executeBatch(sessionRollups);

        Test.stopTest();

        List<ServiceSession__c> sessions = [
            SELECT Id, NumPresentServiceDeliveries__c, NumAbsentServiceDeliveries__c
            FROM ServiceSession__c
        ];

        System.assertEquals(null, sessions[0].NumPresentServiceDeliveries__c);
        System.assertEquals(null, sessions[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(3, sessions[1].NumPresentServiceDeliveries__c);
        System.assertEquals(0, sessions[1].NumAbsentServiceDeliveries__c);
        System.assertEquals(null, sessions[2].NumPresentServiceDeliveries__c);
        System.assertEquals(null, sessions[2].NumAbsentServiceDeliveries__c);
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
}
