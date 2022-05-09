/*
 *
 *  * Copyright (c) 2022, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class ServiceScheduleSelector_TEST {
    @TestSetup
    private static void createScheduleData() {
        TestDataFactory.generateServiceData();
        TestDataFactory.generateServiceScheduleData('Daily', System.today());
    }

    @IsTest
    private static void testGetServiceScheduleById() {
        ServiceSchedule__c expectedSchedule = [
            SELECT
                Id,
                Name,
                AllDay__c,
                CreateServiceSessionRecords__c,
                DaysOfWeek__c,
                DefaultServiceQuantity__c,
                FirstSessionEnd__c,
                FirstSessionStart__c,
                Frequency__c,
                Interval__c,
                MonthlyRecurrenceOption__c,
                NumberOfServiceSessions__c,
                OtherServiceProvider__c,
                ParticipantCapacity__c,
                PrimaryServiceProvider__c,
                ServiceScheduleEndDate__c,
                ServiceScheduleEnds__c,
                Service__c
            FROM ServiceSchedule__c
            LIMIT 1
        ];

        Test.startTest();
        ServiceScheduleSelector scheduleSelector = new ServiceScheduleSelector();
        ServiceSchedule__c actualSchedule = scheduleSelector.getServiceScheduleById(
            expectedSchedule.Id
        );
        Test.stopTest();

        System.assertEquals(
            expectedSchedule.Id,
            actualSchedule.Id,
            'The Id of the returned record should match the record we requested'
        );

        System.assertEquals(
            expectedSchedule.Name,
            actualSchedule.Name,
            'The Name of the returned record should match the record we requested'
        );
    }

    @IsTest
    private static void testGetServiceScheduleNoAccess() {
        ServiceSchedule__c expectedSchedule = [SELECT Id FROM ServiceSchedule__c LIMIT 1];

        Test.startTest();
        System.runAs(TestUtil.getTestUser()) {
            ServiceScheduleSelector scheduleSelector = new ServiceScheduleSelector();
            ServiceSchedule__c actualSchedule = scheduleSelector.getServiceScheduleById(
                expectedSchedule.Id
            );
            Test.stopTest();

            System.assertEquals(
                null,
                actualSchedule,
                'Expected null ServiceSchedule__c since the user does not have access to the object'
            );
        }
    }
}