public with sharing class ServiceDeliveryController {

    public static ServiceService service = new ServiceService();
    @AuraEnabled (cacheable=true)
    public static List<Object> getFieldSet() {
        try {
            return service.getBulkFields();
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
