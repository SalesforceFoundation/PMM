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
    private static Id mockContactId = TestUtil.mockId(Contact.sObjectType);
    private static Id mockEngagementId = TestUtil.mockId(
        ProgramEngagement__c.sObjectType
    );
    private static Id mockServiceId = TestUtil.mockId(Service__c.sObjectType);

    @TestSetup
    private static void createTestData() {
        // By turning off none, we turn on all
        TestUtil.turnOffFeatureGates(new Set<String>{});
        TestDataFactory.generateAttendanceData('Monthly');
    }

    @IsTest
    private static void shouldUpdateParticipantsEnrolled() {
        ServiceParticipantRollupsService rollupService = new ServiceParticipantRollupsService();
        createTestData();

        Integer expectedEnrolledParticipants = 2;

        List<ServiceParticipant__c> participants = new List<ServiceParticipant__c>(
            [SELECT Id, ServiceSchedule__c FROM ServiceParticipant__c]
        );

        Test.startTest();
        rollupService.processParticipantRollups(participants);
        Test.stopTest();

        ServiceSchedule__c schedule = [
            SELECT Id, ParticipantsEnrolled__c
            FROM serviceschedule__c
            LIMIT 1
        ];

        System.assertEquals(
            expectedEnrolledParticipants,
            schedule.ParticipantsEnrolled__c
        );
    }

    @IsTest
    private static void shouldNotUpdateParticipantsEnrolledIfStatusIsNotEnrolled() {
        ServiceParticipantRollupsService rollupService = new ServiceParticipantRollupsService();
        createTestData();

        Integer expectedEnrolledParticipants = 1;

        List<ServiceParticipant__c> participants = new List<ServiceParticipant__c>(
            [SELECT Id, ServiceSchedule__c FROM ServiceParticipant__c]
        );

        participants[0].Status__c = 'Withdrawn';
        update participants[0];

        List<ServiceParticipant__c> updatedParticipants = new List<ServiceParticipant__c>(
            [SELECT Id, ServiceSchedule__c FROM ServiceParticipant__c]
        );

        Test.startTest();
        rollupService.processParticipantRollups(updatedParticipants);
        Test.stopTest();

        ServiceSchedule__c schedule = [
            SELECT Id, ParticipantsEnrolled__c
            FROM serviceschedule__c
            LIMIT 1
        ];

        System.assertEquals(
            expectedEnrolledParticipants,
            schedule.ParticipantsEnrolled__c
        );
    }
}
