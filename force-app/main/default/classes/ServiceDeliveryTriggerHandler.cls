public with sharing class ServiceDeliveryTriggerHandler {
    Map<SObjectType, List<SObject>> sObjectsByType = new Map<SObjectType, List<SObject>>();
    Set<SObjectField> lookupFields = new Set<SObjectField>{
        ServiceDelivery__c.ServiceSession__c
    };
    Map<SObjectField, Set<Id>> recordIdsByLookupField = new Map<SObjectField, Set<Id>>();
    SObjectField attendanceStatus = ServiceDelivery__c.AttendanceStatus__c;
    AttendanceService service = new AttendanceService();

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

        service.calculateTotals(recordIdsByLookupField);
    }

    public void handleAfterDelete() {
        for (SObject record : Trigger.old) {
            extractRecordIdsToRecalculate(record, null);
        }
    }

    public void handleAfterInsert() {
        for (SObject record : Trigger.new) {
            extractRecordIdsToRecalculate(null, record);
        }
    }

    public void handleAfterUndelete() {
        for (SObject record : Trigger.new) {
            extractRecordIdsToRecalculate(null, record);
        }
    }

    public void handleAfterUpdate() {
        for (SObject record : Trigger.new) {
            extractRecordIdsToRecalculate(Trigger.oldMap.get(record.Id), record);
        }
    }

    private void extractRecordIdsToRecalculate(SObject oldRecord, SObject newRecord) {
        Object oldValue = oldRecord == null ? null : oldRecord.get(attendanceStatus);
        Object newValue = newRecord.get(attendanceStatus);

        if ((oldValue != newValue || newValue != null)) {
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
    }
}
