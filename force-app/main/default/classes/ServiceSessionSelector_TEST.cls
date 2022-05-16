/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class ServiceSessionSelector_TEST {
    @TestSetup
    private static void createSessionData() {
        TestDataFactory.generateAttendanceData('Daily');
    }
    private static set<String> allowedSessionStatuses = new Set<String>{
        'Pending',
        'Complete'
    };

    @IsTest
    private static void testGetFutureSessionsForScheduleNoAccess() {
        Id serviceScheduleId = [SELECT Id FROM ServiceSchedule__c LIMIT 1].Id;

        List<ServiceSession__c> expectedSessions = [
            SELECT Id, Name, PrimaryServiceProvider__c, Status__c, SessionStart__c
            FROM ServiceSession__c
            WHERE ServiceSchedule__c = :serviceScheduleId AND SessionStart__c > TODAY
            ORDER BY SessionStart__c
        ];

        System.assert(
            expectedSessions.size() > 0,
            'There must be service session records for a valid test'
        );

        Test.startTest();
        System.runAs(TestUtil.getTestUser()) {
            ServiceSessionSelector sessionSelector = new ServiceSessionSelector();
            List<ServiceSession__c> actualSessions = sessionSelector.getFutureServiceSessionsForServiceSchedule(
                serviceScheduleId
            );
            System.assertEquals(
                new List<ServiceSession__c>(),
                actualSessions,
                'Expected the actual is an empty list of service sessions since the user does not have access to the object'
            );
        }

        Test.stopTest();
    }

    @IsTest
    private static void testGetFutureServiceSessionsForServiceSchedule() {
        Id serviceScheduleId = [SELECT Id FROM ServiceSchedule__c LIMIT 1].Id;

        List<ServiceSession__c> expectedSessions = [
            SELECT Id, Name, PrimaryServiceProvider__c, Status__c, SessionStart__c
            FROM ServiceSession__c
            WHERE ServiceSchedule__c = :serviceScheduleId AND SessionStart__c > TODAY
            ORDER BY SessionStart__c
        ];
        Test.startTest();
        ServiceSessionSelector sessionSelector = new ServiceSessionSelector();
        List<ServiceSession__c> actualSessions = sessionSelector.getFutureServiceSessionsForServiceSchedule(
            serviceScheduleId
        );
        Test.stopTest();

        System.assertNotEquals(
            null,
            serviceScheduleId,
            'There must be a valid service schedule for the test to be valid'
        );
        System.assert(
            actualSessions.size() > 0,
            'There must be a valid service schedule for the test to be valid'
        );
        System.assertEquals(
            expectedSessions.size(),
            actualSessions.size(),
            'The expected number of session should have been returned'
        );

        Map<Id, ServiceSession__c> expectedSessionsById = new Map<Id, ServiceSession__c>(
            expectedSessions
        );
        for (ServiceSession__c actualSession : actualSessions) {
            System.assert(
                expectedSessionsById.containsKey(actualSession.Id),
                'Every returned service session should be found in the expected list'
            );
        }
    }

    @IsTest
    private static void testGetServiceSessionsForThisWeek() {
        final String dateLiteral = 'THIS_WEEK';

        List<ServiceSession__c> expectedSessions = [
            SELECT Id, Name, PrimaryServiceProvider__c, Status__c, SessionStart__c
            FROM ServiceSession__c
            WHERE SessionStart__c = THIS_WEEK AND Status__c IN :allowedSessionStatuses
            ORDER BY SessionStart__c
        ];

        Test.startTest();
        ServiceSessionSelector sessionSelector = new ServiceSessionSelector();
        List<ServiceSession__c> actualSessions = sessionSelector.getServiceSessionsByStartDate(
            dateLiteral
        );
        Test.stopTest();

        System.assertEquals(
            expectedSessions.size(),
            actualSessions.size(),
            'The list size of actual Sessions is not the same as the list size of expected Sessions'
        );

        System.assertEquals(
            2,
            expectedSessions.size(),
            'Test data should include two service sessions for this week'
        );

        System.assertEquals(
            expectedSessions[0].Id,
            actualSessions[0].Id,
            'Actual Id returned is not the same as expected Id'
        );
        System.assertEquals(
            expectedSessions[1].Name,
            actualSessions[1].Name,
            'Actual Name returned is not the same as expected Name'
        );
    }

    @IsTest
    private static void testGetServiceSessionsForLastWeek() {
        final String dateLiteral = 'LAST_WEEK';

        List<ServiceSession__c> expectedSessions = [
            SELECT Id, Name, PrimaryServiceProvider__c, Status__c, SessionStart__c
            FROM ServiceSession__c
            WHERE SessionStart__c = LAST_WEEK AND Status__c IN :allowedSessionStatuses
            ORDER BY SessionStart__c
        ];

        Test.startTest();
        ServiceSessionSelector sessionSelector = new ServiceSessionSelector();
        List<ServiceSession__c> actualSessions = sessionSelector.getServiceSessionsByStartDate(
            dateLiteral
        );
        Test.stopTest();

        System.assertEquals(
            expectedSessions.size(),
            actualSessions.size(),
            'The list size of actual Sessions is not the same as the list size of expected Sessions'
        );
    }

    @IsTest
    private static void testGetServiceSessionsNoAccess() {
        final String dateLiteral = 'LAST_WEEK';

        List<ServiceSession__c> expectedSessions = [
            SELECT Id, Name, PrimaryServiceProvider__c, Status__c, SessionStart__c
            FROM ServiceSession__c
            WHERE SessionStart__c = LAST_WEEK AND Status__c IN :allowedSessionStatuses
            ORDER BY SessionStart__c
        ];

        Test.startTest();
        System.runAs(TestUtil.getTestUser()) {
            ServiceSessionSelector sessionSelector = new ServiceSessionSelector();
            List<ServiceSession__c> actualSessions = sessionSelector.getServiceSessionsByStartDate(
                dateLiteral
            );
            System.assertEquals(
                new List<ServiceSession__c>(),
                actualSessions,
                'Expected the actual is an empty list of service sessions since the user does not have access to the object'
            );
        }

        Test.stopTest();
    }
}
