/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@isTest
public with sharing class ProgramEngagementSelector_TEST {
    @isTest
    private static void testGetProgramEngagementsByContactId() {
        ProgramTestDataFactory.insertTestData(true);
        Contact con = [
            SELECT Id, Name
            FROM Contact
            WHERE LastName = 'Test Contact'
            LIMIT 1
        ][0];

        Set<Id> expectedIds = (new Map<Id, ProgramEngagement__c>(
                [
                    SELECT Id, Contact__c
                    FROM ProgramEngagement__c
                    WHERE Contact__c = :con.Id
                ]
            ))
            .keySet();

        Test.startTest();
        ProgramEngagementSelector selector = new ProgramEngagementSelector();
        List<ProgramEngagement__c> actual = selector.getProgramEngagementsByContactId(
            con.Id
        );
        Test.stopTest();

        System.assert(!actual.isEmpty());
        for (ProgramEngagement__c engagement : actual) {
            System.assert(expectedIds.contains(engagement.Id));
        }
    }

    @isTest
    private static void testGetProgramEngagementsByContactIdNoAccess() {
        Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
        Integer random = Integer.valueOf(math.rint(math.random() * 1000000));
        User u = new User(
            Alias = 'stand',
            Email = 'standarduser2@' + random + '.example.com',
            EmailEncodingKey = 'UTF-8',
            LastName = 'StandardUser',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            ProfileId = p.Id,
            TimeZoneSidKey = 'America/Los_Angeles',
            UserName = 'standarduser2@' + random + '.example.com'
        );

        ProgramTestDataFactory.insertTestData(true);
        Contact con = [
            SELECT Id, Name
            FROM Contact
            WHERE LastName = 'Test Contact'
            LIMIT 1
        ][0];

        Test.startTest();
        System.runAs(u) {
            ProgramEngagementSelector selector = new ProgramEngagementSelector();
            List<ProgramEngagement__c> actual = selector.getProgramEngagementsByContactId(
                con.Id
            );
            System.assertEquals(new List<ProgramEngagement__c>(), actual);
        }
        Test.stopTest();
    }
}
