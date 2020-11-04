public with sharing class AttendanceController {
    @TestVisible
    private static AttendanceService service = new AttendanceService();

    @AuraEnabled(cacheable=true)
    public static List<ServiceDelivery__c> generateRoster(Id sessionId) {
        try {
            return service.generateRoster(sessionId);
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }
}
