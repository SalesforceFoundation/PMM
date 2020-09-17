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
}
