public with sharing class SelectParticipantController {
    @TestVisible
    private static SelectParticipantService SelectParticipantService = new SelectParticipantService();

    @AuraEnabled(cacheable=true)
    public static SelectParticipantService.SelectParticipantModel getSelectParticipantModel(
        Id serviceId
    ) {
        try {
            return SelectParticipantService.getSelectParticipantModel(serviceId);
        } catch (Exception e) {
            throw Util.getAuraHandledException(e);
        }
    }
}
