public with sharing class ProgramSelector {
    private QueryBuilder queryBuilder = new QueryBuilder();

    public List<ProgramCohort__c> getProgramCohortsByProgramId(Id programId) {
        Set<String> fields = new Set<String>{
            String.valueOf(ProgramCohort__c.Id),
            String.valueOf(ProgramCohort__c.Name)
        };
        return this.getProgramCohortsByProgramId(programId, fields);
    }

    public List<ProgramCohort__c> getProgramCohortsByProgramId(
        Id programId,
        Set<String> fields
    ) {
        if (!Schema.SObjectType.ProgramCohort__c.isAccessible()) {
            return new List<ProgramCohort__c>();
        }

        queryBuilder
            .reset()
            .withSObjectType(ProgramCohort__c.getSObjectType())
            .withSelectFields(new List<String>(fields))
            .addCondition(String.valueOf(ProgramCohort__c.Program__c) + ' = :programId');

        List<ProgramCohort__c> programCohorts = Database.query(
            queryBuilder.buildSoqlQuery()
        );

        return Security.stripInaccessible(AccessType.READABLE, programCohorts)
            .getRecords();
    }
}
