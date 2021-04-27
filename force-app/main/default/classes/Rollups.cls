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

    private AttendanceService attendanceService = new AttendanceService();
    private SystemAccess systemAccess = new SystemAccess();
    private Set<Id> unprocessedIds;
    Set<Id> idsInCurrentScope = new Set<Id>();
    private Map<Id, SObject> uncommittedRecordsById = new Map<Id, SObject>();
    private SObjectType sObjectType;
    SObjectField lookupField;
    SObjectField numPresentField = NUM_PRESENT_FIELD_BY_SOBJECT_TYPE.get(sObjectType);
    SObjectField numAbsentField = NUM_ABSENT_FIELD_BY_SOBJECT_TYPE.get(sObjectType);
    SObjectField consecutiveAbsencesField = CONSECUTIVE_ABSENCES_FIELD_BY_SOBJECT_TYPE.get(
        sObjectType
    );
    SObjectField lastServiceDateField = SERVICE_DELIVERY_LOOKUP_BY_PARENT_OBJECT.get(
        sObjectType
    );
    private List<String> presentStatuses = attendanceService.presentStatuses;
    private List<String> absentStatuses = attendanceService.absentStatuses;
    public List<String> attendanceStatuses = attendanceService.getAttendanceStatuses();

    public Rollups(
        SObjectType sObjectType,
        SObjectField lookupField,
        Set<Id> unprocessedIds
    ) {
        this.sObjectType = sObjectType;
        this.lookupField = lookupField;
        this.unprocessedIds = unprocessedIds;
    }

    public void rollupDeliveryRecords(List<ServiceDelivery__c> deliveries) {
        for (ServiceDelivery__c delivery : deliveries) {
            Id parentLookupId = (Id) delivery.get(lookupField);
            idsInCurrentScope.add(parentLookupId);
            processParentRecord(delivery, parentLookupId);
        }

        commitPreviousScope(idsInCurrentScope);
    }

    public void commitFinalRecords() {
        //Update the records processed by the last batch
        commitUpdatedRecords(uncommittedRecordsById);

        //Remove ids processed in the last batch
        unprocessedIds.removeAll(uncommittedRecordsById.keySet());
    }

    public void resetUnprocessedRecords() {
        // What remains in unprocessedIds are records that need to be reset.
        // They once had rollup data but no longer do.
        List<SObject> recordsToClearRollups = new List<SObject>();
        for (Id recordId : unprocessedIds) {
            // TODO: Investigate whether or not we need to recreate these records every batch run
            // TODO: Total number of batches 250,000 per 24 hours -> is this a namespace limit?
            recordsToClearRollups.add(constructNewRecord(recordId));
        }
        update recordsToClearRollups;
    }

    //Here we find out which records have been fully processed and update them
    //If they are no longer in the batch, they are ready to be updated
    private void commitPreviousScope(Set<Id> idsInCurrentScope) {
        Map<Id, SObject> recordsToUpdateMap = new Map<Id, SObject>();
        for (SObject record : uncommittedRecordsById.values()) {
            if (!idsInCurrentScope.contains(record.Id)) {
                recordsToUpdateMap.put(record.Id, record);
                uncommittedRecordsById.remove(record.Id);
                unprocessedIds.remove(record.Id);
            }
        }
        commitUpdatedRecords(recordsToUpdateMap);
    }

    private void processParentRecord(ServiceDelivery__c delivery, Id parentLookupId) {
        if (!uncommittedRecordsById.containsKey(parentLookupId)) {
            uncommittedRecordsById.put(
                parentLookupId,
                constructNewRecord(parentLookupId)
            );
        }

        SObject parentRecord = uncommittedRecordsById.get(parentLookupId);
        parentRecord = processRecord(delivery, parentRecord);
    }

    private SObject processRecord(ServiceDelivery__c delivery, SObject record) {
        if (
            numPresentField != null &&
            presentStatuses.contains(delivery.AttendanceStatus__c)
        ) {
            Integer presentCount = (Integer) record.get(numPresentField);
            presentCount = (presentCount == null ? 1 : presentCount + 1);
            record.put(numPresentField, presentCount);
            record.put(consecutiveAbsencesField, 0);
        } else if (
            numAbsentField != null &&
            absentStatuses.contains(delivery.AttendanceStatus__c)
        ) {
            Integer absentCount = (Integer) record.get(numAbsentField);
            absentCount = (absentCount == null ? 1 : absentCount + 1);
            record.put(numAbsentField, absentCount);
            if (consecutiveAbsencesField != null) {
                Integer consecutiveCount = (Integer) record.get(consecutiveAbsencesField);
                record.put(
                    consecutiveAbsencesField,
                    (consecutiveCount == null ? 1 : consecutiveCount + 1)
                );
            }
        }
        //Last Service Date
        if (
            lastServiceDateField != null &&
            (delivery.Quantity__c > 0 &&
            delivery.DeliveryDate__c != null)
        ) {
            Date lastServiceDate = (Date) record.get(lastServiceDateField);
            if (lastServiceDate == null || delivery.DeliveryDate__c > lastServiceDate) {
                record.put(lastServiceDateField, delivery.DeliveryDate__c);
            }
        }
        return record;
    }

    public SObject constructNewRecord(Id recordId) {
        SObject record = sObjectType.newSObject(recordId);

        if (numPresentField != null) {
            record.put(numPresentField, null);
        }

        if (numAbsentField != null) {
            record.put(numAbsentField, null);
        }

        if (consecutiveAbsencesField != null) {
            record.put(consecutiveAbsencesField, null);
        }

        if (lastServiceDateField != null) {
            record.put(lastServiceDateField, null);
        }

        return record;
    }

    private void commitUpdatedRecords(Map<Id, SObject> recordById) {
        List<SObject> recordsToUpdate = new List<SObject>();
        Set<Id> recordIds = recordById.keySet();
        String query = buildOriginalRecordsQuery();

        List<SObject> originalRecords = Database.query(query);

        for (SObject originalRecord : originalRecords) {
            SObject currentRecord = recordById.get(originalRecord.Id);

            if (hasRecordChanged(originalRecord, currentRecord)) {
                recordsToUpdate.add(currentRecord);
            }
        }
        systemAccess.updateRecords(recordsToUpdate);
    }

    private Boolean hasRecordChanged(SObject originalRecord, SObject currentRecord) {
        Boolean shouldUpdateRecord = false;
        if (
            numPresentField != null &&
            originalRecord.get(numPresentField) != currentRecord.get(numPresentField)
        ) {
            shouldUpdateRecord = true;
        }

        if (
            numAbsentField != null &&
            originalRecord.get(numAbsentField) != currentRecord.get(numAbsentField)
        ) {
            shouldUpdateRecord = true;
        }

        if (
            consecutiveAbsencesField != null &&
            originalRecord.get(consecutiveAbsencesField) !=
            currentRecord.get(consecutiveAbsencesField)
        ) {
            shouldUpdateRecord = true;
        }

        if (
            lastServiceDateField != null &&
            originalRecord.get(lastServiceDateField) !=
            currentRecord.get(lastServiceDateField)
        ) {
            shouldUpdateRecord = true;
        }

        return shouldUpdateRecord;
    }

    public String buildDeliveryRollupsQuery() {
        QueryBuilder serviceDeliveryQueryBuilder = new QueryBuilder()
            .withSObjectType(ServiceDelivery__c.SObjectType)
            .withSelectFields(
                new List<String>{
                    String.valueOf(ServiceDelivery__c.AttendanceStatus__c),
                    String.valueOf(ServiceDelivery__c.DeliveryDate__c),
                    String.valueOf(lookupField),
                    String.valueOf(ServiceDelivery__c.Quantity__c)
                }
            )
            .addCondition(
                lookupField +
                ' != null AND (' +
                String.valueOf(ServiceDelivery__c.AttendanceStatus__c) +
                ' IN :attendanceStatuses OR ( ' +
                String.valueOF(ServiceDelivery__c.Quantity__c) +
                ' > 0 AND ' +
                String.valueOf(ServiceDelivery__c.DeliveryDate__c) +
                ' != null ))'
            )
            .withOrderBy(
                lookupField +
                ', ' +
                String.valueOf(ServiceDelivery__c.DeliveryDate__c) +
                ' ASC '
            );
        return serviceDeliveryQueryBuilder.buildSoqlQuery();
    }

    private String buildOriginalRecordsQuery() {
        List<String> selectFields = new List<String>();
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
            .addCondition('Id IN :recordIds')
            .buildSoqlQuery();
    }
}
