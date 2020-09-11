public with sharing class ServiceScheduleCreatorController {
    private static ServiceScheduleData dataModel = new ServiceScheduleData();

    @AuraEnabled(cacheable=true)
    public static ServiceScheduleData getDataModel() {
        try {
            return dataModel;
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }
}
