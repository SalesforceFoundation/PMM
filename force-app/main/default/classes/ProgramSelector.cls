public with sharing class ProgramSelector {
    private static final String ACTIVE_BUCKET = 'ProgramCohortStatusActive';

    @TestVisible
    private FieldBucketSelector bucketSelector = new FieldBucketSelector();

    public List<ProgramCohort__c> getProgramCohortsFromProgramId(Id programId) {
        Set<String> allowedProgramCohortStatuses = getAllowedProgramCohortStatusValues();
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

        List<ProgramCohort__c> programCohorts = [
            SELECT Id, Name
            FROM ProgramCohort__c
            WHERE Program__c = :programId AND Status__c IN :allowedProgramCohortStatuses
            ORDER BY Name ASC
        ];

        return Security.stripInaccessible(AccessType.READABLE, programCohorts)
            .getRecords();
    }

    public Set<String> getAllowedProgramCohortStatusValues() {
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
