public with sharing class ServiceScheduleService {
    @TestVisible
    private ServiceScheduleDomain domain = new ServiceScheduleDomain();
    @TestVisible
    private ProgramEngagementSelector programEngagementSelector = new ProgramEngagementSelector();
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

    public ServiceScheduleModel updateModel(ServiceScheduleModel model) {
        model.serviceSessions = getSessions(model.serviceSchedule);
        model.serviceSchedule = getServiceProviders(model.serviceSchedule);
        return model;
    }

    private ServiceSchedule__c getServiceProviders(ServiceSchedule__c schedule) {
        if (schedule.PrimaryServiceProvider__c != null) {
            Contact primaryServiceProvider = [
                SELECT Name
                FROM Contact
                WHERE Id = :schedule.PrimaryServiceProvider__c
                LIMIT 1
            ];
            schedule.PrimaryServiceProvider__r = primaryServiceProvider;
        }

        if (schedule.OtherServiceProvider__c != null) {
            Contact otherServiceProvider = [
                SELECT Name
                FROM Contact
                WHERE Id = :schedule.OtherServiceProvider__c
                LIMIT 1
            ];
            schedule.OtherServiceProvider__r = otherServiceProvider;
        }

        return schedule;
    }

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
