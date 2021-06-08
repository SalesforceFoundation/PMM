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
    private static Map<String, SObjectField> LOOKUP_FIELD_BY_FEATURE = new Map<String, SObjectField>{
        'ServiceDeliveriesToContact' => ServiceDelivery__c.Contact__c,
        'ServiceDeliveriesToService' => ServiceDelivery__c.Service__c,
        'ServiceDeliveriesToServiceSession' => ServiceDelivery__c.ServiceSession__c,
        'ServiceDeliveriesToProgramEngagement' => ServiceDelivery__c.ProgramEngagement__c
    };

    @TestVisible
    private SystemAccess systemAccess = new SystemAccess();
    private Map<SObjectField, Set<Id>> recordIdsByLookupField = new Map<SObjectField, Set<Id>>{
        ServiceDelivery__c.Contact__c => new Set<Id>(),
        ServiceDelivery__c.Service__c => new Set<Id>(),
        ServiceDelivery__c.ServiceSession__c => new Set<Id>(),
        ServiceDelivery__c.ProgramEngagement__c => new Set<Id>()
    };
    @TestVisible
    private Map<Id, RollupRecord> rollupRecordById = new Map<Id, RollupRecord>();
    @TestVisible
    private Map<Id, RollupRecord> processedRecordsById = new Map<Id, RollupRecord>();
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

    public void processInserted(List<ServiceDelivery__c> deliveries) {
        process(deliveries, true);
    }

    public void processDeleted(List<ServiceDelivery__c> deliveries) {
        process(deliveries, false);
    }

    public void processUpdated(
        Map<Id, SObject> originalDeliveryById,
        List<ServiceDelivery__c> deliveries
    ) {
        Set<SObjectField> activeRollupFields = getActiveRollupFields();
        if (activeRollupFields.isEmpty()) {
            return;
        }

        for (ServiceDelivery__c record : deliveries) {
            ServiceDelivery delivery = new ServiceDelivery(record);
            ServiceDelivery originalDelivery = new ServiceDelivery(
                (ServiceDelivery__c) originalDeliveryById.get(delivery.getId())
            );
            Boolean rollupFieldChanged =
                delivery.isAbsent() != originalDelivery.isAbsent() ||
                delivery.isPresent() != originalDelivery.isPresent() ||
                delivery.isDelivered() != originalDelivery.isDelivered();

            for (
                SObjectType parentObject : SERVICE_DELIVERY_LOOKUP_BY_PARENT_OBJECT.keySet()
            ) {
                SObjectField parentLookup = SERVICE_DELIVERY_LOOKUP_BY_PARENT_OBJECT.get(
                    parentObject
                );
                if (!activeRollupFields.contains(parentLookup)) {
                    continue;
                }

                Id parentLookupId = delivery.getLookupId(parentLookup);
                Id originalParentLookupId = originalDelivery.getLookupId(parentLookup);
                Boolean parentLookupIdChanged =
                    parentLookupId != originalParentLookupId &&
                    (delivery.isAbsent() ||
                    delivery.isPresent() ||
                    delivery.isDelivered());

                // We can skip this record if the lookup id did not change on a rollup
                // record or if the rollup fields themselves have not changed. We cannot
                // bail in the outer for loop because we also need to check the potential
                // change of parent ids
                if (
                    parentLookupId == null && originalParentLookupId == null ||
                    (!rollupFieldChanged && !parentLookupIdChanged)
                ) {
                    continue;
                }

                // When the parent lookup id is changed, we treat the record as a new service
                // delivery rollup record
                if (parentLookupIdChanged) {
                    if (parentLookupId != null) {
                        recordIdsByLookupField.get(parentLookup).add(parentLookupId);
                        if (!rollupRecordById.containsKey(parentLookupId)) {
                            RollupRecord rollupRecord = createRollupRecord(
                                parentLookupId,
                                parentObject
                            );
                            rollupRecordById.put(parentLookupId, rollupRecord);
                        }

                        RollupRecord parentRecord = rollupRecordById.get(parentLookupId);
                        parentRecord.addDelivery(delivery);
                    }
                    if (originalParentLookupId != null) {
                        recordIdsByLookupField.get(parentLookup)
                            .add(originalParentLookupId);
                        if (!rollupRecordById.containsKey(originalParentLookupId)) {
                            RollupRecord rollupRecord = createRollupRecord(
                                originalParentLookupId,
                                parentObject
                            );
                            rollupRecordById.put(originalParentLookupId, rollupRecord);
                        }

                        RollupRecord parentRecord = rollupRecordById.get(
                            originalParentLookupId
                        );
                        parentRecord.addOriginalDelivery(delivery);
                    }
                } else {
                    recordIdsByLookupField.get(parentLookup).add(parentLookupId);
                    if (!rollupRecordById.containsKey(parentLookupId)) {
                        RollupRecord parentRecord = createRollupRecord(
                            parentLookupId,
                            parentObject
                        );
                        rollupRecordById.put(parentLookupId, parentRecord);
                    }

                    RollupRecord parentRecord = rollupRecordById.get(parentLookupId);
                    parentRecord.addDelivery(delivery);
                    parentRecord.addOriginalDelivery(originalDelivery);
                }
            }
        }

        processChanges();
    }

    public String getDeliveryRollupsQuery(SObjectType sObjectType) {
        SObjectField lookupField = SERVICE_DELIVERY_LOOKUP_BY_PARENT_OBJECT.get(
            sObjectType
        );
        return systemAccess.getDeliveryRollupsQuery(String.valueOf(lookupField));
    }

    public void rollupDeliveryRecords(
        SObjectType sObjectType,
        List<ServiceDelivery__c> deliveries
    ) {
        if (deliveries.isEmpty()) {
            return;
        }

        SObjectField lookupField = SERVICE_DELIVERY_LOOKUP_BY_PARENT_OBJECT.get(
            sObjectType
        );
        trackCrossBatchRecordTotals(deliveries, lookupField);

        for (ServiceDelivery__c record : deliveries) {
            ServiceDelivery delivery = new ServiceDelivery(record);
            Id parentLookupId = delivery.getLookupId(lookupField);

            if (!rollupRecordById.containsKey(parentLookupId)) {
                RollupRecord rollupRecord = createRollupRecord(parentLookupId);
                rollupRecordById.put(parentLookupId, rollupRecord);
            }

            RollupRecord parentRecord = rollupRecordById.get(parentLookupId);
            parentRecord.process(delivery);
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

    public void commitRollups(SObjectType sObjectType) {
        List<SObject> recordsToUpdate = new List<SObject>();
        Set<Id> recordIds = processedRecordsById.keySet();
        List<String> selectFields = buildSelectFieldsForOriginalQuery(sObjectType);
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
        if (records.isEmpty()) {
            return;
        }
        SObjectType sObjectType = records[0].getSObjectType();
        SObjectField lookupField = SERVICE_DELIVERY_LOOKUP_BY_PARENT_OBJECT.get(
            sObjectType
        );
        Set<Id> recordIdsWithoutDeliveries = new Set<Id>();
        List<SObject> recordsWithDeliveries = systemAccess.getParentsHavingDeliveries(
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

    private Set<SObjectField> getActiveRollupFields() {
        Set<SObjectField> fields = new Set<SObjectField>();
        List<FeatureGate__mdt> features = CustomMetadataSelector.getInstance()
            .getAllFeatureGates();

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

    private String getChildRelationshipName(SObjectType sObjectType) {
        String childRelationshipName;
        for (
            ChildRelationship relation : sObjectType.getDescribe().getChildRelationships()
        ) {
            if (relation.getChildSObject() == ServiceDelivery__c.SObjectType) {
                childRelationshipName = relation.getRelationshipName();
                break;
            }
        }

        return childRelationshipName;
    }

    private void process(List<ServiceDelivery__c> deliveries, Boolean isNew) {
        Set<SObjectField> activeRollupFields = getActiveRollupFields();
        if (activeRollupFields.isEmpty()) {
            return;
        }
        for (ServiceDelivery__c record : deliveries) {
            ServiceDelivery delivery = new ServiceDelivery(record);

            if (
                !delivery.isPresent() &&
                !delivery.isAbsent() &&
                !delivery.isDelivered()
            ) {
                continue;
            }

            for (
                SObjectType parentObject : SERVICE_DELIVERY_LOOKUP_BY_PARENT_OBJECT.keySet()
            ) {
                SObjectField parentLookup = SERVICE_DELIVERY_LOOKUP_BY_PARENT_OBJECT.get(
                    parentObject
                );
                if (!activeRollupFields.contains(parentLookup)) {
                    continue;
                }
                Id parentLookupId = delivery.getLookupId(parentLookup);
                if (parentLookupId == null) {
                    continue;
                }
                recordIdsByLookupField.get(parentLookup).add(parentLookupId);
                if (!rollupRecordById.containsKey(parentLookupId)) {
                    RollupRecord rollupRecord = createRollupRecord(
                        parentLookupId,
                        parentObject
                    );
                    rollupRecordById.put(parentLookupId, rollupRecord);
                }

                RollupRecord parentRecord = rollupRecordById.get(parentLookupId);
                if (isNew) {
                    parentRecord.addDelivery(delivery);
                } else {
                    parentRecord.addOriginalDelivery(delivery);
                }
            }
        }
        processChanges();
    }

    private void processChanges() {
        for (
            SObjectType parentObject : SERVICE_DELIVERY_LOOKUP_BY_PARENT_OBJECT.keySet()
        ) {
            SObjectField parentLookup = SERVICE_DELIVERY_LOOKUP_BY_PARENT_OBJECT.get(
                parentObject
            );
            Set<Id> recordIds = recordIdsByLookupField.get(parentLookup);
            if (recordIds.isEmpty()) {
                continue;
            }

            List<SObject> parentRecords = new List<SObject>();
            String childRelationshipName = getChildRelationshipName(parentObject);
            Boolean shouldIncludeDeliveries =
                LAST_SERVICE_DATE_FIELD_BY_SOBJECT_TYPE.containsKey(parentObject) ||
                CONSECUTIVE_ABSENCES_FIELD_BY_SOBJECT_TYPE.containsKey(parentObject);
            for (
                SObject record : systemAccess.getRecordsById(
                    parentObject,
                    recordIds,
                    buildSelectFieldsForOriginalQuery(parentObject),
                    shouldIncludeDeliveries ? childRelationshipName : null
                )
            ) {
                RollupRecord rollupRecord = rollupRecordById.get(record.Id);
                rollupRecord.initialize(record, childRelationshipName);
                rollupRecord.process();
                parentRecords.add(rollupRecord.getSObject());
            }

            systemAccess.updateRecords(parentRecords);
        }
    }

    @TestVisible
    private List<String> buildSelectFieldsForOriginalQuery(SObjectType sObjectType) {
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

    private RollupRecord createRollupRecord(Id recordId, SObjectType sObjectType) {
        RollupRecord record = new RollupRecord(recordId);
        record.rollupFields(
            NUM_ABSENT_FIELD_BY_SOBJECT_TYPE.get(sObjectType),
            NUM_PRESENT_FIELD_BY_SOBJECT_TYPE.get(sObjectType),
            CONSECUTIVE_ABSENCES_FIELD_BY_SOBJECT_TYPE.get(sObjectType),
            LAST_SERVICE_DATE_FIELD_BY_SOBJECT_TYPE.get(sObjectType)
        );

        return record;
    }

    @TestVisible
    private RollupRecord createRollupRecord(Id recordId) {
        return createRollupRecord(recordId, recordId.getSObjectType());
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
    private void trackCrossBatchRecordTotals(
        List<ServiceDelivery__c> deliveries,
        SObjectField lookupField
    ) {
        trackTotalRecords(deliveries[0], lookupField); // Track total of the first parent record
        trackTotalRecords(deliveries[deliveries.size() - 1], lookupField); // Track total of the last parent record
    }

    private void trackTotalRecords(
        ServiceDelivery__c delivery,
        SObjectField lookupField
    ) {
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
