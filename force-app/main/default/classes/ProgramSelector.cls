public with sharing class ProgramSelector {
    public List<ProgramCohort__c> getProgramCohortsFromProgramId(Id programId) {
        Boolean canReadProgramCohort = PermissionValidator.getInstance()
            .hasObjectAccess(
                ProgramCohort__c.SObjectType,
                PermissionValidator.CRUDAccessType.READABLE
            );

        if (!canReadProgramCohort) {
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
