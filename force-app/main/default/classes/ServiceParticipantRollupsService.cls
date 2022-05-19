public with sharing class ServiceParticipantRollupsService {
    private static String ENROLLED = 'Enrolled';

    public void processInsertedParticipants(List<ServiceParticipant__c> participants) {
        Set<Id> serviceScheduleIds = new Set<Id>();
        Map<Id, ServiceSchedule__c> serviceSchedules = new Map<Id, ServiceSchedule__c>();
        Map<Id, ServiceSchedule__c> schedules = new Map<Id, ServiceSchedule__c>();

        for (ServiceParticipant__c participant : participants) {
            serviceScheduleIds.add(participant.ServiceSchedule__c);
        }

        schedules = getServiceSchedules(serviceScheduleIds);

        for (ServiceParticipant__c serviceParticipant : participants) {
            ServiceSchedule__c schedule = schedules.get(
                serviceParticipant.ServiceSchedule__c
            );

            if (serviceParticipant.Status__c != ENROLLED) {
                continue;
            }

            if (schedule.ParticipantsEnrolled__c == null) {
                schedule.ParticipantsEnrolled__c = 0;
            }

            schedule.ParticipantsEnrolled__c++;

            serviceSchedules.put(schedule.Id, schedule);
        }

        if (!serviceSchedules.isEmpty()) {
            update serviceSchedules.values();
        }
    }

    public void processDeletedServiceSchedules(List<ServiceParticipant__c> participants) {
        Set<Id> serviceScheduleIds = new Set<Id>();
        Map<Id, ServiceSchedule__c> serviceSchedules = new Map<Id, ServiceSchedule__c>();

        for (ServiceParticipant__c participant : participants) {
            serviceScheduleIds.add(participant.ServiceSchedule__c);
        }

        Map<Id, ServiceSchedule__c> schedules = new Map<Id, ServiceSchedule__c>();

        schedules = getServiceSchedules(serviceScheduleIds);

        for (ServiceParticipant__c serviceParticipant : participants) {
            ServiceSchedule__c schedule = schedules.get(
                serviceParticipant.ServiceSchedule__c
            );

            if (serviceParticipant.Status__c != ENROLLED) {
                continue;
            }

            schedule.ParticipantsEnrolled__c--;

            serviceSchedules.put(schedule.Id, schedule);
        }

        if (!serviceSchedules.isEmpty()) {
            update serviceSchedules.values();
        }
    }

    private Map<Id, ServiceSchedule__c> getServiceSchedules(Set<Id> scheduleIds) {
        return new Map<Id, ServiceSchedule__c>(
            [
                SELECT Id, ParticipantsEnrolled__c
                FROM ServiceSchedule__c
                WHERE Id IN :scheduleIds
            ]
        );
    }
}
