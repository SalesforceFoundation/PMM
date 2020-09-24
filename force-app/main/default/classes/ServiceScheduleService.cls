public with sharing class ServiceScheduleService {
    @TestVisible
    private ServiceScheduleDomain domain = new ServiceScheduleDomain();
    @TestVisible
    private ProgramEngagementSelector programEngagementSelector = new ProgramEngagementSelector();
    @TestVisible
    private ServiceSelector serviceSelector = new ServiceSelector();
    @TestVisible
    RecurrenceService recurrenceService = new RecurrenceService();

    public ServiceScheduleModel getServiceScheduleModel() {
        return new ServiceScheduleModel();
    }

    public void persist(ServiceScheduleModel model) {
        Savepoint savepoint = Database.setSavepoint();

        try {
            domain.insertModel(model);
        } catch (Exception ex) {
            Database.rollback(savepoint);
            throw new ServiceScheduleServiceException(ex);
        }
    }

    public SelectParticipantModel getSelectParticipantModel(Id serviceId) {
        SelectParticipantModel model = new SelectParticipantModel();
        populateRecords(serviceId, model);
        return model;
    }

    public ServiceScheduleModel processSchedule(ServiceScheduleModel model) {
        model.serviceSessions = getSessions(model.serviceSchedule);
        setServiceProviders(model.serviceSchedule);
        return model;
    }

    private void setServiceProviders(ServiceSchedule__c schedule) {
        Map<Id, Contact> providerById = new Map<Id, Contact>();

        if (schedule.PrimaryServiceProvider__c != null) {
            providerById.put(schedule.PrimaryServiceProvider__c, null);
        }

        if (schedule.OtherServiceProvider__c != null) {
            providerById.put(schedule.OtherServiceProvider__c, null);
        }

        if (providerById.isEmpty()) {
            return;
        }

        providerById.putAll(
            new Map<Id, Contact>(serviceSelector.getContactsByIds(providerById.keySet()))
        );
        if (schedule.PrimaryServiceProvider__c != null) {
            schedule.PrimaryServiceProvider__r = providerById.get(
                schedule.PrimaryServiceProvider__c
            );
        }

        if (schedule.OtherServiceProvider__c != null) {
            schedule.OtherServiceProvider__r = providerById.get(
                schedule.OtherServiceProvider__c
            );
        }
    }

    @TestVisible
    private List<ServiceSession__c> getSessions(ServiceSchedule__c schedule) {
        List<ServiceSession__c> sessions = new List<ServiceSession__c>();

        Id primaryServiceProvider = schedule.PrimaryServiceProvider__c;
        Id otherServiceProvider = schedule.OtherServiceProvider__c;

        for (DateTime startDateTime : getDateTimes(schedule)) {
            DateTime endDateTime = schedule.FirstSessionEnd__c != null
                ? DateTime.newInstance(
                      startDateTime.date(),
                      schedule.FirstSessionEnd__c.time()
                  )
                : null;
            sessions.add(
                new ServiceSession__c(
                    Name = schedule.Name + ': ' + startDateTime.date().format(),
                    SessionStart__c = startDateTime,
                    SessionEnd__c = endDateTime,
                    PrimaryServiceProvider__c = primaryServiceProvider,
                    OtherServiceProvider__c = otherServiceProvider
                )
            );
        }
        return sessions;
    }

    private List<DateTime> getDateTimes(ServiceSchedule__c schedule) {
        Integer interval = schedule.Interval__c != null
            ? Integer.valueOf(schedule.Interval__c)
            : null;
        String rRule = recurrenceService.createRRule(
            schedule.Frequency__c,
            interval,
            schedule.ServiceScheduleEndDate__c,
            Integer.valueOf(schedule.NumberOfServiceSessions__c),
            getDayNums(schedule.DaysOfWeek__c),
            schedule.FirstSessionStart__c
        );
        return recurrenceService.generate(schedule.FirstSessionStart__c, rRule);
    }

    private List<Integer> getDayNums(String daysOfWeek) {
        if (daysOfWeek == null) {
            return null;
        }
        List<Integer> result = new List<Integer>();
        for (String day : daysOfWeek.split(';')) {
            result.add(Integer.valueOf(day));
        }
        return result;
    }

    private void populateRecords(Id serviceId, SelectParticipantModel model) {
        model.program = programEngagementSelector.getProgramByServiceId(serviceId);
        if (model.program == null) {
            return;
        }

        model.programEngagements = programEngagementSelector.getProgramEngagementsByProgramId(
            model.program.Id
        );
        model.programCohorts = programEngagementSelector.getProgramCohortsByProgramId(
            model.program.Id
        );
    }

    public class ServiceScheduleServiceException extends Exception {
    }
}
