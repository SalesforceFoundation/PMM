public with sharing class ServiceDeliveryTriggerHandler {
    private static Map<String, SObjectField> LOOKUP_FIELD_BY_FEATURE = new Map<String, SObjectField>{
        'AttendanceToServiceSession' => ServiceDelivery__c.ServiceSession__c
    };
    private Map<SObjectType, List<SObject>> sObjectsByType = new Map<SObjectType, List<SObject>>();
    private Set<SObjectField> lookupFields {
        get {
            if (lookupFields == null) {
                lookupFields = retrieveLookupFields();
            }

            return lookupFields;
        }
        set;
    }
    private Map<SObjectField, Set<Id>> recordIdsByLookupField = new Map<SObjectField, Set<Id>>();
    private SObjectField attendanceStatus = ServiceDelivery__c.AttendanceStatus__c;
    private AttendanceService service = new AttendanceService();

    public void execute() {
        if (!Trigger.isExecuting) {
            return;
        }

        switch on Trigger.operationType {
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

        service.rollup(recordIdsByLookupField);
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

    private void extractRecordIdsToRecalculate(SObject oldRecord, SObject newRecord) {
        Object oldValue = oldRecord == null ? null : oldRecord.get(attendanceStatus);
        Object newValue = newRecord.get(attendanceStatus);

        if (oldValue == newValue) {
            return;
        }

        for (SObjectField lookupField : lookupFields) {
            Id oldId = (Id) (oldRecord == null ? null : oldRecord.get(lookupField));
            Id newId = (Id) newRecord.get(lookupField);

            if (oldValue == newValue && oldId == newId) {
                continue;
            }

            Set<Id> recordIds = recordIdsByLookupField.get(lookupField);
            if (recordIds == null) {
                recordIds = new Set<Id>();
                recordIdsByLookupField.put(lookupField, recordIds);
            }

            if (oldId != null) {
                recordIds.add(oldId);
            }

            if (newId != null) {
                recordIds.add(newId);
            }
        }
    }

    private Set<SObjectField> retrieveLookupFields() {
        Set<SObjectField> fields = new Set<SObjectField>();
        List<FeatureGate__mdt> features = [
            SELECT DeveloperName
            FROM FeatureGate__mdt
            WHERE DeveloperName LIKE 'Attendance%' AND IsActive__c = TRUE
        ];

        for (FeatureGate__mdt feature : features) {
            System.debug(feature.DeveloperName);
            if (LOOKUP_FIELD_BY_FEATURE.containsKey(feature.DeveloperName)) {
                fields.add(LOOKUP_FIELD_BY_FEATURE.get(feature.DeveloperName));
            }
        }

        return fields;
    }
}
