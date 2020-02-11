public with sharing class ServiceSelector {
    public ServiceSelector() {
    }

    public List<Service__c> getServicesByProgramIds(Set<Id> programIds) {
        if (!Schema.SObjectType.Service__c.isAccessible()) {
            return new List<Service__c>();
        }
        List<Service__c> queriedServices = [
            SELECT Id, Name, Program__c
            FROM Service__c
            WHERE Program__c IN :programIds
        ];

        return Security.stripInaccessible(AccessType.READABLE, queriedServices)
            .getRecords();
    }
}
