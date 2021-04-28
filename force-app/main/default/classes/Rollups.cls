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
    private Set<Id> unprocessedIds;
    Set<Id> idsInCurrentScope = new Set<Id>();
    private Map<Id, RollupRecord> uncommittedRecordsById = new Map<Id, RollupRecord>();
    private SObjectType sObjectType;
    private SObjectField lookupField;
    private List<String> presentStatuses = deliveryService.presentStatuses;
    private List<String> absentStatuses = deliveryService.absentStatuses;

    public List<String> attendanceStatuses {
        get {
            if (attendanceStatuses == null) {
                attendanceStatuses = new List<String>();
                attendanceStatuses.addAll(presentStatuses);
                attendanceStatuses.addAll(absentStatuses);
            }
            return attendanceStatuses;
        }
        set;
    }

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
            RollupRecord record = new RollupRecord(recordId);
            record.rollupFields(
                NUM_ABSENT_FIELD_BY_SOBJECT_TYPE.get(sObjectType),
                NUM_PRESENT_FIELD_BY_SOBJECT_TYPE.get(sObjectType),
                CONSECUTIVE_ABSENCES_FIELD_BY_SOBJECT_TYPE.get(sObjectType),
                LAST_SERVICE_DATE_FIELD_BY_SOBJECT_TYPE.get(sObjectType)
            );
            recordsToClearRollups.add(record.getSObject());
        }
        update recordsToClearRollups;
    }

    //Here we find out which records have been fully processed and update them
    //If they are no longer in the batch, they are ready to be updated
    private void commitPreviousScope(Set<Id> idsInCurrentScope) {
        Map<Id, RollupRecord> recordsToUpdateMap = new Map<Id, RollupRecord>();
        for (RollupRecord record : uncommittedRecordsById.values()) {
            if (!idsInCurrentScope.contains(record.recordId)) {
                recordsToUpdateMap.put(record.recordId, record);
                uncommittedRecordsById.remove(record.recordId);
                unprocessedIds.remove(record.recordId);
            }
        }
        commitUpdatedRecords(recordsToUpdateMap);
    }

    private void processParentRecord(ServiceDelivery__c delivery, Id parentLookupId) {
        if (!uncommittedRecordsById.containsKey(parentLookupId)) {
            RollupRecord record = new RollupRecord(parentLookupId);
            record.rollupFields(
                NUM_ABSENT_FIELD_BY_SOBJECT_TYPE.get(sObjectType),
                NUM_PRESENT_FIELD_BY_SOBJECT_TYPE.get(sObjectType),
                CONSECUTIVE_ABSENCES_FIELD_BY_SOBJECT_TYPE.get(sObjectType),
                LAST_SERVICE_DATE_FIELD_BY_SOBJECT_TYPE.get(sObjectType)
            );
            uncommittedRecordsById.put(parentLookupId, record);
        }

        RollupRecord parentRecord = uncommittedRecordsById.get(parentLookupId);
        processRecord(delivery, parentRecord);
    }

    private void processRecord(ServiceDelivery__c delivery, RollupRecord record) {
        if (presentStatuses.contains(delivery.AttendanceStatus__c)) {
            record.incrementPresentCount();
        } else if (absentStatuses.contains(delivery.AttendanceStatus__c)) {
            record.incrementAbsentCount();
        }
        //Last Service Date
        if ((delivery.Quantity__c > 0 && delivery.DeliveryDate__c != null)) {
            record.updateLastServiceDate(delivery.DeliveryDate__c);
        }
    }

    private void commitUpdatedRecords(Map<Id, RollupRecord> recordById) {
        List<SObject> recordsToUpdate = new List<SObject>();
        Set<Id> recordIds = recordById.keySet();
        String query = buildOriginalRecordsQuery();

        List<SObject> originalRecords = Database.query(query);

        for (SObject originalRecord : originalRecords) {
            RollupRecord record = recordById.get(originalRecord.Id);

            if (record.isModified(originalRecord)) {
                SObject currentRecord = record.getSObject();
                recordsToUpdate.add(record.getSObject());
            }
        }

        systemAccess.updateRecords(recordsToUpdate);
    }

    private String buildOriginalRecordsQuery() {
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
            .addCondition('Id IN :recordIds')
            .buildSoqlQuery();
    }

    public String buildDeliveryRollupsQuery() {
        return buildDeliveryRollupsQuery(null);
    }

    public String buildDeliveryRollupsQuery(Set<Id> recordIds) {
        String lookupCondition = recordIds == null
            ? lookupField + ' != null AND ('
            : lookupField + ' IN :recordIds AND (';

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
                lookupCondition +
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
}
