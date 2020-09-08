public with sharing class SelectParticipantSelector {
    public List<ProgramEngagement__c> getProgramEngagements(Id serviceId) {
        if (!Schema.SObjectType.ProgramEngagement__c.isAccessible()) {
            return new List<ProgramEngagement__c>();
        }

        List<ProgramEngagement__c> programEngagements = [
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
                    WHERE Id = :serviceId
                )
            ORDER BY Contact__r.Name ASC
        ];

        return Security.stripInaccessible(AccessType.READABLE, programEngagements)
            .getRecords();
    }

    public List<ProgramCohort__c> getProgramCohorts(Id serviceId) {
        if (!Schema.SObjectType.ProgramCohort__c.isAccessible()) {
            return new List<ProgramCohort__c>();
        }

        List<ProgramCohort__c> programCohorts = [
            SELECT Id, Name
            FROM ProgramCohort__c
            WHERE Program__c IN (SELECT Program__c FROM Service__c WHERE Id = :serviceId)
        ];

        return Security.stripInaccessible(AccessType.READABLE, programCohorts)
            .getRecords();
    }

    public List<ProgramEngagement__c> getFilteredProgramEnagagement(String searchValue) {
        /*  if (!Schema.SObjectType.ProgramEngagement__c.isAccessible()) {
            return new List<ProgramEngagement__c>();
        }

        QueryBuilder queryBuilder = new QueryBuilder()
        .withSObjectType(ProgramEngagement__c.SObjectType);

        String contactRelationship =
            ProgramEngagement__c.Contact__c.getDescribe().getRelationshipName() + '.';

        List<String> fields = new List<String>{
            String.valueOf(ProgramEngagement__c.Id),
            String.valueOf(ProgramEngagement__c.ProgramCohort__c),
            String.valueOf(ProgramEngagement__c.Stage__c),
            contactRelationship + String.valueOf(Contact.Name),
            contactRelationship + String.valueOf(Contact.Email),
            '(SELECT Program__c FROM Service__c)'
        };

        queryBuilder
            .withSelectFields(fields)
            .addCondition(String.valueOf(Stage__c) + '=' + 'ENROLLED');

        if (!String.isBlank(searchValue)) {
            queryBuilder.addCondition(
                '(' +
                clientRelationship +
                String.valueOf(Contact.Name) +
                ' LIKE \'%' +
                searchValue +
                '%\' OR ' +
                clientRelationship +
                String.valueOf(Contact.LegalName__c) +
                ' LIKE \'%' +
                searchValue +
                '%\')'
            );
        }

        List<ProgramEngagement__c> programEngagements = [
            SELECT
                Id,
                Contact__r.Name,
                Contact__r.Email,
                Stage__c,
                ProgramCohort__c
            FROM ProgramEngagement__c
            WHERE
                (Stage__c = 'ENROLLED'
                OR Stage__c = 'ACTIVE')
                AND Contact__r.Name LIKE '%' + searchValue + '%'
                AND Program__c IN (
                    SELECT Program__c
                    FROM Service__c
                    WHERE Id = :serviceId
                )
            ORDER BY Contact__r.Name ASC
        ];

        return Security.stripInaccessible(AccessType.READABLE, programEngagements)
            .getRecords(); */
        return null;
    }
}
