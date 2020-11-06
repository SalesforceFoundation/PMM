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
        Account newAccount = new Account();
        newAccount.Name = 'Test Account';
        insert newAccount;

        Contact newContact = new Contact();
        newContact.LastName = 'Test Contact';
        newContact.AccountId = newAccount.Id;
        insert newContact;

        List<ServiceSession__c> serviceSessions = new List<ServiceSession__c>();
        ServiceSession__c serviceSession1 = new ServiceSession__c();
        serviceSession1.Name = 'Session 1';
        serviceSession1.Status__c = 'Pending';
        serviceSession1.PrimaryServiceProvider__c = newContact.Id;
        serviceSession1.SessionStart__c = System.Today().addDays(-2);
        serviceSessions.add(serviceSession1);

        ServiceSession__c serviceSession2 = new ServiceSession__c();
        serviceSession2.Name = 'Session 2';
        serviceSession2.Status__c = 'Pending';
        serviceSession2.PrimaryServiceProvider__c = newContact.Id;
        serviceSession2.SessionStart__c = System.Today();
        serviceSessions.add(serviceSession2);

        ServiceSession__c serviceSession3 = new ServiceSession__c();
        serviceSession3.Name = 'Session 3';
        serviceSession3.Status__c = 'Pending';
        serviceSession3.PrimaryServiceProvider__c = newContact.Id;
        serviceSession3.SessionStart__c = System.Today().addDays(-7);
        serviceSessions.add(serviceSession3);

        insert serviceSessions;
    }

    @IsTest
    private static void testGetServiceSessionsForThisWeek() {
        final String dateRange = 'THIS_WEEK';

        List<ServiceSession__c> expectedSessions = [
            SELECT Id, Name, PrimaryServiceProvider__c, Status__c, SessionStart__c
            FROM ServiceSession__c
            WHERE SessionStart__c = THIS_WEEK
            ORDER BY SessionStart__c
        ];

        Test.startTest();
        ServiceSessionSelector sessionSelector = new ServiceSessionSelector();
        List<ServiceSession__c> actualSessions = sessionSelector.getServiceSessionsByStartDate(
            dateRange
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
        final String dateRange = 'LAST_WEEK';

        List<ServiceSession__c> expectedSessions = [
            SELECT Id, Name, PrimaryServiceProvider__c, Status__c, SessionStart__c
            FROM ServiceSession__c
            WHERE SessionStart__c = LAST_WEEK
            ORDER BY SessionStart__c
        ];

        Test.startTest();
        ServiceSessionSelector sessionSelector = new ServiceSessionSelector();
        List<ServiceSession__c> actualSessions = sessionSelector.getServiceSessionsByStartDate(
            dateRange
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
        final String dateRange = 'LAST_WEEK';

        List<ServiceSession__c> expectedSessions = [
            SELECT Id, Name, PrimaryServiceProvider__c, Status__c, SessionStart__c
            FROM ServiceSession__c
            WHERE SessionStart__c = LAST_WEEK
            ORDER BY SessionStart__c
        ];

        Test.startTest();
        System.runAs(TestUtil.getTestUser()) {
            ServiceSessionSelector sessionSelector = new ServiceSessionSelector();
            List<ServiceSession__c> actualSessions = sessionSelector.getServiceSessionsByStartDate(
                dateRange
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
