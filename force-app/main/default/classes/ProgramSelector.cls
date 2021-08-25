public with sharing class ProgramSelector {
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
