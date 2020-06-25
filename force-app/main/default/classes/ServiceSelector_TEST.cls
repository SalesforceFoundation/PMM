/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@isTest
public with sharing class ServiceSelector_TEST {
    @IsTest
    private static void testGetServicesByProgramIds() {
        ProgramTestDataFactory.insertTestData(true);

        Program__c program1 = [
            SELECT Id, Name
            FROM Program__c
            WHERE Name = 'Program 1'
            LIMIT 1
        ][0];

        Set<Id> expectedIds = (new Map<Id, Service__c>(
                [SELECT Id FROM Service__c WHERE Program__c = :program1.Id]
            ))
            .keySet();

        Test.startTest();
        ServiceSelector selector = new ServiceSelector();
        List<Service__c> actual = selector.getServicesByProgramIds(
            new Set<Id>{ program1.Id }
        );
        Test.stopTest();

        System.assert(!expectedIds.isEmpty());
        System.assert(!actual.isEmpty());
        for (Service__c service : actual) {
            System.assert(expectedIds.contains(service.Id));
        }
    }

    @IsTest
    private static void testGetServicesByProgramIdsNoAccess() {
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

        Program__c program1 = [
            SELECT Id, Name
            FROM Program__c
            WHERE Name = 'Program 1'
            LIMIT 1
        ][0];

        Test.startTest();
        System.runAs(u) {
            ServiceSelector selector = new ServiceSelector();
            List<Service__c> actual = selector.getServicesByProgramIds(
                new Set<Id>{ program1.Id }
            );
            System.assertEquals(new List<Service__c>(), actual);
        }
        Test.stopTest();
    }

    @IsTest
    private static void testGetServicesByProgramEngagementId() {
        ProgramTestDataFactory.insertTestData(true);
        Program__c program1 = [
            SELECT Id, Name
            FROM Program__c
            WHERE Name = 'Program 1'
            LIMIT 1
        ][0];

        ProgramEngagement__c engagement1 = [
            SELECT Id, Name
            FROM ProgramEngagement__c
            WHERE Program__c = :program1.Id
            LIMIT 1
        ];

        Set<Id> expectedIds = (new Map<Id, Service__c>(
                [
                    SELECT Id, Name, Program__c
                    FROM Service__c
                    WHERE
                        Program__c IN (
                            SELECT Program__c
                            FROM ProgramEngagement__c
                            WHERE Id = :engagement1.Id
                        )
                ]
            ))
            .keySet();

        Test.startTest();
        ServiceSelector selector = new ServiceSelector();
        List<Service__c> actual = selector.getServicesByProgramEngagementId(
            engagement1.Id
        );
        Test.stopTest();

        System.assert(
            !expectedIds.isEmpty(),
            'Expected the query returned a set of serviceIds'
        );
        System.assert(
            !actual.isEmpty(),
            'Expected the selector returned a set of serviceIds'
        );
        for (Service__c service : actual) {
            System.assert(expectedIds.contains(service.Id));
        }
    }

    @IsTest
    private static void testGetServicesByProgramEngagementIdNoAccess() {
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

        Program__c program1 = [
            SELECT Id, Name
            FROM Program__c
            WHERE Name = 'Program 1'
            LIMIT 1
        ][0];

        ProgramEngagement__c engagement1 = [
            SELECT Id, Name
            FROM ProgramEngagement__c
            WHERE Program__c = :program1.Id
            LIMIT 1
        ];

        Test.startTest();
        System.runAs(u) {
            ServiceSelector selector = new ServiceSelector();
            List<Service__c> actual = selector.getServicesByProgramEngagementId(
                engagement1.Id
            );
            System.assertEquals(new List<Service__c>(), actual);
        }
        Test.stopTest();
    }
}
