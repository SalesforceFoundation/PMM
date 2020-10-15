/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ProgramEngagementSelector {
    public ProgramEngagementSelector() {
    }

    public List<ProgramEngagement__c> getProgramEngagementsByContactId(Id contactId) {
        if (!Schema.SObjectType.ProgramEngagement__c.isAccessible()) {
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

    public Program__c getProgramByServiceId(Id serviceId) {
        if (
            !PermissionValidator.getInstance()
                .hasObjectAccess(
                    Program__c.SObjectType,
                    PermissionValidator.CRUDAccessType.READABLE
                )
        ) {
            return null;
        }

        List<Program__c> programs = [
            SELECT Id, Name
            FROM Program__c
            WHERE Id IN (SELECT Program__c FROM Service__c WHERE Id = :serviceId)
        ];

        return programs.isEmpty() ? null : programs[0];
    }

    public List<ProgramEngagement__c> getProgramEngagementsByProgramId(Id programId) {
        Set<String> engagementStage = new Set<String>{ 'Active', 'Enrolled' };

        if (!Schema.SObjectType.ProgramEngagement__c.isAccessible()) {
            return new List<ProgramEngagement__c>();
        }

        List<ProgramEngagement__c> programEngagements = [
            SELECT
                Id,
                Contact__c,
                Contact__r.Name,
                Contact__r.Email,
                toLabel(Stage__c),
                Program__r.Name,
                ProgramCohort__c
            FROM ProgramEngagement__c
            WHERE Stage__c IN :engagementStage AND Program__c = :programId
            ORDER BY Contact__r.Name ASC
        ];

        return Security.stripInaccessible(AccessType.READABLE, programEngagements)
            .getRecords();
    }

    public List<ProgramCohort__c> getProgramCohortsByProgramId(Id programId) {
        if (!Schema.SObjectType.ProgramCohort__c.isAccessible()) {
            return new List<ProgramCohort__c>();
        }

        List<ProgramCohort__c> programCohorts = [
            SELECT Id, Name
            FROM ProgramCohort__c
            WHERE Program__c = :programId
        ];

        return Security.stripInaccessible(AccessType.READABLE, programCohorts)
            .getRecords();
    }
}
