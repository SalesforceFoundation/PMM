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
    @IsTest
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

    @IsTest
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

    @IsTest
    private static void testGetProgramEngagementsByServiceId() {
        ProgramTestDataFactory.insertTestData(true);

        Service__c service1 = [
            SELECT Id, Name
            FROM Service__c
            WHERE Name = 'Service 1'
            LIMIT 1
        ][0];

        List<ProgramEngagement__c> expected = new List<ProgramEngagement__c>(
            [
                SELECT
                    Id,
                    Contact__r.Name,
                    Contact__r.Email,
                    Stage__c,
                    Program__r.Name,
                    ProgramCohort__c
                FROM ProgramEngagement__c
                WHERE
                    (Stage__c = 'ENROLLED'
                    OR Stage__c = 'ACTIVE')
                    AND Program__c IN (
                        SELECT Program__c
                        FROM Service__c
                        WHERE Id = :service1.Id
                    )
                ORDER BY Contact__r.Name ASC
            ]
        );

        Test.startTest();
        ProgramEngagementSelector selector = new ProgramEngagementSelector();
        List<ProgramEngagement__c> actual = selector.getProgramEngagementsByServiceId(
            service1.Id
        );
        Test.stopTest();
        System.assert(
            !actual.isEmpty(),
            'Expected at least one program engagement to be returned.'
        );
        System.assertEquals(
            expected.size(),
            actual.size(),
            'Expected that both the actual and expected list size are the same'
        );
        System.assertEquals(
            expected[0].ProgramCohort__c,
            actual[0].ProgramCohort__c,
            'Expected that both the actual and expected list are associated to the same program cohort'
        );
    }

    @IsTest
    private static void testGetProgramEngagementsByServiceIdNoAccess() {
        Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
        Integer random = Integer.valueOf(math.rint(math.random() * 1000000));
        User u = new User(
            Alias = 'stand',
            Email = 'standarduser1@' + random + '.example.com',
            EmailEncodingKey = 'UTF-8',
            LastName = 'StandardUser',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            ProfileId = p.Id,
            TimeZoneSidKey = 'America/Los_Angeles',
            UserName = 'standarduser1@' + random + '.example.com'
        );

        ProgramTestDataFactory.insertTestData(true);

        Service__c service1 = [
            SELECT Id, Name
            FROM Service__c
            WHERE Name = 'Service 1'
            LIMIT 1
        ][0];

        List<ProgramEngagement__c> expected = new List<ProgramEngagement__c>(
            [
                SELECT
                    Id,
                    Contact__r.Name,
                    Contact__r.Email,
                    Stage__c,
                    Program__r.Name,
                    ProgramCohort__c
                FROM ProgramEngagement__c
                WHERE
                    (Stage__c = 'ENROLLED'
                    OR Stage__c = 'ACTIVE')
                    AND Program__c IN (
                        SELECT Program__c
                        FROM Service__c
                        WHERE Id = :service1.Id
                    )
                ORDER BY Contact__r.Name ASC
            ]
        );

        Test.startTest();
        System.runAs(u) {
            ProgramEngagementSelector selector = new ProgramEngagementSelector();
            List<ProgramEngagement__c> actual = selector.getProgramEngagementsByServiceId(
                service1.Id
            );
            System.assertEquals(
                new List<ProgramEngagement__c>(),
                actual,
                'Expected the actual is an empty list of program engagements since the user does not have access to the object'
            );
        }

        Test.stopTest();
    }

    @IsTest
    private static void testGetProgramCohortsByServiceId() {
        ProgramTestDataFactory.insertTestData(true);

        Service__c service1 = [
            SELECT Id, Name
            FROM Service__c
            WHERE Name = 'Service 1'
            LIMIT 1
        ][0];

        List<ProgramCohort__c> expected = new List<ProgramCohort__c>(
            [
                SELECT Id, Name
                FROM ProgramCohort__c
                WHERE
                    Program__c IN (
                        SELECT Program__c
                        FROM Service__c
                        WHERE Id = :service1.Id
                    )
            ]
        );

        Test.startTest();
        ProgramEngagementSelector selector = new ProgramEngagementSelector();
        List<ProgramCohort__c> actual = selector.getProgramCohortsByServiceId(
            service1.Id
        );
        Test.stopTest();
        System.assert(!actual.isEmpty());
        System.assertEquals(
            expected.size(),
            actual.size(),
            'Expected that both the actual and expected list size are the same'
        );
    }

    @IsTest
    private static void testGetProgramCohortsByServiceIdNoAccess() {
        Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
        Integer random = Integer.valueOf(math.rint(math.random() * 1000000));
        User u = new User(
            Alias = 'stand',
            Email = 'standarduser1@' + random + '.example.com',
            EmailEncodingKey = 'UTF-8',
            LastName = 'StandardUser',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            ProfileId = p.Id,
            TimeZoneSidKey = 'America/Los_Angeles',
            UserName = 'standarduser1@' + random + '.example.com'
        );

        ProgramTestDataFactory.insertTestData(true);

        Service__c service1 = [
            SELECT Id, Name
            FROM Service__c
            WHERE Name = 'Service 1'
            LIMIT 1
        ][0];

        List<ProgramCohort__c> expected = new List<ProgramCohort__c>(
            [
                SELECT Id, Name
                FROM ProgramCohort__c
                WHERE
                    Program__c IN (
                        SELECT Program__c
                        FROM Service__c
                        WHERE Id = :service1.Id
                    )
            ]
        );

        Test.startTest();
        System.runAs(u) {
            ProgramEngagementSelector selector = new ProgramEngagementSelector();
            List<ProgramCohort__c> actual = selector.getProgramCohortsByServiceId(
                service1.Id
            );
            System.assertEquals(
                new List<ProgramCohort__c>(),
                actual,
                'Expected the actual is an empty list of program cohorts since the user does not have access to the object'
            );
        }

        Test.stopTest();
    }
}
