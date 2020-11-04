public with sharing class AttendanceSelector {
    public List<ServiceDelivery__c> getServiceDeliveriesBySessionId(Id sessionId) {
        if (!Schema.SObjectType.ServiceDelivery__c.isAccessible()) {
            return new List<ServiceDelivery__c>();
        }

        List<ServiceDelivery__c> serviceDeliveries = [
            SELECT
                Id,
                Contact__c,
                Service__c,
                Quantity__c,
                CreatedDate,
                CreatedById,
                AttendanceStatus__c,
                UnitOfMeasurement__c
            FROM ServiceDelivery__c
            WHERE ServiceSession__c = :sessionId AND Contact__c != NULL
        ];

        return Security.stripInaccessible(AccessType.READABLE, serviceDeliveries)
            .getRecords();
    }

    public List<ServiceParticipant__c> getServiceParticipantsByScheduleId(
        Id scheduleId,
        Set<Id> contactsToExclude
    ) {
        if (!Schema.SObjectType.ServiceParticipant__c.isAccessible()) {
            return new List<ServiceParticipant__c>();
        }

        List<ServiceParticipant__c> serviceParticipants = [
            SELECT
                Id,
                Contact__c,
                Service__c,
                ProgramEngagement__c,
                Service__r.UnitOfMeasurement__c
            FROM ServiceParticipant__c
            WHERE
                ServiceSchedule__c = :scheduleId
                AND Contact__c NOT IN :contactsToExclude
        ];

        return Security.stripInaccessible(AccessType.READABLE, serviceParticipants)
            .getRecords();
    }

    public ServiceSession__c getSession(Id sessionId) {
        ServiceSession__c session = [
            SELECT Id, ServiceSchedule__c
            FROM ServiceSession__c
            WHERE Id = :sessionId
            LIMIT 1
        ];

        // Used by Apex code only for querying related records
        // does not require strip inaccessible
        return session;
    }
}
