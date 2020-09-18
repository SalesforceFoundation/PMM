public with sharing class ServiceScheduleService {
    @TestVisible
    RecurrenceService recurrenceService = new RecurrenceService();

    public ServiceScheduleModel getServiceScheduleModel() {
        return new ServiceScheduleModel();
    }

    public void persist(ServiceScheduleModel model) {
        if (!hasPermissions(model)) {
            throw new ServiceScheduleServiceException(
                System.Label.Insert_Operation_Exception
            );
        }

        Savepoint savepoint = Database.setSavepoint();

        try {
            insert model.serviceSchedule;
            populateServiceScheduleId(model);
            insert model.serviceSessions;
            insert model.serviceParticipants;
        } catch (Exception ex) {
            Database.rollback(savepoint);
            throw new ServiceScheduleServiceException(ex);
        }
    }

    public List<ServiceSession__c> getSessions(ServiceSchedule__c schedule) {
        List<ServiceSession__c> sessions = new List<ServiceSession__c>();

        Id primaryServiceProvider = schedule.PrimaryServiceProvider__c != null
            ? schedule.PrimaryServiceProvider__c
            : null;
        Id otherServiceProvider = schedule.OtherServiceProvider__c != null
            ? schedule.OtherServiceProvider__c
            : null;

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
                    OtherServiceProvider__c = otherServiceProvider,
                    Status__c = 'Pending' //should we just let it inherit the default and remove this line? and ship with Pending as default?
                )
            );
        }
        return sessions;
    }

    private void populateServiceScheduleId(ServiceScheduleModel model) {
        for (ServiceSession__c session : model.serviceSessions) {
            session.ServiceSchedule__c = model.serviceSchedule.Id;
        }
        for (ServiceParticipant__c participant : model.serviceParticipants) {
            participant.ServiceSchedule__c = model.serviceSchedule.Id;
            participant.Service__c = model.serviceSchedule.Service__c;
        }
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
            getDayNums(schedule.DaysOfWeek__c)
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

    private Boolean hasPermissions(ServiceScheduleModel model) {
        return hasServiceSchedulePermissions(model) &&
            hasServiceSessionsPermissions(model) &&
            hasServiceParticipantsPermissions(model);
    }

    @TestVisible
    private Boolean hasServiceSchedulePermissions(ServiceScheduleModel model) {
        Boolean hasPermissions = PermissionValidator.getInstance()
            .hasObjectAccess(
                ServiceSchedule__c.SObjectType,
                PermissionValidator.CRUDAccessType.CREATEABLE
            );

        Set<String> populatedFieldNames = model.serviceSchedule.getPopulatedFieldsAsMap()
            .keySet();

        return hasPermissions &&
            PermissionValidator.getInstance()
                .hasFLSAccessForFields(
                    Schema.sObjectType.ServiceSchedule__c.getName(),
                    new List<String>(populatedFieldNames),
                    'insert'
                );
    }

    @TestVisible
    private Boolean hasServiceSessionsPermissions(ServiceScheduleModel model) {
        if (model.serviceSessions.isEmpty()) {
            return true;
        }

        Boolean hasPermissions = PermissionValidator.getInstance()
            .hasObjectAccess(
                ServiceSession__c.SObjectType,
                PermissionValidator.CRUDAccessType.CREATEABLE
            );

        Set<String> populatedFieldNames = new Set<String>();

        for (ServiceSession__c session : model.serviceSessions) {
            populatedFieldNames.addAll(session.getPopulatedFieldsAsMap().keySet());
        }

        return hasPermissions &&
            PermissionValidator.getInstance()
                .hasFLSAccessForFields(
                    Schema.sObjectType.ServiceSession__c.getName(),
                    new List<String>(populatedFieldNames),
                    'insert'
                );
    }

    @TestVisible
    private Boolean hasServiceParticipantsPermissions(ServiceScheduleModel model) {
        if (model.serviceParticipants.isEmpty()) {
            return true;
        }

        Boolean hasPermissions = PermissionValidator.getInstance()
            .hasObjectAccess(
                ServiceParticipant__c.SObjectType,
                PermissionValidator.CRUDAccessType.CREATEABLE
            );

        Set<String> populatedFieldNames = new Set<String>();

        for (ServiceParticipant__c participant : model.serviceParticipants) {
            populatedFieldNames.addAll(participant.getPopulatedFieldsAsMap().keySet());
        }

        return hasPermissions &&
            PermissionValidator.getInstance()
                .hasFLSAccessForFields(
                    Schema.sObjectType.ServiceParticipant__c.getName(),
                    new List<String>(populatedFieldNames),
                    'insert'
                );
    }

    public class ServiceScheduleServiceException extends Exception {
    }
}
