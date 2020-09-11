public with sharing class SelectParticipantController {
    @TestVisible
    private static SelectParticipantService selectParticipantService = new SelectParticipantService();

    @AuraEnabled(cacheable=true)
    public static selectParticipantService.InitialDataAndSetup getInitialDataSetup(
        Id serviceId
    ) {
        try {
            return selectParticipantService.getInitialDataSetup(serviceId);
        } catch (Exception e) {
            throw Util.getAuraHandledException(e);
        }
    }
}
