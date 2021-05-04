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
    @testSetup
    static void setup() {
        TestUtil.turnOffFeatureGates();
        TestDataFactory.generateRollupData();
    }

    @IsTest
    private static void shouldQueryServicesAndExecuteBatch() {
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
        System.assertEquals(6, services[1].NumPresentServiceDeliveries__c);
        System.assertEquals(2, services[1].NumAbsentServiceDeliveries__c);
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
}
