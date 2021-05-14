public with sharing class ServiceDeliveryRollupsService {
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
    @TestVisible
    private SystemAccess systemAccess = new SystemAccess();
    @TestVisible
    private Map<Id, RollupRecord> rollupRecordById = new Map<Id, RollupRecord>();
    @TestVisible
    private Map<Id, RollupRecord> processedRecordsById = new Map<Id, RollupRecord>();
    private SObjectType sObjectType;
    private SObjectField lookupField;
    @TestVisible
    private Boolean isBatchRunning {
        get {
            if (isBatchRunning == null) {
                isBatchRunning = System.isBatch();
            }

            return isBatchRunning;
        }
        set;
    }

    public ServiceDeliveryRollupsService(
        SObjectType sObjectType,
        SObjectField lookupField
    ) {
        this.sObjectType = sObjectType;
        // TODO: Future iteration, it really isn't necessary to pass in the lookupField we can grab it from our map
        this.lookupField = lookupField;
    }

    public String getDeliveryRollupsQuery() {
        return systemAccess.getDeliveryRollupsQuery(String.valueOf(lookupField));
    }

    public void rollupDeliveryRecords(Set<Id> parentLookupIds) {
        List<ServiceDelivery__c> deliveries = systemAccess.getDeliveryRecordsToRollup(
            String.valueOf(lookupField),
            parentLookupIds
        );

        rollupDeliveryRecords(deliveries);
    }

    public void rollupDeliveryRecords(List<ServiceDelivery__c> deliveries) {
        if (deliveries.isEmpty()) {
            return;
        }

        trackCrossBatchRecordTotals(deliveries);

        for (ServiceDelivery__c delivery : deliveries) {
            Id parentLookupId = (Id) delivery.get(lookupField);

            if (!rollupRecordById.containsKey(parentLookupId)) {
                RollupRecord record = createRollupRecord(parentLookupId);
                rollupRecordById.put(parentLookupId, record);
            }

            RollupRecord parentRecord = rollupRecordById.get(parentLookupId);
            incrementRollup(delivery, parentRecord);
        }

        for (Id rollupRecordId : rollupRecordById.keySet()) {
            if (rollupRecordById.get(rollupRecordId).getIsProcessed()) {
                processedRecordsById.put(
                    rollupRecordId,
                    rollupRecordById.remove(rollupRecordId)
                );
            }
        }
    }

    public Set<Id> getProcessedRecordIds() {
        return processedRecordsById.keySet();
    }

    public void commitRollups() {
        List<SObject> recordsToUpdate = new List<SObject>();
        Set<Id> recordIds = processedRecordsById.keySet();
        List<String> selectFields = buildSelectFieldsForOriginalQuery();
        List<SObject> originalRecords = systemAccess.getRecordsById(
            sObjectType,
            recordIds,
            selectFields
        );

        for (SObject originalRecord : originalRecords) {
            RollupRecord record = processedRecordsById.remove(originalRecord.Id);

            if (record.isModified(originalRecord)) {
                SObject currentRecord = record.getSObject();
                recordsToUpdate.add(record.getSObject());
            }
        }

        systemAccess.updateRecords(recordsToUpdate);
    }

    public void resetParentsWithoutDeliveries(List<SObject> records) {
        Set<Id> recordIdsWithoutDeliveries = new Set<Id>();
        List<SObject> recordsWithDeliveries = systemAccess.getParentsWithDeliveries(
            sObjectType,
            String.valueOf(lookupField),
            records
        );
        Set<Id> recordIdsWithDeliveries = new Map<Id, SObject>(recordsWithDeliveries)
            .keySet();

        for (SObject record : records) {
            if (recordIdsWithDeliveries.contains(record.Id)) {
                continue;
            }

            recordIdsWithoutDeliveries.add(record.Id);
        }

        resetRollupFields(recordIdsWithoutDeliveries);
    }

    public void resetRollupFields(Set<Id> recordsIdsToReset) {
        if (recordsIdsToReset.isEmpty()) {
            return;
        }
        List<SObject> recordsToClearRollups = new List<SObject>();
        for (Id recordId : recordsIdsToReset) {
            RollupRecord record = createRollupRecord(recordId);
            recordsToClearRollups.add(record.getSObject());
        }
        systemAccess.updateRecords(recordsToClearRollups);
    }

    @TestVisible
    private List<String> buildSelectFieldsForOriginalQuery() {
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

        return selectFields;
    }

    @TestVisible
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
        record.incrementProcessed();

        if (deliveryService.presentStatuses.contains(delivery.AttendanceStatus__c)) {
            record.processPresent(delivery.DeliveryDate__c);
        } else if (
            deliveryService.absentStatuses.contains(delivery.AttendanceStatus__c)
        ) {
            record.processAbsent(delivery.DeliveryDate__c);
        }
        //Last Service Date
        if ((delivery.Quantity__c > 0 && delivery.DeliveryDate__c != null)) {
            record.processLastServiceDate(delivery.DeliveryDate__c);
        }
    }

    /**
     * A single parent record can span multiple batches and the batches
     * are not guaranteed to run sequentially. We use the total record count on records that could
     * span multiple batches to ensure all records are processed before we commit.
     *
     * "Batches of records tend to execute in the order in
     * which they’re received from the start method. However, the order in which batches of records
     * execute depends on various factors. The order of execution isn’t guaranteed."
     * https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_batch_interface.htm
     */
    @TestVisible
    private void trackCrossBatchRecordTotals(List<ServiceDelivery__c> deliveries) {
        if (!isBatchRunning) {
            return;
        }

        trackTotalRecords(deliveries[0]); // Track total of the first parent record
        trackTotalRecords(deliveries[deliveries.size() - 1]); // Track total of the last parent record
    }

    private void trackTotalRecords(ServiceDelivery__c delivery) {
        Id recordId = (Id) delivery.get(lookupField);
        if (rollupRecordById.containsKey(recordId)) {
            return;
        }

        RollupRecord record = createRollupRecord(recordId);
        Integer totalRecords = systemAccess.getDeliveryRollupsCount(
            String.valueOf(lookupField),
            recordId
        );
        record.setTotalRecords(totalRecords);
        rollupRecordById.put(recordId, record);
    }
}
