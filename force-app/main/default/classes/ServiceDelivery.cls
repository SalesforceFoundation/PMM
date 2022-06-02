public with sharing class ServiceDelivery {
    private ServiceDelivery__c delivery;

    private static final String ABSENT = 'Absent';
    private static final String PRESENT = 'Present';
    private static List<String> BUCKET_NAMES = new List<String>{ ABSENT, PRESENT };

    private static Map<String, List<String>> statusBuckets = new ServiceDeliveryService()
        .getStatusBuckets(BUCKET_NAMES);
    private static List<String> presentStatuses = statusBuckets.get(PRESENT);
    private static List<String> absentStatuses = statusBuckets.get(ABSENT);

    public ServiceDelivery(ServiceDelivery__c delivery) {
        this.delivery = delivery;
    }

    public Boolean isPresent() {
        return presentStatuses.contains(delivery.AttendanceStatus__c);
    }

    public Boolean isAbsent() {
        return absentStatuses.contains(delivery.AttendanceStatus__c);
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
