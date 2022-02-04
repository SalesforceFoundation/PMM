/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ServiceScheduleService {
    @TestVisible
    private ServiceScheduleDomain domain = new ServiceScheduleDomain();
    @TestVisible
    private ProgramEngagementSelector programEngagementSelector = new ProgramEngagementSelector();
    @TestVisible
    private ProgramSelector programSelector = new ProgramSelector();
    @TestVisible
    private ServiceSelector serviceSelector = new ServiceSelector();
    @TestVisible
    private RecurrenceService recurrenceService = new RecurrenceService();
    private static final String ONE_TIME = 'One Time';
    @TestVisible
    private static final Set<String> ACTIVE_ENGAGEMENT_STAGES = new Set<String>{
        'Active',
        'Enrolled'
    };

    public ServiceScheduleModel getServiceScheduleModel(Id recordTypeId) {
        return new ServiceScheduleModel(recordTypeId);
    }

    public ServiceScheduleModel persist(ServiceScheduleModel model) {
        Savepoint savepoint = Database.setSavepoint();

        try {
            domain.insertModel(model);
            return model;
        } catch (Exception ex) {
            Database.rollback(savepoint);
            throw new ServiceScheduleServiceException(ex);
        }
    }

    public List<Id> getExistingParticipantContactIds(Id scheduleId) {
        return serviceSelector.getExistingParticipantContactIdsByScheduleId(scheduleId);
    }

    public Boolean checkAddParticipantsPermissions() {
        Boolean canReadServiceSchedule = PermissionValidator.getInstance()
            .hasObjectAccess(
                ServiceSchedule__c.SObjectType,
                PermissionValidator.CRUDAccessType.READABLE
            );
        Boolean canReadProgramEngagement = PermissionValidator.getInstance()
            .hasObjectAccess(
                ProgramEngagement__c.SObjectType,
                PermissionValidator.CRUDAccessType.READABLE
            );
        Boolean canCreateServiceParticipant = PermissionValidator.getInstance()
            .hasObjectAccess(
                ServiceParticipant__c.SObjectType,
                PermissionValidator.CRUDAccessType.CREATEABLE
            );
        List<Schema.SObjectField> fieldsRequireReadAccess = new List<Schema.SObjectField>{
            ServiceSchedule__c.Service__c,
            ServiceSchedule__c.Name,
            ProgramEngagement__c.Contact__c,
            Contact.Name
        };
        List<Schema.SObjectField> fieldsRequireInsertAccess = new List<Schema.SObjectField>{
            ServiceParticipant__c.Name,
            ServiceParticipant__c.ServiceSchedule__c,
            ServiceParticipant__c.Service__c,
            ServiceParticipant__c.ProgramEngagement__c,
            ServiceParticipant__c.Contact__c
        };

        return PermissionValidator.getInstance()
                .hasFLSAccessForFields(fieldsRequireReadAccess, 'read') &&
            PermissionValidator.getInstance()
                .hasFLSAccessForFields(fieldsRequireInsertAccess, 'insert') &&
            canReadServiceSchedule &&
            canReadProgramEngagement &&
            canCreateServiceParticipant;
    }

    public void addParticipants(List<ProgramEngagement__c> engagements, Id scheduleId) {
        ServiceSchedule__c schedule = serviceSelector.getScheduleById(scheduleId);
        domain.insertParticipants(engagements, schedule);
    }

    public SelectParticipantModel getSelectParticipantModel(Id serviceId) {
        SelectParticipantModel model = new SelectParticipantModel();
        populateRecords(serviceId, model);
        return model;
    }

    public ServiceScheduleModel processSchedule(ServiceScheduleModel model) {
        setServiceProviders(model.serviceSchedule);

        if (!model.serviceSchedule.CreateServiceSessionRecords__c) {
            return model;
        }

        model.serviceSessions = getSessions(model.serviceSchedule, model.maxSessions);
        return model;
    }

    public Integer deleteSessionsAfter(Id scheduleId, Date startDate) {
        List<ServiceSession__c> sessionsToDelete = serviceSelector.getSessionsAfter(
            scheduleId,
            startDate
        );
        Integer numSessions = sessionsToDelete.size();
        domain.deleteSessions(sessionsToDelete);
        return numSessions;
    }

    public ServiceSession__c createSession(
        ServiceSchedule__c schedule,
        DateTime startDateTime,
        DateTime endDateTime
    ) {
        // NOTE: Passing the entire schedule to allow for changes in our default name
        // or potentially setting additional defaults at this level
        return new ServiceSession__c(
            Name = (startDateTime.date().format() + ': ' + schedule.Name).abbreviate(80),
            SessionStart__c = startDateTime,
            SessionEnd__c = endDateTime
        );
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
    private List<ServiceSession__c> getSessions(
        ServiceSchedule__c schedule,
        Integer maxSessions
    ) {
        List<ServiceSession__c> sessions = new List<ServiceSession__c>();

        Long msInterval = schedule.FirstSessionEnd__c != null
            ? schedule.FirstSessionEnd__c.getTime() -
              schedule.FirstSessionStart__c.getTime()
            : 0;

        for (DateTime startDateTime : getDateTimes(schedule, maxSessions)) {
            DateTime endDateTime = schedule.FirstSessionEnd__c != null
                ? DateTime.newInstance(startDateTime.getTime() + msInterval)
                : null;
            sessions.add(createSession(schedule, startDateTime, endDateTime));
        }
        return sessions;
    }

    private List<DateTime> getDateTimes(
        ServiceSchedule__c schedule,
        Integer maxSessions
    ) {
        if (schedule.Frequency__c == ONE_TIME) {
            return new List<DateTime>{ schedule.FirstSessionStart__c };
        }

        Integer interval = schedule.Interval__c != null
            ? Integer.valueOf(schedule.Interval__c)
            : null;

        String byDay = schedule.MonthlyRecurrenceOption__c != null
            ? schedule.MonthlyRecurrenceOption__c
            : null;

        String rRule = recurrenceService.createRRule(
            schedule.Frequency__c,
            interval,
            schedule.ServiceScheduleEndDate__c,
            Integer.valueOf(schedule.NumberOfServiceSessions__c),
            getDayNums(schedule.DaysOfWeek__c),
            schedule.FirstSessionStart__c,
            schedule.MonthlyRecurrenceOption__c
        );

        return recurrenceService.generate(
            schedule.FirstSessionStart__c,
            rRule,
            maxSessions
        );
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

        model.programCohorts = programSelector.getProgramCohortsFromProgramId(
            model.program.Id
        );

        model.programEngagements = programEngagementSelector.getProgramEngagementsByProgramId(
            model.program.Id,
            getSelectFieldsWithToLabel(model),
            ACTIVE_ENGAGEMENT_STAGES
        );
    }

    @TestVisible
    private Set<String> getSelectFieldsWithToLabel(SelectParticipantModel model) {
        Set<String> selectFields = new Set<String>();
        for (String fieldPath : model.fieldByFieldPath.keySet()) {
            if (
                ((String) model.fieldByFieldPath.get(fieldPath).get('type'))
                    .contains('PICKLIST')
            ) {
                selectFields.add('toLabel(' + fieldPath + ')');
                continue;
            }
            selectFields.add(fieldPath);
        }

        return selectFields;
    }

    public class ServiceScheduleServiceException extends Exception {
    }
}
