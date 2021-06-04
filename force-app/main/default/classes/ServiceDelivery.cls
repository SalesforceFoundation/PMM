public with sharing class ServiceDelivery {
    private ServiceDeliveryService deliveryService = new ServiceDeliveryService();
    private ServiceDelivery__c delivery;

    public ServiceDelivery(ServiceDelivery__c delivery) {
        this.delivery = delivery;
    }

    public Boolean isPresent() {
        return deliveryService.presentStatuses.contains(delivery.AttendanceStatus__c);
    }

    public Boolean isAbsent() {
        return deliveryService.absentStatuses.contains(delivery.AttendanceStatus__c);
    }

    public Boolean isDelivered() {
        return delivery.Quantity__c > 0 && delivery.DeliveryDate__c != null;
    }

    public Id getId() {
        return delivery.Id;
    }

    public Date getDeliveryDate() {
        return delivery.DeliveryDate__c;
    }

    public Id getLookupId(SObjectField lookupField) {
        return (Id) delivery.get(lookupField);
    }
}
