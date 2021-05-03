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
    @testSetup
    static void setup() {
        TestUtil.turnOffFeatureGates();
        TestDataFactory.generateAttendanceData('Monthly');
    }

    @IsTest
    private static void shouldQueryProgramEngagementsAndExecuteBatch() {
        List<ProgramEngagement__c> programEngagementsWithRollupData = [
            SELECT Id
            FROM ProgramEngagement__c
            WHERE
                NumPresentServiceDeliveries__c >= 0
                OR NumAbsentServiceDeliveries__c >= 0
                OR LastServiceDate__c != NULL
                OR ConsecutiveAbsences__c >= 0
        ];

        System.assert(
            !programEngagementsWithRollupData.isEmpty(),
            'Expected test data to be queried.'
        );

        Test.startTest();

        ProgramEngagementRollupsSchedulable programEngagementRollups = new ProgramEngagementRollupsSchedulable();
        Database.executeBatch(programEngagementRollups);

        Test.stopTest();
    }

    @IsTest
    private static void shouldScheduleProgramEngagementRollupsBatch() {
        List<ProgramEngagement__c> programEngagementsWithRollupData = [
            SELECT Id
            FROM ProgramEngagement__c
            WHERE
                NumPresentServiceDeliveries__c >= 0
                OR NumAbsentServiceDeliveries__c >= 0
                OR LastServiceDate__c != NULL
                OR ConsecutiveAbsences__c >= 0
        ];

        System.assert(
            !programEngagementsWithRollupData.isEmpty(),
            'Expected test data to be queried.'
        );

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
}
