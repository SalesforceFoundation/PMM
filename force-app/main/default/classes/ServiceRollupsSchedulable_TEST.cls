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
        TestDataFactory.generateAttendanceData('Monthly');
    }

    @IsTest
    private static void shouldQueryServicesAndExecuteBatch() {
        List<Service__c> servicesWithRollupData = [
            SELECT Id
            FROM Service__c
            WHERE
                NumPresentServiceDeliveries__c >= 0
                OR NumAbsentServiceDeliveries__c >= 0
        ];

        System.assert(
            !servicesWithRollupData.isEmpty(),
            'Expected test data to be queried.'
        );

        Test.startTest();

        ServiceRollupsSchedulable serviceRollups = new ServiceRollupsSchedulable();
        Database.executeBatch(serviceRollups);

        Test.stopTest();
    }

    @IsTest
    private static void shouldScheduleServiceRollupsBatch() {
        List<Service__c> servicesWithRollupData = [
            SELECT Id
            FROM Service__c
            WHERE
                NumPresentServiceDeliveries__c >= 0
                OR NumAbsentServiceDeliveries__c >= 0
        ];

        System.assert(
            !servicesWithRollupData.isEmpty(),
            'Expected test data to be queried.'
        );

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
