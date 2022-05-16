/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ServiceScheduleDomain {
    public void commitChangesToModel(ServiceScheduleModel model) {
        upsertSchedule(model.serviceSchedule);
        setSessionDefaults(model);
        insertRelatedRecords(stripExistingRecords(model.serviceSessions));
        generateParticipants(model);
        insertRelatedRecords(stripExistingRecords(model.serviceParticipants));
    }

    public void upsertSchedule(ServiceSchedule__c schedule) {
        if (schedule.Id == null) {
            validateCreateAccess(new List<SObject>{ schedule });
            insert schedule;
        } else {
            validateUpdateAccess(new List<SObject>{ schedule });
            update schedule;
        }
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

    private List<SObject> stripExistingRecords(List<SObject> sObjects) {
        List<SObject> sObjectsNotYetInserted = new List<SObject>();
        for (SObject sObj : sObjects) {
            if (sObj.Id == null) {
                sObjectsNotYetInserted.add(sObj);
            }
        }
        return sObjectsNotYetInserted;
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

    public void insertParticipants(
        List<ProgramEngagement__c> engagements,
        ServiceSchedule__c schedule
    ) {
        List<ServiceParticipant__c> participants = new List<ServiceParticipant__c>();
        for (ProgramEngagement__c engagement : engagements) {
            participants.add(createServiceParticipant(engagement, schedule));
        }
        insertRelatedRecords((List<SObject>) participants);
    }

    private void generateParticipants(ServiceScheduleModel model) {
        for (ProgramEngagement__c engagement : model.selectedEngagements) {
            model.serviceParticipants.add(
                createServiceParticipant(engagement, model.serviceSchedule)
            );
        }
    }

    private ServiceParticipant__c createServiceParticipant(
        ProgramEngagement__c engagement,
        ServiceSchedule__c schedule
    ) {
        return new ServiceParticipant__c(
            Name = (engagement.Contact__r.Name + ' - ' + schedule.Name).abbreviate(80),
            ServiceSchedule__c = schedule.Id,
            Service__c = schedule.Service__c,
            ProgramEngagement__c = engagement.Id,
            Contact__c = engagement.Contact__c
        );
    }

    @TestVisible
    private void validateUpdateAccess(List<SObject> sObjects) {
        if (sObjects == null || sObjects.isEmpty()) {
            return;
        }

        Boolean hasObjectPermissions;
        Boolean hasFieldPermissions;

        SObjectType sObjectType = sObjects[0].getSObjectType();
        hasObjectPermissions = PermissionValidator.getInstance()
            .hasObjectAccess(sObjectType, PermissionValidator.CRUDAccessType.UPDATEABLE);

        Set<String> populatedFieldNames = new Set<String>();
        for (SObject sObj : sObjects) {
            populatedFieldNames.addAll(sObj.getPopulatedFieldsAsMap().keySet());
        }

        // Id can be included in update call but is never updateable
        if (populatedFieldNames.contains('Id')) {
            populatedFieldNames.remove('Id');
        }

        hasFieldPermissions = PermissionValidator.getInstance()
            .hasFLSAccessForFields(
                sObjectType.getDescribe().getName(),
                new List<String>(populatedFieldNames),
                'update',
                false
            );

        if (!(hasObjectPermissions && hasFieldPermissions)) {
            throw new ServiceScheduleDomainException(
                System.Label.UpsertOperationException
            );
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
