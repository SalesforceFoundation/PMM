/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ServiceScheduleCreatorController {
    @TestVisible
    private static ServiceScheduleService service = new ServiceScheduleService();

    @AuraEnabled(cacheable=true)
    public static ServiceScheduleModel getServiceScheduleModel(
        Id serviceScheduleId,
        Id recordTypeId
    ) {
        try {
            return service.getServiceScheduleModel(serviceScheduleId, recordTypeId);
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }

    @AuraEnabled
    public static ServiceScheduleModel persist(ServiceScheduleModel model) {
        try {
            return service.persist(model);
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }

    @AuraEnabled
    // Doing fls checks in the validateCreateAccess method in the domain
    /* sfca-disable-stack ApexFlsViolationRule */
    public static void addParticipants(
        List<ProgramEngagement__c> engagements,
        Id scheduleId
    ) {
        try {
            service.addParticipants(engagements, scheduleId);
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }

    @AuraEnabled(cacheable=true)
    public static SelectParticipantModel getSelectParticipantModel(
        Id serviceId,
        String searchText,
        String cohortId
    ) {
        System.debug(cohortId);
        System.debug('Controller');
        Id cohortIdConvert = null;
        if (cohortId != null && cohortId != '') {
            cohortIdConvert = (Id) cohortId;
        }
        try {
            return service.getSelectParticipantModel(
                serviceId,
                searchText,
                cohortIdConvert
            );
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<Id> getExistingParticipantContactIds(Id scheduleId) {
        try {
            return service.getExistingParticipantContactIds(scheduleId);
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }

    @AuraEnabled(cacheable=true)
    public static Boolean checkAddParticipantsPermissions() {
        try {
            return service.checkAddParticipantsPermissions();
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }

    @AuraEnabled
    public static ServiceScheduleModel processSchedule(ServiceScheduleModel model) {
        try {
            return service.processSchedule(model);
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }

    @AuraEnabled
    // Doing fls read checks on the fields used to determine records to delete
    /* sfca-disable-stack ApexFlsViolationRule */
    public static Integer deleteSessionsAfter(Id scheduleId, Date startDate) {
        try {
            return service.deleteSessionsAfter(scheduleId, startDate);
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }

    @AuraEnabled
    public static ServiceSession__c createSession(
        ServiceSchedule__c schedule,
        DateTime startDateTime,
        DateTime endDateTime
    ) {
        try {
            return service.createSession(schedule, startDateTime, endDateTime);
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }

    @AuraEnabled(cacheable=true)
    public static Date getToday() {
        return Util.getToday();
    }

    @AuraEnabled(cacheable=true)
    public static Integer getDayNum(DateTime fullDateTime) {
        return Util.getDayNum(fullDateTime.date());
    }
}
