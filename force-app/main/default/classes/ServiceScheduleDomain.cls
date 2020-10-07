public with sharing class ServiceScheduleDomain {
    public void insertModel(ServiceScheduleModel model) {
        insertSchedule(model.serviceSchedule);
        setSessionDefaults(model);
        insertRelatedRecords(model.serviceSessions);
        generateParticipants(model);
        insertRelatedRecords(model.serviceParticipants);
    }

    public void insertSchedule(ServiceSchedule__c schedule) {
        validateCreateAccess(new List<SObject>{ schedule });
        insert schedule;
    }

    public void deleteSessions(List<ServiceSession__c> sessionsToDelete) {
        if (
            !PermissionValidator.getInstance()
                .hasObjectAccess(
                    ServiceSession__c.SObjectType,
                    PermissionValidator.CRUDAccessType.DELETEABLE
                )
        ) {
            throw new ServiceScheduleDomainException(Label.Delete_Operation_Exception);
        }

        delete sessionsToDelete;
    }

    private void insertRelatedRecords(List<SObject> sObjects) {
        validateCreateAccess(sObjects);
        insert sObjects;
    }

    private void setSessionDefaults(ServiceScheduleModel model) {
        for (ServiceSession__c session : model.serviceSessions) {
            session.ServiceSchedule__c = model.serviceSchedule.Id;
            session.PrimaryServiceProvider__c = model.serviceSchedule.PrimaryServiceProvider__c;
            session.OtherServiceProvider__c = model.serviceSchedule.OtherServiceProvider__c;
        }
    }

    private void generateParticipants(ServiceScheduleModel model) {
        for (ProgramEngagement__c engagement : model.selectedParticipants) {
            ServiceParticipant__c participant = new ServiceParticipant__c(
                Name = (engagement.Contact__r.Name +
                    ' - ' +
                    model.serviceSchedule.Name)
                    .abbreviate(80),
                ServiceSchedule__c = model.serviceSchedule.Id,
                Service__c = model.serviceSchedule.Service__c,
                ProgramEngagement__c = engagement.Id,
                Contact__c = engagement.Contact__c
            );

            model.serviceParticipants.add(participant);
        }
    }

    private void validateCreateAccess(List<SObject> sObjects) {
        if (sObjects == null || sObjects.isEmpty()) {
            return;
        }

        Boolean hasObjectPermissions;
        Boolean hasFieldPermissions;

        SObjectType sObjectType = sObjects[0].getSObjectType();
        hasObjectPermissions = PermissionValidator.getInstance()
            .hasObjectAccess(sObjectType, PermissionValidator.CRUDAccessType.CREATEABLE);

        Set<String> populatedFieldNames = new Set<String>();
        for (SObject sObj : sObjects) {
            populatedFieldNames.addAll(sObj.getPopulatedFieldsAsMap().keySet());
        }

        hasFieldPermissions = PermissionValidator.getInstance()
            .hasFLSAccessForFields(
                sObjectType.getDescribe().getName(),
                new List<String>(populatedFieldNames),
                'insert',
                false
            );

        if (!(hasObjectPermissions && hasFieldPermissions)) {
            throw new ServiceScheduleDomainException(
                System.Label.Insert_Operation_Exception
            );
        }
    }

    public class ServiceScheduleDomainException extends Exception {
    }
}
