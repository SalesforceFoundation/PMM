/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ServiceDeliveryTriggerHandler {
    @TestVisible
    private AttendanceService service = new AttendanceService();

    private SObjectField attendanceStatus = ServiceDelivery__c.AttendanceStatus__c;
    private Map<SObjectField, Set<Id>> recordIdsByLookupField = new Map<SObjectField, Set<Id>>();
    private Map<SObjectType, List<SObject>> sObjectsByType = new Map<SObjectType, List<SObject>>();
    private static Map<String, SObjectField> LOOKUP_FIELD_BY_FEATURE = new Map<String, SObjectField>{
        'AttendanceToContact' => ServiceDelivery__c.Contact__c,
        'AttendanceToService' => ServiceDelivery__c.Service__c,
        'AttendanceToServiceSession' => ServiceDelivery__c.ServiceSession__c,
        'AttendanceToProgramEngagement' => ServiceDelivery__c.ProgramEngagement__c
    };
    private Set<SObjectField> lookupFields {
        get {
            if (lookupFields == null) {
                lookupFields = getLookupFields();
            }

            return lookupFields;
        }
        set;
    }

    public void execute() {
        if (!Trigger.isExecuting) {
            return;
        }

        delegate(Trigger.operationType);
        service.rollup(recordIdsByLookupField);
    }

    @TestVisible
    private void delegate(TriggerOperation operationType) {
        switch on operationType {
            when AFTER_DELETE {
                handleAfterDelete();
            }
            when AFTER_INSERT {
                handleAfterInsert();
            }
            when AFTER_UNDELETE {
                handleAfterUndelete();
            }
            when AFTER_UPDATE {
                handleAfterUpdate();
            }
            when else {
                return;
            }
        }
    }

    private void handleAfterDelete() {
        for (SObject record : Trigger.old) {
            extractRecordIdsToRecalculate(record, null);
        }
    }

    private void handleAfterInsert() {
        for (SObject record : Trigger.new) {
            extractRecordIdsToRecalculate(null, record);
        }
    }

    private void handleAfterUndelete() {
        for (SObject record : Trigger.new) {
            extractRecordIdsToRecalculate(null, record);
        }
    }

    private void handleAfterUpdate() {
        for (SObject record : Trigger.new) {
            extractRecordIdsToRecalculate(Trigger.oldMap.get(record.Id), record);
        }
    }

    @TestVisible
    private void extractRecordIdsToRecalculate(SObject oldRecord, SObject newRecord) {
        Object oldValue = oldRecord == null ? null : oldRecord.get(attendanceStatus);
        Object newValue = newRecord == null ? null : newRecord.get(attendanceStatus);

        if (oldValue == null && newValue == null) {
            return;
        }

        for (SObjectField lookupField : lookupFields) {
            Id oldParentId = (Id) (oldRecord == null ? null : oldRecord.get(lookupField));
            Id newParentId = (Id) (newRecord == null ? null : newRecord.get(lookupField));

            if (oldValue == newValue && oldParentId == newParentId) {
                continue;
            }

            Set<Id> recordIds = recordIdsByLookupField.get(lookupField);
            if (recordIds == null) {
                recordIds = new Set<Id>();
                recordIdsByLookupField.put(lookupField, recordIds);
            }

            if (oldParentId != null) {
                recordIds.add(oldParentId);
            }

            if (newParentId != null) {
                recordIds.add(newParentId);
            }
        }
    }

    private Set<SObjectField> getLookupFields() {
        Set<SObjectField> fields = new Set<SObjectField>();
        List<FeatureGate__mdt> features = FeatureGate__mdt.getAll().values();

        for (FeatureGate__mdt feature : features) {
            if (
                feature.IsActive__c &&
                LOOKUP_FIELD_BY_FEATURE.containsKey(feature.DeveloperName)
            ) {
                fields.add(LOOKUP_FIELD_BY_FEATURE.get(feature.DeveloperName));
            }
        }

        return fields;
    }
}
