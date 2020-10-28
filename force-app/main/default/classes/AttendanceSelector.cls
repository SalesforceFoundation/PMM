public with sharing class AttendanceSelector {
    public List<ServiceDelivery__c> getServiceDeliveriesByServiceId(Id serviceId) {
        return new List<ServiceDelivery__c>();
    }

    public List<ServiceParticipant__c> getServiceParticipantsByServiceId(
        Id serviceId,
        Set<Id> contactsToExclude
    ) {
        return new List<ServiceParticipant__c>();
    }
}
