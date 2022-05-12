public with sharing class ProgramSelector {
    private static final String ACTIVE_BUCKET = 'ProgramCohortStatusActive';

    @TestVisible
    private FieldBucketSelector bucketSelector = new FieldBucketSelector();

    public List<ProgramCohort__c> getProgramCohortsFromProgramId(Id programId) {
        List<ProgramCohort__c> programCohorts = new List<ProgramCohort__c>();
        Set<String> allowedProgramCohortStatuses = getActiveProgramCohortStatus();
        Set<String> fields = new Set<String>();

        Boolean canReadProgramCohort =
            PermissionValidator.getInstance()
                .hasObjectAccess(
                    ProgramCohort__c.SObjectType,
                    PermissionValidator.CRUDAccessType.READABLE
                ) &&
            PermissionValidator.getInstance()
                .hasFieldReadAccess(ProgramCohort__c.Program__c.getDescribe());

        if (!canReadProgramCohort) {
            return new List<ProgramCohort__c>();
        }

        fields.add(String.valueOf(ProgramCohort__c.Id));
        fields.add(String.valueOf(ProgramCohort__c.Name));
        fields.add(String.valueOf(ProgramCohort__c.Program__c));
        fields.add(String.valueOf(ProgramCohort__c.Status__c));

        QueryBuilder queryBuilder = new QueryBuilder()
            .withSObjectType(ProgramCohort__c.SObjectType)
            .withSelectFields(new List<String>(fields));

        queryBuilder.addCondition(
            String.valueOf(ProgramCohort__c.Program__c) + ' = :programId'
        );

        if (!allowedProgramCohortStatuses.isEmpty()) {
            queryBuilder.addCondition(
                String.valueOf(ProgramCohort__c.Status__c) +
                ' IN :allowedProgramCohortStatuses'
            );
        }

        programCohorts = Database.query(queryBuilder.buildSoqlQuery());

        return Security.stripInaccessible(AccessType.READABLE, programCohorts)
            .getRecords();
    }

    private Set<String> getActiveProgramCohortStatus() {
        List<String> bucketNames = new List<String>{ ACTIVE_BUCKET };
        Set<String> statuses = new Set<String>();

        Schema.SObjectType programCohortSObjType = ProgramCohort__c.SObjectType;
        Schema.SObjectField programCohortStatusField = ProgramCohort__c.Status__c;

        for (
            Bucket__mdt bucket : bucketSelector.getBuckets(
                bucketNames,
                programCohortSObjType,
                programCohortStatusField
            )
        ) {
            for (BucketedValue__mdt value : bucket.BucketedValues__r) {
                statuses.add(value.Value__c);
            }
        }

        return statuses;
    }
}
