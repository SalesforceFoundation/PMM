public with sharing class ProgramController {
    @TestVisible
    private static ProgramService service = new ProgramService();

    @AuraEnabled(cacheable=true)
    public static List<ProgramCohort__c> getCohortsForProgram(Id programId) {
        try {
            return [SELECT Id, Name FROM ProgramCohort__c WHERE Program__c = :programId];
            //return service.generateRoster(sessionId);
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }
}
