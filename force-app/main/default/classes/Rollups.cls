public with sharing class Rollups {
    private static final Map<SObjectType, SObjectField> NUM_PRESENT_FIELD_BY_SOBJECT_TYPE = new Map<SObjectType, SObjectField>{
        Service__c.SObjectType => Service__c.NumPresentServiceDeliveries__c,
        Contact.SObjectType => Contact.NumPresentServiceDeliveries__c,
        ServiceSession__c.SObjectType => ServiceSession__c.NumPresentServiceDeliveries__c,
        ProgramEngagement__c.SObjectType => ProgramEngagement__c.NumPresentServiceDeliveries__c
    };
    private static final Map<SObjectType, SObjectField> NUM_ABSENT_FIELD_BY_SOBJECT_TYPE = new Map<SObjectType, SObjectField>{
        Service__c.SObjectType => Service__c.NumAbsentServiceDeliveries__c,
        Contact.SObjectType => Contact.NumAbsentServiceDeliveries__c,
        ServiceSession__c.SObjectType => ServiceSession__c.NumAbsentServiceDeliveries__c,
        ProgramEngagement__c.SObjectType => ProgramEngagement__c.NumAbsentServiceDeliveries__c
    };
    private static final Map<SObjectType, SObjectField> CONSECUTIVE_ABSENCES_FIELD_BY_SOBJECT_TYPE = new Map<SObjectType, SObjectField>{
        Contact.SObjectType => Contact.ConsecutiveAbsences__c,
        ProgramEngagement__c.SObjectType => ProgramEngagement__c.ConsecutiveAbsences__c
    };
    private static final Map<SObjectType, SObjectField> LAST_SERVICE_DATE_FIELD_BY_SOBJECT_TYPE = new Map<SObjectType, SObjectField>{
        Contact.SObjectType => Contact.LastServiceDate__c,
        ProgramEngagement__c.SObjectType => ProgramEngagement__c.LastServiceDate__c
    };
    private static final Map<SObjectType, SObjectField> SERVICE_DELIVERY_LOOKUP_BY_PARENT_OBJECT = new Map<SObjectType, SObjectField>{
        Contact.SObjectType => ServiceDelivery__c.Contact__c,
        ProgramEngagement__c.SObjectType => ServiceDelivery__c.ProgramEngagement__c,
        ServiceSession__c.SObjectType => ServiceDelivery__c.ServiceSession__c,
        Service__c.SObjectType => ServiceDelivery__c.Service__c
    };

    private ServiceDeliveryService deliveryService = new ServiceDeliveryService();
    private SystemAccess systemAccess = new SystemAccess();
    private Map<Id, RollupRecord> rollupRecordById = new Map<Id, RollupRecord>();
    private SObjectType sObjectType;
    private SObjectField lookupField;

    public Rollups(SObjectType sObjectType, SObjectField lookupField) {
        this.sObjectType = sObjectType;
        this.lookupField = lookupField;
    }

    public Set<Id> getRollupRecordIds() {
        return rollupRecordById.keySet();
    }

    public Set<Id> rollupDeliveryRecords(List<ServiceDelivery__c> deliveries) {
        Set<Id> parentLookupIds = new Set<Id>();

        for (ServiceDelivery__c delivery : deliveries) {
            Id parentLookupId = (Id) delivery.get(lookupField);
            parentLookupIds.add(parentLookupId);

            if (!rollupRecordById.containsKey(parentLookupId)) {
                RollupRecord record = createRollupRecord(parentLookupId);
                rollupRecordById.put(parentLookupId, record);
            }

            RollupRecord parentRecord = rollupRecordById.get(parentLookupId);
            incrementRollup(delivery, parentRecord);
        }

        return parentLookupIds;
    }

    public void commitRollups() {
        commitRollups(rollupRecordById.keySet());
    }

    public void commitRollups(Set<Id> recordIds) {
        List<SObject> recordsToUpdate = new List<SObject>();
        String query = buildOriginalRecordsQuery('Id IN: recordIds');

        List<SObject> originalRecords = Database.query(query);

        for (SObject originalRecord : originalRecords) {
            RollupRecord record = rollupRecordById.remove(originalRecord.Id);

            if (record.isModified(originalRecord)) {
                SObject currentRecord = record.getSObject();
                recordsToUpdate.add(record.getSObject());
            }
        }

        systemAccess.updateRecords(recordsToUpdate);
    }

    public void resetRollupFields(Set<Id> recordsIdsToReset) {
        if (recordsIdsToReset.isEmpty()) {
            return;
        }
        // What remains in recordsIdsToReset are records that need to be reset.
        // They once had rollup data but no longer do.
        List<SObject> recordsToClearRollups = new List<SObject>();
        for (Id recordId : recordsIdsToReset) {
            // TODO: Investigate whether or not we need to recreate these records every batch run
            // TODO: Total number of batches 250,000 per 24 hours -> is this a namespace limit?
            RollupRecord record = createRollupRecord(recordId);
            recordsToClearRollups.add(record.getSObject());
        }
        systemAccess.updateRecords(recordsToClearRollups);
    }

    private RollupRecord createRollupRecord(Id recordId) {
        RollupRecord record = new RollupRecord(recordId);
        record.rollupFields(
            NUM_ABSENT_FIELD_BY_SOBJECT_TYPE.get(sObjectType),
            NUM_PRESENT_FIELD_BY_SOBJECT_TYPE.get(sObjectType),
            CONSECUTIVE_ABSENCES_FIELD_BY_SOBJECT_TYPE.get(sObjectType),
            LAST_SERVICE_DATE_FIELD_BY_SOBJECT_TYPE.get(sObjectType)
        );

        return record;
    }

    private void incrementRollup(ServiceDelivery__c delivery, RollupRecord record) {
        if (deliveryService.presentStatuses.contains(delivery.AttendanceStatus__c)) {
            record.incrementPresentCount();
        } else if (
            deliveryService.absentStatuses.contains(delivery.AttendanceStatus__c)
        ) {
            record.incrementAbsentCount();
        }
        //Last Service Date
        if ((delivery.Quantity__c > 0 && delivery.DeliveryDate__c != null)) {
            record.updateLastServiceDate(delivery.DeliveryDate__c);
        }
    }

    private String buildOriginalRecordsQuery(String condition) {
        List<String> selectFields = new List<String>();
        SObjectField numPresentField = NUM_PRESENT_FIELD_BY_SOBJECT_TYPE.get(sObjectType);
        SObjectField numAbsentField = NUM_ABSENT_FIELD_BY_SOBJECT_TYPE.get(sObjectType);
        SObjectField consecutiveAbsencesField = CONSECUTIVE_ABSENCES_FIELD_BY_SOBJECT_TYPE.get(
            sObjectType
        );
        SObjectField lastServiceDateField = LAST_SERVICE_DATE_FIELD_BY_SOBJECT_TYPE.get(
            sObjectType
        );

        if (numPresentField != null) {
            selectFields.add(String.valueOf(numPresentField));
        }
        if (numAbsentField != null) {
            selectFields.add(String.valueOf(numAbsentField));
        }
        if (consecutiveAbsencesField != null) {
            selectFields.add(String.valueOf(consecutiveAbsencesField));
        }
        if (lastServiceDateField != null) {
            selectFields.add(String.valueOf(lastServiceDateField));
        }

        return new QueryBuilder()
            .withSObjectType(sObjectType)
            .withSelectFields(selectFields)
            .addCondition(condition)
            .buildSoqlQuery();
    }
}
