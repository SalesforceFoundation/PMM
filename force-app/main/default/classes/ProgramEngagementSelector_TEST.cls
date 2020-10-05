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
    @TestSetup
    private static void createProgramEngagementData() {
        ProgramTestDataFactory.insertTestData(true);
    }
    @IsTest
    private static void testGetProgramEngagementsByContactId() {
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
    private static void testGetProgramEngagementsByProgramId() {
        Program__c program = [SELECT Id, Name FROM Program__c LIMIT 1];

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
                    AND Program__c = :program.Id
                ORDER BY Contact__r.Name ASC
            ]
        );

        Test.startTest();
        ProgramEngagementSelector selector = new ProgramEngagementSelector();
        List<ProgramEngagement__c> actual = selector.getProgramEngagementsByProgramId(
            program.Id
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
    private static void testGetProgramEngagementsByProgramIdNoAccess() {
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

        Program__c program = [SELECT Id, Name FROM Program__c LIMIT 1];

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
                    AND Program__c = :program.Id
                ORDER BY Contact__r.Name ASC
            ]
        );

        Test.startTest();
        System.runAs(u) {
            ProgramEngagementSelector selector = new ProgramEngagementSelector();
            List<ProgramEngagement__c> actual = selector.getProgramEngagementsByProgramId(
                program.Id
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
    private static void testGetProgramCohortsByProgramId() {
        Program__c program = [SELECT Id, Name FROM Program__c LIMIT 1];

        List<ProgramCohort__c> expected = new List<ProgramCohort__c>(
            [SELECT Id, Name FROM ProgramCohort__c WHERE Program__c = :program.Id]
        );

        Test.startTest();
        ProgramEngagementSelector selector = new ProgramEngagementSelector();
        List<ProgramCohort__c> actual = selector.getProgramCohortsByProgramId(program.Id);
        Test.stopTest();
        System.assert(!actual.isEmpty());
        System.assertEquals(
            expected.size(),
            actual.size(),
            'Expected that both the actual and expected list size are the same'
        );
    }

    @IsTest
    private static void testGetProgramCohortsByProgramIdNoAccess() {
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

        Program__c program = [SELECT Id, Name FROM Program__c LIMIT 1];

        List<ProgramCohort__c> expected = new List<ProgramCohort__c>(
            [
                SELECT Id, Name
                FROM ProgramCohort__c
                WHERE
                    Program__c IN (
                        SELECT Program__c
                        FROM Service__c
                        WHERE Id = :program.Id
                    )
            ]
        );

        Test.startTest();
        System.runAs(u) {
            ProgramEngagementSelector selector = new ProgramEngagementSelector();
            List<ProgramCohort__c> actual = selector.getProgramCohortsByProgramId(
                program.Id
            );
            System.assertEquals(
                new List<ProgramCohort__c>(),
                actual,
                'Expected the actual is an empty list of program cohorts since the user does not have access to the object'
            );
        }

        Test.stopTest();
    }

    @IsTest
    private static void testGetProgramByServiceId() {
        Service__c service = [SELECT Id, Name FROM Service__c LIMIT 1];

        List<Program__c> expected = new List<Program__c>(
            [
                SELECT Id, Name
                FROM Program__c
                WHERE Id IN (SELECT Program__c FROM Service__c WHERE Id = :service.Id)
            ]
        );

        Test.startTest();
        ProgramEngagementSelector selector = new ProgramEngagementSelector();
        Program__c actual = selector.getProgramByServiceId(service.Id);
        Test.stopTest();

        System.assertEquals(
            expected[0].Id,
            actual.Id,
            'Expected the Program related to the Service to be returned.'
        );
    }

    @IsTest
    private static void testGetProgramByServiceIdNoAccess() {
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

        Service__c service = [SELECT Id, Name FROM Service__c LIMIT 1];

        Test.startTest();
        System.runAs(u) {
            ProgramEngagementSelector selector = new ProgramEngagementSelector();
            Program__c actual = selector.getProgramByServiceId(service.Id);
            System.assertEquals(
                null,
                actual,
                'Expected null to be returned since the user does not have access to the programs'
            );
        }

        Test.stopTest();
    }
}
