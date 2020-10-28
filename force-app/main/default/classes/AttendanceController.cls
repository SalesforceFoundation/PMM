public with sharing class AttendanceController {
    @TestVisible
    private static AttendanceService service = new AttendanceService();

    public static List<ServiceDelivery__c> generateRoster(Id serviceId) {
        try {
            return service.generateRoster(serviceId);
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }
}
