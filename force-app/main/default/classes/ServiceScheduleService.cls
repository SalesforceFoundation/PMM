public with sharing class ServiceScheduleService {
    public ServiceScheduleModel getServiceScheduleModel() {
        return new ServiceScheduleModel();
    }

    public void persist(ServiceScheduleModel model) {
        if (!hasPermissions(model)) {
            // TODO: Add label to label branch
            throw new ServiceScheduleServiceException('You can\'t get there from here!');
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
        Boolean hasPermissions = hasServiceSchedulePermissions(model);
        hasPermissions = hasPermissions && hasServiceSessionsPermissions(model);
        hasPermissions = hasPermissions && hasServiceParticipantsPermissions(model);

        return hasPermissions;
    }

    @TestVisible
    private Boolean hasServiceSchedulePermissions(ServiceScheduleModel model) {
        Boolean hasPermissions = PermissionValidator.getInstance()
            .hasObjectAccess(
                ServiceSchedule__c.SObjectType,
                PermissionValidator.CRUDAccessType.CREATEABLE
            );

        Set<String> populatedFieldNames = new Set<String>();

        populatedFieldNames.addAll(
            model.serviceSchedule.getPopulatedFieldsAsMap().keySet()
        );

        hasPermissions =
            hasPermissions &&
            PermissionValidator.getInstance()
                .hasFLSAccessForFields(
                    Schema.sObjectType.ServiceSchedule__c.getName(),
                    new List<String>(populatedFieldNames),
                    'insert'
                );

        return hasPermissions;
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

        hasPermissions =
            hasPermissions &&
            PermissionValidator.getInstance()
                .hasFLSAccessForFields(
                    Schema.sObjectType.ServiceSession__c.getName(),
                    new List<String>(populatedFieldNames),
                    'insert'
                );

        return hasPermissions;
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

        hasPermissions =
            hasPermissions &&
            PermissionValidator.getInstance()
                .hasFLSAccessForFields(
                    Schema.sObjectType.ServiceParticipant__c.getName(),
                    new List<String>(populatedFieldNames),
                    'insert'
                );

        return hasPermissions;
    }

    public class ServiceScheduleServiceException extends Exception {
    }
}
