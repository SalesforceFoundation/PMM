public with sharing class SelectParticipantController {
    @TestVisible
    private static SelectParticipantService selectParticipantService = new SelectParticipantService();

    @AuraEnabled
    public static List<ProgramEngagement__c> getProgramEngagementsByServiceId(
        Id serviceId
    ) {
        try {
            return selectParticipantService.getProgramEngagementsByServiceId(serviceId);
        } catch (Exception e) {
            throw Util.getAuraHandledException(e);
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<ProgramCohort__c> getProgramCohorts(Id serviceId) {
        try {
            return selectParticipantService.getProgramCohorts(serviceId);
        } catch (Exception e) {
            throw Util.getAuraHandledException(e);
        }
    }

    @AuraEnabled(cacheable=true)
    public static selectParticipantService.InitialDataAndSetup getData(Id serviceId) {
        try {
            return selectParticipantService.getInitialDataSetupInfo(serviceId);
        } catch (Exception e) {
            throw Util.getAuraHandledException(e);
        }
    }

    @AuraEnabled
    public static List<ProgramEngagement__c> getFilteredProgramEnagagement(
        String searchValue
    ) {
        try {
            return selectParticipantService.getFilteredProgramEnagagement(searchValue);
        } catch (Exception e) {
            throw Util.getAuraHandledException(e);
        }
    }
}
