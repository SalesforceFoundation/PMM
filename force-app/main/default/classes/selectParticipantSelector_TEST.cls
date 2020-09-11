@IsTest
public with sharing class selectParticipantSelector_TEST {
    @IsTest
    private static void testGetProgramEngagements() {
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
        SelectParticipantSelector selector = new SelectParticipantSelector();
        List<ProgramEngagement__c> actual = selector.getProgramEngagements(service1.Id);
        Test.stopTest();
        System.assert(!actual.isEmpty());
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
    private static void testGetProgramEngagementsNoAccess() {
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
            SelectParticipantSelector selector = new SelectParticipantSelector();
            List<ProgramEngagement__c> actual = selector.getProgramEngagements(
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
    private static void testGetProgramCohorts() {
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
        SelectParticipantSelector selector = new SelectParticipantSelector();
        List<ProgramCohort__c> actual = selector.getProgramCohorts(service1.Id);
        Test.stopTest();
        System.assert(!actual.isEmpty());
        System.assertEquals(
            expected.size(),
            actual.size(),
            'Expected that both the actual and expected list size are the same'
        );

        System.assertEquals(
            expected[0].Id,
            actual[0].Id,
            'Expected that both the actual and expected list return the same program cohort id'
        );
    }

    @IsTest
    private static void testgetProgramCohortsNoAccess() {
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
            SelectParticipantSelector selector = new SelectParticipantSelector();
            List<ProgramCohort__c> actual = selector.getProgramCohorts(service1.Id);
            System.assertEquals(
                new List<ProgramCohort__c>(),
                actual,
                'Expected the actual is an empty list of program cohorts since the user does not have access to the object'
            );
        }

        Test.stopTest();
    }
}
