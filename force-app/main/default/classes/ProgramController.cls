public with sharing class ProgramController {
    @TestVisible
    private static ProgramService service = new ProgramService();

    @AuraEnabled(cacheable=true)
    public static List<ProgramCohort__c> getCohortsForProgram(Id programId) {
        try {
            return service.getCohortsForProgram(programId);
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }
}
