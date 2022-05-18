public with sharing class ServiceParticipantRollupsService {
    private Integer participantEnrolledCount = 0;

    public void processInsertedParticipants(List<ServiceParticipant__c> participants) {
        processServiceSchedules(participants);
    }

    private void processServiceSchedules(List<ServiceParticipant__c> participants) {
        Set<Id> serviceScheduleIds = new Set<Id>();
        List<ServiceSchedule__c> serviceSchedules = new List<ServiceSchedule__c>();

        for (ServiceParticipant__c participant : participants) {
            serviceScheduleIds.add(participant.ServiceSchedule__c);
        }

        List<ServiceSchedule__c> schedules = new List<ServiceSchedule__c>();

        schedules = getServiceSchedules(serviceScheduleIds);

        for (ServiceSchedule__c schedule : schedules) {
            for (ServiceParticipant__c participant : schedule.ServiceParticipants__r) {
                if (participant.Status__c != 'Enrolled') {
                    continue;
                }

                if (schedule.ParticipantsEnrolled__c == null) {
                    schedule.ParticipantsEnrolled__c = 0;
                }
                schedule.ParticipantsEnrolled__c++;
            }
            serviceSchedules.add(schedule);
        }

        if (!serviceSchedules.isEmpty()) {
            update serviceSchedules;
        }
    }

    private List<ServiceSchedule__c> getServiceSchedules(Set<Id> scheduleIds) {
        return new List<ServiceSchedule__c>(
            [
                SELECT
                    Id,
                    ParticipantsEnrolled__c,
                    (SELECT Id, Status__c FROM ServiceParticipants__r)
                FROM ServiceSchedule__c
                WHERE Id IN :scheduleIds
            ]
        );
    }
}
