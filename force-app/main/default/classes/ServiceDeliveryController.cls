public with sharing class ServiceDeliveryController {
    public static ServiceService service = new ServiceService();

    @AuraEnabled(cacheable=true)
    public static List<Object> getFieldSet() {
        try {
            return service.getBulkFields();
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static Map<String, List<Object>> getServicesAndEngagements(Id contactId) {
        try {
            return service.getServicesEngagementsByContactId(contactId);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
