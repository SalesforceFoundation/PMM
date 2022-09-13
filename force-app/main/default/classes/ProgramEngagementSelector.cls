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
            SELECT Id, Name, Program__c, Program__r.Name
            FROM ProgramEngagement__c
            WHERE Contact__c = :contactId
        ];

        return Security.stripInaccessible(AccessType.READABLE, queriedEngagements)
            .getRecords();
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
        Set<String> stages
    ) {
        if (
            !(Schema.SObjectType.ProgramEngagement__c.isAccessible() &&
            PermissionValidator.getInstance()
                .hasFieldReadAccess(ProgramEngagement__c.Program__c.getDescribe()) &&
            PermissionValidator.getInstance()
                .hasFieldReadAccess(ProgramEngagement__c.Stage__c.getDescribe()))
        ) {
            return new List<ProgramEngagement__c>();
        }

        Integer limitTo = 1000;
        String soslFindClause = 'test';
        String programEngagementName = Schema.SObjectType.ProgramEngagement__c.getName();
        //Convert to SOSL
        /*
        List<List<sObject>> searchList = [
            FIND :soslFindClause
            IN ALL FIELDS
            RETURNING ProgramEngagement__c(Name, Industry WHERE Industry = 'Apparel')
        ];
        */

        queryBuilder
            .reset()
            .withSObjectType(ProgramEngagement__c.getSObjectType())
            .withSelectFields(new List<String>(fields))
            .addCondition(
                String.valueOf(ProgramEngagement__c.Program__c) + ' = :programId'
            )
            .addCondition(String.valueOf(ProgramEngagement__c.Stage__c) + ' IN :stages')
            .withLimit(limitTo);

        List<ProgramEngagement__c> programEngagements = Database.query(
            queryBuilder.buildSoqlQuery()
        );

        //END Convert

        return Security.stripInaccessible(AccessType.READABLE, programEngagements)
            .getRecords();
    }

    private String buildProgramEngagementQuery(
        String searchText,
        List<String> fields,
        Id programId,
        Set<String> stages
    ) {
        return String.format(
            'FIND :searchText IN ALL FIELDS RETURNING {0}({1} {2} {3})',
            new List<String>{
                Schema.SObjectType.ProgramEngagement__c.getName(),
                String.join(fields, ', '),
                ' WHERE ' +
                String.valueOf(ProgramEngagement__c.Program__c) +
                ' = :programId' +
                ' AND ' +
                String.valueOf(ProgramEngagement__c.Stage__c) +
                ' IN :stages',
                ' LIMIT ' + 1000
            }
        );
    }
}
