public with sharing class AttendanceService {
    @TestVisible
    private AttendanceSelector attendanceSelector = new AttendanceSelector();

    private static final Map<SObjectField, SObjectField> SERVICE_FIELD_BY_PARTICIPANT_FIELD = new Map<SObjectField, SObjectField>{
        ServiceParticipant__c.Contact__c => ServiceDelivery__c.Contact__c,
        ServiceParticipant__c.ProgramEngagement__c => ServiceDelivery__c.ProgramEngagement__c,
        ServiceParticipant__c.Service__c => ServiceDelivery__c.Service__c
    };

    public List<ServiceDelivery__c> generateRoster(Id sessionId) {
        return createRows(sessionId);
    }

    private List<ServiceDelivery__c> createRows(Id sessionId) {
        Set<Id> existingClients = new Set<Id>();
        List<ServiceDelivery__c> deliveries = new List<ServiceDelivery__c>(
            attendanceSelector.getServiceDeliveriesBySessionId(sessionId)
        );

        for (ServiceDelivery__c delivery : deliveries) {
            existingClients.add(delivery.Contact__c);
        }

        Id scheduleId = attendanceSelector.getSession(sessionId).ServiceSchedule__c;

        for (
            ServiceParticipant__c participant : attendanceSelector.getServiceParticipantsByScheduleId(
                scheduleId,
                existingClients
            )
        ) {
            deliveries.add(createServiceDelivery(sessionId, participant));
        }

        return deliveries;
    }

    @TestVisible
    private ServiceDelivery__c createServiceDelivery(
        Id sessionId,
        ServiceParticipant__c participant
    ) {
        SObject particpantRecord = participant;
        SObject deliveryRecord = new ServiceDelivery__c(
            ServiceSession__c = sessionId,
            AttendanceStatus__c = 'Present'
        );

        for (SObjectField sourceField : SERVICE_FIELD_BY_PARTICIPANT_FIELD.keySet()) {
            SObjectField targetField = SERVICE_FIELD_BY_PARTICIPANT_FIELD.get(
                sourceField
            );
            deliveryRecord.put(targetField, particpantRecord.get(sourceField));
        }

        return (ServiceDelivery__c) deliveryRecord;
    }
}