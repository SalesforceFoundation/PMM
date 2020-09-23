public with sharing class ServiceScheduleCreatorController {
    @TestVisible
    private static ServiceScheduleService service = new ServiceScheduleService();

    @AuraEnabled(cacheable=true)
    public static ServiceScheduleModel getServiceScheduleModel() {
        try {
            return service.getServiceScheduleModel();
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }

    @AuraEnabled
    public static void persist(ServiceScheduleModel model) {
        try {
            service.persist(model);
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }

    @AuraEnabled(cacheable=true)
    public static SelectParticipantModel getSelectParticipantModel(Id serviceId) {
        try {
            return service.getSelectParticipantModel(serviceId);
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }

    @AuraEnabled
    public static List<ServiceSession__c> getSessions(ServiceSchedule__c schedule) {
        try {
            return service.getSessions(schedule);
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }
}
