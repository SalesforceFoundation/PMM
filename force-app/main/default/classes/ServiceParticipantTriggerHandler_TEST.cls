/*
 *
 *  * Copyright (c) 2022, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class ServiceParticipantTriggerHandler_TEST {
    private static Contact contactRecord;
    private static Service__c service;
    public static ProgramEngagement__c engagement;
    private static List<ServiceParticipant__c> serviceParticipants;
    private static List<ServiceSchedule__c> serviceSchedules;

    @TestSetup
    private static void createServiceData() {
        // By turning off none, we turn on all
        TestUtil.turnOffFeatureGates(new Set<String>{});
        TestDataFactory.generateAttendanceData('Monthly');
    }

    // ////////// Functional Tests //////////
    @IsTest
    private static void shouldIncrementParticipantEnrolledCountOnInsert() {
        setupTest(new Set<String>{});
        requery();

        // The participant records were inserted in the setupTest method
        System.assertEquals(4, serviceSchedules[0].ParticipantsEnrolled__c);
    }

    @IsTest
    private static void shouldDecrementParticipantEnrolledCountOnDelete() {
        setupTest(new Set<String>{});

        Test.startTest();
        delete serviceParticipants[0];
        Test.stopTest();

        requery();

        System.assertEquals(3, serviceSchedules[0].ParticipantsEnrolled__c);
    }

    @IsTest
    private static void shouldIncrementParticipantEnrolledCountOnUnDelete() {
        setupTest(new Set<String>{});
        delete serviceParticipants[0];

        Test.startTest();
        undelete serviceParticipants[0];
        Test.stopTest();

        requery();
        System.assertEquals(4, serviceSchedules[0].ParticipantsEnrolled__c);
    }

    @IsTest
    private static void shouldIncrementParticipantEnrolledCountOnUpdate() {
        setupTest(new Set<String>{});
        System.assertEquals(2, serviceSchedules[0].ParticipantsEnrolled__c);

        requery();

        Test.startTest();
        serviceParticipants[3].Status__c = 'Enrolled';
        update serviceParticipants[3];
        Test.stopTest();

        requery();

        System.assertEquals(5, serviceSchedules[0].ParticipantsEnrolled__c);
    }

    @IsTest
    private static void shouldDecrementParticipantEnrolledCountOnUpdate() {
        setupTest(new Set<String>{});
        System.assertEquals(2, serviceSchedules[0].ParticipantsEnrolled__c);

        requery();

        Test.startTest();
        serviceParticipants[0].Status__c = 'Withdrawn';
        update serviceParticipants[0];
        Test.stopTest();

        requery();

        System.assertEquals(3, serviceSchedules[0].ParticipantsEnrolled__c);
    }

    @IsTest
    private static void shouldCallExecuteMethod() {
        setupTest(new Set<String>{});

        Test.startTest();
        ServiceParticipantTriggerHandler triggerHandler = new ServiceParticipantTriggerHandler();
        triggerHandler.execute();
        Test.stopTest();

        requery();

        //assert that none of the records were updated
        System.assertEquals(4, serviceSchedules[0].ParticipantsEnrolled__c);
    }

    @IsTest
    private static void shouldPassInvalidOperationType() {
        setupTest(new Set<String>{});

        Test.startTest();
        new ServiceParticipantTriggerHandler().delegate();
        Test.stopTest();

        requery();

        //assert that none of the records were updated
        System.assertEquals(4, serviceSchedules[0].ParticipantsEnrolled__c);
    }

    private static void setupTest(Set<String> featureGatesToDisable) {
        TestUtil.turnOffFeatureGates(featureGatesToDisable);
        requery();

        System.assertEquals(2, serviceSchedules[0].ParticipantsEnrolled__c);

        serviceParticipants = new List<ServiceParticipant__c>{
            new ServiceParticipant__c(
                Name = 'Test Participant 1',
                Contact__c = contactRecord.Id,
                ProgramEngagement__c = engagement.Id,
                Service__c = service.Id,
                ServiceSchedule__c = serviceSchedules[0].Id,
                SignUpDate__c = System.today()
            ),
            new ServiceParticipant__c(
                Name = 'Test Participant 2',
                Contact__c = contactRecord.Id,
                ProgramEngagement__c = engagement.Id,
                Service__c = service.Id,
                ServiceSchedule__c = serviceSchedules[0].Id,
                SignUpDate__c = System.today(),
                Status__c = 'Waitlisted'
            ),
            new ServiceParticipant__c(
                Name = 'Test Participant 3',
                Contact__c = contactRecord.Id,
                ProgramEngagement__c = engagement.Id,
                Service__c = service.Id,
                ServiceSchedule__c = serviceSchedules[0].Id,
                SignUpDate__c = System.today()
            )
        };

        insert serviceParticipants;
    }

    private static void requery() {
        contactRecord = [SELECT Id FROM Contact LIMIT 1];

        service = [SELECT Id FROM Service__c LIMIT 1];

        serviceSchedules = [SELECT Id, ParticipantsEnrolled__c FROM ServiceSchedule__c];

        engagement = [SELECT Id FROM ProgramEngagement__c LIMIT 1];

        serviceParticipants = [SELECT Id FROM ServiceParticipant__c];
    }
}
