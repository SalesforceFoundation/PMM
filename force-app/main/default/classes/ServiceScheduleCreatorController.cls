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
    public static ServiceScheduleModel getServiceScheduleModel() {
        try {
            return service.getServiceScheduleModel();
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

    @AuraEnabled(cacheable=true)
    public static SelectParticipantModel getSelectParticipantModel(Id serviceId) {
        try {
            return service.getSelectParticipantModel(serviceId);
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

    @AuraEnabled
    public static Date getToday() {
        return Util.getToday();
    }
}
