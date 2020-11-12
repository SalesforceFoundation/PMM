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
    private static set<String> STATUS = new Set<String>{ 'Pending', 'Complete' };

    @IsTest
    private static void testGetServiceSessionsForThisWeek() {
        final String dateLiteral = 'THIS_WEEK';

        List<ServiceSession__c> expectedSessions = [
            SELECT Id, Name, PrimaryServiceProvider__c, Status__c, SessionStart__c
            FROM ServiceSession__c
            WHERE SessionStart__c = THIS_WEEK AND Status__c IN :STATUS
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
            WHERE SessionStart__c = LAST_WEEK AND Status__c IN :STATUS
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
            WHERE SessionStart__c = LAST_WEEK AND Status__c IN :STATUS
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
