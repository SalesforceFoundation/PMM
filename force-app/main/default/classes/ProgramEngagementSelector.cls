/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ProgramEngagementSelector {
    private QueryBuilder queryBuilder = new QueryBuilder();

    public List<ProgramEngagement__c> getProgramEngagementsByContactId(Id contactId) {
        if (
            !(Schema.SObjectType.ProgramEngagement__c.isAccessible() &&
            PermissionValidator.getInstance()
                .hasFieldReadAccess(ProgramEngagement__c.Contact__c.getDescribe()) &&
            PermissionValidator.getInstance()
                .hasFieldReadAccess(ProgramEngagement__c.Program__c.getDescribe()))
        ) {
            return new List<ProgramEngagement__c>();
        }

        List<ProgramEngagement__c> queriedEngagements = [
            SELECT Id, Name, Program__c, Program__r.Name, Stage__c
            FROM ProgramEngagement__c
            WHERE Contact__c = :contactId
        ];
        queriedEngagements.sort();
        return Security.stripInaccessible(AccessType.READABLE, queriedEngagements)
            .getRecords();
    }

    public ProgramEngagement__c getProgramEngagementById(Id peId) {
        if (
            !(Schema.SObjectType.ProgramEngagement__c.isAccessible() &&
            PermissionValidator.getInstance()
                .hasFieldReadAccess(ProgramEngagement__c.Contact__c.getDescribe()) &&
            PermissionValidator.getInstance()
                .hasFieldReadAccess(ProgramEngagement__c.Program__c.getDescribe()))
        ) {
            return null;
        }

        List<ProgramEngagement__c> queriedEngagements = [
            SELECT
                Id,
                Name,
                Program__c,
                Program__r.Name,
                ProgramCohort__c,
                Stage__c,
                Contact__c,
                Contact__r.Name,
                Contact__r.Email
            FROM ProgramEngagement__c
            WHERE Id = :peId
        ];
        List<ProgramEngagement__c> securityResult = Security.stripInaccessible(
                AccessType.READABLE,
                queriedEngagements
            )
            .getRecords();
        return securityResult.isEmpty() ? null : securityResult[0];
    }

    // Using strip inaccessible and performing access checks for
    // all fields involved in the query. Id, Name must be true if object
    // access is true.
    /* sfca-disable-stack ApexFlsViolationRule */
    public Program__c getProgramByServiceId(Id serviceId) {
        if (
            !(PermissionValidator.getInstance()
                .hasObjectAccess(
                    Program__c.SObjectType,
                    PermissionValidator.CRUDAccessType.READABLE
                ) &&
            PermissionValidator.getInstance()
                .hasObjectAccess(
                    Service__c.SObjectType,
                    PermissionValidator.CRUDAccessType.READABLE
                ) &&
            PermissionValidator.getInstance()
                .hasFieldReadAccess(Service__c.Program__c.getDescribe()))
        ) {
            return null;
        }

        List<Program__c> programs = Security.stripInaccessible(
                AccessType.READABLE,
                [
                    SELECT Id, Name
                    FROM Program__c
                    WHERE Id IN (SELECT Program__c FROM Service__c WHERE Id = :serviceId)
                ]
            )
            .getRecords();

        return programs.isEmpty() ? null : programs[0];
    }

    // Using strip inaccessible on returned records and doing field access
    // checks on the fields used to filter the query
    /* sfca-disable-stack ApexFlsViolationRule */
    public List<ProgramEngagement__c> getProgramEngagementsByProgramId(
        Id programId,
        Set<String> fields,
        Set<String> stages,
        String searchText,
        Id cohortId
    ) {
        final Integer LIMIT_TO = 1000;

        if (
            !(Schema.SObjectType.ProgramEngagement__c.isAccessible() &&
            PermissionValidator.getInstance()
                .hasFieldReadAccess(ProgramEngagement__c.Program__c.getDescribe()) &&
            PermissionValidator.getInstance()
                .hasFieldReadAccess(ProgramEngagement__c.Stage__c.getDescribe()))
        ) {
            return new List<ProgramEngagement__c>();
        }

        String programEngagementName = Schema.SObjectType.ProgramEngagement__c.getName();
        List<ProgramEngagement__c> programEngagements;
        Set<Id> targetIds;

        queryBuilder
            .reset()
            .withSObjectType(ProgramEngagement__c.getSObjectType())
            .withSelectFields(new List<String>(fields))
            .addCondition(
                String.valueOf(ProgramEngagement__c.Program__c) + ' = :programId'
            )
            .addCondition(String.valueOf(ProgramEngagement__c.Stage__c) + ' IN :stages')
            .withLimit(LIMIT_TO);
        if (cohortId != null) {
            queryBuilder.addCondition(
                String.valueOf(ProgramEngagement__c.ProgramCohort__c) + ' = :cohortId'
            );
        }
        if (!String.isBlank(searchText)) {
            targetIds = getEngagementIdsBySearchTerm(
                searchText,
                fields,
                programId,
                stages,
                cohortId
            );
            queryBuilder.addCondition(
                String.valueOf(ProgramEngagement__c.Id) + ' IN :targetIds'
            );
        }

        programEngagements = Database.query(queryBuilder.buildSoqlQuery());

        return Security.stripInaccessible(AccessType.READABLE, programEngagements)
            .getRecords();
    }

    private Set<Id> getEngagementIdsBySearchTerm(
        String searchText,
        Set<String> fields,
        Id programId,
        Set<String> stages,
        Id cohortId
    ) {
        final Integer SEARCH_LIMIT = 1000;
        searchText = String.escapeSingleQuotes(searchText);

        String peSearchString = 'FIND :searchText IN ALL FIELDS RETURNING {0}({1} {2} LIMIT :SEARCH_LIMIT)';
        String whereClause =
            ' WHERE ' +
            String.valueOf(ProgramEngagement__c.Program__c) +
            ' = :programId' +
            ' AND ' +
            String.valueOf(ProgramEngagement__c.Stage__c) +
            ' IN :stages ';
        if (cohortId != null) {
            whereClause +=
                ' AND ' +
                String.valueOf(ProgramEngagement__c.ProgramCohort__c) +
                ' =: cohortId ';
        }

        String queryString = String.format(
            peSearchString,
            new List<String>{
                Schema.SObjectType.ProgramEngagement__c.getName(),
                String.join(new List<String>(fields), ', '),
                whereClause
            }
        );

        List<List<SObject>> engagementResult = Search.query(queryString);
        List<List<SObject>> contactResult = [
            FIND :searchText
            IN ALL FIELDS
            RETURNING Contact(FirstName, LastName, Email LIMIT :SEARCH_LIMIT)
        ];

        return getEngagementIdsFromSOSLResult(
            programId,
            engagementResult[0],
            contactResult[0]
        );
    }

    private Set<Id> getEngagementIdsFromSOSLResult(
        Id programId,
        List<ProgramEngagement__c> engagements,
        List<Contact> contacts
    ) {
        Set<Id> resultIds = new Set<Id>();
        resultIds.addAll((new Map<Id, SObject>(engagements)).keySet());

        Set<Id> contactIds = (new Map<Id, SObject>(contacts)).keySet();

        for (ProgramEngagement__c engagement : [
            SELECT Id
            FROM ProgramEngagement__c
            WHERE Contact__c IN :contactIds AND Program__c = :programId
        ]) {
            resultIds.add(engagement.Id);
        }

        return resultIds;
    }
}
