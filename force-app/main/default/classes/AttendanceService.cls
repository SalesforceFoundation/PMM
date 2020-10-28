public with sharing class AttendanceService {
    @TestVisible
    private AttendanceSelector attendanceSelector = new AttendanceSelector();

    public List<ServiceDelivery__c> generateRoster(Id sessionId) {
        return createRows(sessionId);
    }

    private List<ServiceDelivery__c> createRows(Id sessionId) {
        Set<Id> existingClients = new Set<Id>();
        List<ServiceDelivery__c> deliveries = attendanceSelector.getServiceDeliveriesBySessionId(
            sessionId
        );

        for (ServiceDelivery__c delivery : deliveries) {
            existingClients.add(delivery.Contact__c);
        }

        for (
            ServiceParticipant__c participant : attendanceSelector.getServiceParticipantsBySessionId(
                sessionId,
                existingClients
            )
        ) {
            deliveries.add(createServiceDelivery(participant));
        }

        return deliveries;
    }

    private ServiceDelivery__c createServiceDelivery(ServiceParticipant__c participant) {
        return new ServiceDelivery__c();
    }
}
