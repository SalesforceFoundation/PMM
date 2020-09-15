public with sharing class ServiceScheduleCreatorController {
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
    public static void commitServiceScheduleModel() {
        try {
            service.commitServiceScheduleModel();
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }
}
