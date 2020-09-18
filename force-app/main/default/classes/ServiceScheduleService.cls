public with sharing class ServiceScheduleService {
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

    private void populateServiceScheduleId(ServiceScheduleModel model) {
        for (ServiceSession__c session : model.serviceSessions) {
            session.ServiceSchedule__c = model.serviceSchedule.Id;
        }
        for (ServiceParticipant__c participant : model.serviceParticipants) {
            participant.ServiceSchedule__c = model.serviceSchedule.Id;
            participant.Service__c = model.serviceSchedule.Service__c;
        }
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
