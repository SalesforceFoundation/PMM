public with sharing class AttendanceSelector {
    public List<ServiceDelivery__c> getServiceDeliveriesBySessionId(Id sessionId) {
        return new List<ServiceDelivery__c>();
    }

    public List<ServiceParticipant__c> getServiceParticipantsBySessionId(
        Id sessionId,
        Set<Id> contactsToExclude
    ) {
        return new List<ServiceParticipant__c>();
    }
}
