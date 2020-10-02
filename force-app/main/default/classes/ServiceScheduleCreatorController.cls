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
    public static ServiceScheduleModel processSchedule(ServiceScheduleModel model) {
        try {
            return service.processSchedule(model);
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }

    @AuraEnabled
    public static ServiceSession__c createSession(
        ServiceSchedule__c schedule,
        DateTime startDateTime,
        DateTime endDateTime
    ) {
        try {
            return service.createSession(schedule, startDateTime, endDateTime);
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }
}
