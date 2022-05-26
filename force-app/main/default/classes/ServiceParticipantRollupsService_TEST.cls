/*
 *
 *  * Copyright (c) 2022, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */
@IsTest
public with sharing class ServiceParticipantRollupsService_TEST {
    private static ServiceParticipantRollupsService rollupService = new ServiceParticipantRollupsService();

    @TestSetup
    private static void createTestData() {
        // By turning off none, we turn on all
        TestUtil.turnOffFeatureGates(new Set<String>{});
        TestDataFactory.generateAttendanceData('Monthly');
    }

    @IsTest
    private static void shouldUpdateParticipantsEnrolled() {
        createTestData();
        Integer expectedEnrolledParticipants = 2;
        ServiceParticipantRollupsService rollupService = new ServiceParticipantRollupsService();

        List<ServiceSchedule__c> schedulesToReturn = new List<ServiceSchedule__c>(
            [
                SELECT
                    Id,
                    ParticipantsEnrolled__c,
                    (
                        SELECT Id, Status__c
                        FROM ServiceParticipants__r
                        WHERE status__c = 'Enrolled'
                    )
                FROM ServiceSchedule__c
                LIMIT 1
            ]
        );

        List<ServiceParticipant__c> participants = new List<ServiceParticipant__c>(
            [
                SELECT Id, Status__c, ServiceSchedule__c
                FROM ServiceParticipant__c
                WHERE ServiceSchedule__c = :schedulesToReturn[0].Id
            ]
        );

        TestStub serviceScheduleSelectorStub = new StubBuilder(
                ServiceScheduleSelector.class
            )
            .when('getSchedulesWithParticipants', Set<Id>.class)
            .calledWith(new Set<Id>{ schedulesToReturn[0].Id })
            .thenReturn(schedulesToReturn)
            .build();

        rollupService.scheduleSelector = (ServiceScheduleSelector) serviceScheduleSelectorStub.create();

        Test.startTest();
        rollupService.processParticipantRollups(participants);
        Test.stopTest();

        System.assertEquals(
            expectedEnrolledParticipants,
            schedulesToReturn[0].ParticipantsEnrolled__c,
            'Expected the number of enrolled participants to be the same as what is returned from the selector'
        );

        serviceScheduleSelectorStub.assertCalledAsExpected();
    }
}
