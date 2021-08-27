public with sharing class ProgramController {
    @TestVisible
    private static ProgramService service = new ProgramService();

    @AuraEnabled(cacheable=true)
    public static List<ProgramCohort__c> getProgramCohortsFromProgramId(Id programId) {
        try {
            return service.getProgramCohortsFromProgramId(programId);
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }
}
