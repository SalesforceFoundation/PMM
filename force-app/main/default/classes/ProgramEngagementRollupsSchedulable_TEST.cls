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
        TestDataFactory.generateRollupData();
    }

    @IsTest
    private static void shouldQueryProgramEngagementsAndExecuteBatch() {
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

        System.assertEquals(1, programEngagements[0].NumPresentServiceDeliveries__c);
        System.assertEquals(1, programEngagements[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(0, programEngagements[0].ConsecutiveAbsences__c);
        System.assertEquals(System.today() - 2, programEngagements[0].LastServiceDate__c);
        System.assertEquals(1, programEngagements[1].NumPresentServiceDeliveries__c);
        System.assertEquals(0, programEngagements[1].NumAbsentServiceDeliveries__c);
        System.assertEquals(0, programEngagements[1].ConsecutiveAbsences__c);
        System.assertEquals(System.today() - 2, programEngagements[1].LastServiceDate__c);
        System.assertEquals(2, programEngagements[2].NumPresentServiceDeliveries__c);
        System.assertEquals(2, programEngagements[2].NumAbsentServiceDeliveries__c);
        System.assertEquals(0, programEngagements[2].ConsecutiveAbsences__c);
        System.assertEquals(System.today() - 7, programEngagements[2].LastServiceDate__c);
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
}
