/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class AttendanceService {
    @TestVisible
    private AttendanceSelector attendanceSelector = new AttendanceSelector();
    @TestVisible
    private ServiceDeliveryDomain domain = new ServiceDeliveryDomain();
    @TestVisible
    private SystemAccess systemAccess = new SystemAccess();

    private static final String DEFAULT_STATUS = 'Present';
    private static final Map<SObjectField, SObjectField> TOTAL_PRESENT_FIELD_BY_LOOKUP_FIELD = new Map<SObjectField, SObjectField>{
        ServiceDelivery__c.Service__c => Service__c.NumPresentServiceDeliveries__c,
        ServiceDelivery__c.Contact__c => Contact.NumPresentServiceDeliveries__c,
        ServiceDelivery__c.ServiceSession__c => ServiceSession__c.NumPresentServiceDeliveries__c,
        ServiceDelivery__c.ProgramEngagement__c => ProgramEngagement__c.NumPresentServiceDeliveries__c
    };
    private static final Map<SObjectField, SObjectField> TOTAL_ABSENT_FIELD_BY_LOOKUP_FIELD = new Map<SObjectField, SObjectField>{
        ServiceDelivery__c.Service__c => Service__c.NumAbsentServiceDeliveries__c,
        ServiceDelivery__c.Contact__c => Contact.NumAbsentServiceDeliveries__c,
        ServiceDelivery__c.ServiceSession__c => ServiceSession__c.NumAbsentServiceDeliveries__c,
        ServiceDelivery__c.ProgramEngagement__c => ProgramEngagement__c.NumAbsentServiceDeliveries__c
    };
    private static final Map<SObjectField, SObjectField> CONSECUTIVE_ABSENCES_FIELD_BY_LOOKUP_FIELD = new Map<SObjectField, SObjectField>{
        ServiceDelivery__c.Contact__c => Contact.ConsecutiveAbsences__c,
        ServiceDelivery__c.ProgramEngagement__c => ProgramEngagement__c.ConsecutiveAbsences__c
    };
    private static final Map<SObjectField, SObjectField> LAST_SERVICE_DATE_FIELD_BY_LOOKUP_FIELD = new Map<SObjectField, SObjectField>{
        ServiceDelivery__c.Contact__c => Contact.LastServiceDate__c,
        ServiceDelivery__c.ProgramEngagement__c => ProgramEngagement__c.LastServiceDate__c
    };
    private static final Map<SObjectType, SObjectField> SERVICE_DELIVERY_LOOKUP_BY_PARENT_OBJECT = new Map<SObjectType, SObjectField>{
        Contact.SObjectType => ServiceDelivery__c.Contact__c,
        ProgramEngagement__c.SObjectType => ServiceDelivery__c.ProgramEngagement__c,
        ServiceSession__c.SObjectType => ServiceDelivery__c.ServiceSession__c,
        Service__c.SObjectType => ServiceDelivery__c.Service__c
    };
    private final SObjectField DELIVERY_DATE = ServiceDelivery__c.DeliveryDate__c;
    private Map<Id, SObject> rollupTargetObjectById = new Map<Id, SObject>();

    // While we allow the Attendance UI and the ultimate saved Service Delivery records
    // to be driven by a field set, the mapping from Service Participants to the seeded
    // Service Deliveries that appear in the Attendance UI is hard-coded here.
    // We could, in the future, allow this to be driven by design parameters or CMDT.
    // It is a heavy lift for questionable value. (Is there a use case for mapping additional
    // information from Participant to Attendance Service Delivery?)
    private static final Map<SObjectField, SObjectField> SERVICE_FIELD_BY_PARTICIPANT_FIELD = new Map<SObjectField, SObjectField>{
        ServiceParticipant__c.Contact__c => ServiceDelivery__c.Contact__c,
        ServiceParticipant__c.ProgramEngagement__c => ServiceDelivery__c.ProgramEngagement__c
    };

    @TestVisible
    private Map<String, List<String>> statusBuckets {
        get {
            if (statusBuckets == null) {
                statusBuckets = getStatusBuckets();
            }
            return statusBuckets;
        }
        set;
    }

    private List<String> presentStatuses {
        get {
            return statusBuckets.get('Present');
        }
        set;
    }

    private List<String> absentStatuses {
        get {
            return statusBuckets.get('Absent');
        }
        set;
    }

    private List<String> attendanceStatuses;

    public List<String> getAttendanceStatuses() {
        if (attendanceStatuses == null) {
            attendanceStatuses = new List<String>();
            attendanceStatuses.addAll(presentStatuses);
            attendanceStatuses.addAll(absentStatuses);
        }
        return attendanceStatuses;
    }

    public Map<SObjectType, String> relationshipNameBySObjectType {
        get {
            if (relationshipNameBySObjectType == null) {
                String relationshipName;
                relationshipNameBySObjectType = new Map<SObjectType, String>();
                for (
                    SObjectType sObjectType : SERVICE_DELIVERY_LOOKUP_BY_PARENT_OBJECT.keySet()
                ) {
                    SObjectField lookupFieldOnDelivery = SERVICE_DELIVERY_LOOKUP_BY_PARENT_OBJECT.get(
                        sObjectType
                    );
                    for (
                        ChildRelationship child : sObjectType.getDescribe()
                            .getChildRelationships()
                    ) {
                        if (child.getField() == lookupFieldOnDelivery) {
                            relationshipName = child.getRelationshipName();
                            break;
                        }
                    }
                    relationshipNameBySObjectType.put(sObjectType, relationshipName);
                }
            }
            return relationshipNameBySObjectType;
        }
        set;
    }

    public List<ServiceDelivery__c> generateRoster(Id sessionId) {
        return createRows(sessionId);
    }

    public void upsertServiceDeliveries(
        List<ServiceDelivery__c> serviceDeliveriesToUpsert
    ) {
        Savepoint savepoint = Database.setSavepoint();
        try {
            domain.upsertServiceDeliveries(serviceDeliveriesToUpsert);
        } catch (Exception ex) {
            Database.rollback(savepoint);
            throw new ServiceDeliveryException(ex);
        }
    }

    public void doRollups(List<SObject> parents) {
        rollupAttendance(parents);
        rollupLastServiceDate(parents);
        // TODO: iterate parents, key into rollupTargetObejctById with the id, compare the sObject to see if it needs update.
        systemAccess.updateRecords(rollupTargetObjectById.values());
    }

    public void doRollups(
        Map<SObjectField, Set<Id>> attendanceMap,
        Map<SObjectField, Set<Id>> lastServiceDateMap
    ) {
        rollupAttendance(attendanceMap);
        rollupLastServiceDate(lastServiceDateMap);
        systemAccess.updateRecords(rollupTargetObjectById.values());
    }

    @TestVisible
    private void rollupAttendance(List<SObject> parents) {
        Set<Id> consecutiveAbsencesCountComplete = new Set<Id>();
        SObjectType objectType = parents[0].Id.getSObjectType();
        SObjectField lookupFieldOnDelivery = SERVICE_DELIVERY_LOOKUP_BY_PARENT_OBJECT.get(
            objectType
        );

        addDefaultTargetObjectsForAttendance(parents);

        for (SObject parent : parents) {
            for (
                ServiceDelivery__c delivery : (List<ServiceDelivery__c>) parent.getSObjects(
                    relationshipNameBySObjectType.get(objectType)
                )
            ) {
                calculateAttendanceRollups(
                    delivery,
                    lookupFieldOnDelivery,
                    consecutiveAbsencesCountComplete
                );
            }
        }
    }

    @TestVisible
    private void rollupAttendance(Map<SObjectField, Set<Id>> idsByLookupFieldToTarget) {
        Set<Id> consecutiveAbsencesCountComplete = new Set<Id>();
        if (idsByLookupFieldToTarget == null || idsByLookupFieldToTarget.isEmpty()) {
            return;
        }

        for (SObjectField lookupFieldOnDelivery : idsByLookupFieldToTarget.keySet()) {
            if (idsByLookupFieldToTarget.get(lookupFieldOnDelivery).isEmpty()) {
                continue;
            }

            addDefaultTargetObjectsForAttendance(
                lookupFieldOnDelivery,
                idsByLookupFieldToTarget.get(lookupFieldOnDelivery)
            );

            List<String> attendanceStatuses = getAttendanceStatuses();

            for (
                ServiceDelivery__c delivery : systemAccess.getAttendanceRecords(
                    lookupFieldOnDelivery,
                    idsByLookupFieldToTarget.get(lookupFieldOnDelivery),
                    attendanceStatuses
                )
            ) {
                calculateAttendanceRollups(
                    delivery,
                    lookupFieldOnDelivery,
                    consecutiveAbsencesCountComplete
                );
            }
        }
    }

    private void calculateAttendanceRollups(
        ServiceDelivery__c delivery,
        SObjectField lookupFieldOnDelivery,
        Set<Id> consecutiveAbsencesCountComplete
    ) {
        Id targetId = (Id) delivery.get(lookupFieldOnDelivery);
        if (targetId == null) {
            return;
        }
        SObject targetObject = rollupTargetObjectById.get(targetId);
        SObjectField rollupField;
        SObjectField consecutiveAbsencesField = CONSECUTIVE_ABSENCES_FIELD_BY_LOOKUP_FIELD.get(
            lookupFieldOnDelivery
        );
        Boolean rollupConsecutiveAbsences = consecutiveAbsencesField != null;

        if (presentStatuses.contains(delivery.AttendanceStatus__c)) {
            rollupField = TOTAL_PRESENT_FIELD_BY_LOOKUP_FIELD.get(lookupFieldOnDelivery);

            if (rollupConsecutiveAbsences) {
                if (targetObject.get(consecutiveAbsencesField) == null) {
                    targetObject.put(consecutiveAbsencesField, 0);
                }
                consecutiveAbsencesCountComplete.add(targetId);
            }
        } else if (absentStatuses.contains(delivery.AttendanceStatus__c)) {
            rollupField = TOTAL_ABSENT_FIELD_BY_LOOKUP_FIELD.get(lookupFieldOnDelivery);

            if (rollupConsecutiveAbsences) {
                if (targetObject.get(consecutiveAbsencesField) == null) {
                    // nothing counted yet; start counting
                    targetObject.put(consecutiveAbsencesField, 1);
                } else if (!consecutiveAbsencesCountComplete.contains(targetId)) {
                    // hasn't hit the present block yet; keep counting
                    Integer consecutiveAbsencesCount = (Integer) targetObject.get(
                        consecutiveAbsencesField
                    );
                    targetObject.put(
                        consecutiveAbsencesField,
                        consecutiveAbsencesCount + 1
                    );
                }
            }
        }

        if (rollupField == null) {
            return;
        }

        Integer count = targetObject.get(rollupField) == null
            ? 0
            : (Integer) targetObject.get(rollupField);
        count++;
        targetObject.put(rollupField, count);
    }

    @TestVisible
    private void rollupLastServiceDate(List<SObject> parents) {
        SObjectType objectType = parents[0].Id.getSObjectType();
        SObjectField lookupFieldOnDelivery = SERVICE_DELIVERY_LOOKUP_BY_PARENT_OBJECT.get(
            objectType
        );
        SObjectField lastServiceDateField = LAST_SERVICE_DATE_FIELD_BY_LOOKUP_FIELD.get(
            lookupFieldOnDelivery
        );

        if (lastServiceDateField == null) {
            return;
        }

        String relationshipName = relationshipNameBySObjectType.get(objectType);

        for (SObject parentRecord : parents) {
            calculateLastServiceDeliveryRollups(
                parentRecord,
                relationshipName,
                lastServiceDateField
            );
        }
    }

    @TestVisible
    private void rollupLastServiceDate(
        Map<SObjectField, Set<Id>> idsByLookupFieldToTarget
    ) {
        if (idsByLookupFieldToTarget == null || idsByLookupFieldToTarget.isEmpty()) {
            return;
        }

        for (SObjectField lookupFieldOnDelivery : idsByLookupFieldToTarget.keySet()) {
            if (idsByLookupFieldToTarget.get(lookupFieldOnDelivery).isEmpty()) {
                continue;
            }

            SObjectField lastServiceDateField = LAST_SERVICE_DATE_FIELD_BY_LOOKUP_FIELD.get(
                lookupFieldOnDelivery
            );

            if (lastServiceDateField == null) {
                continue;
            }

            SObjectType parentObject = lookupFieldOnDelivery.getDescribe()
                .getReferenceTo()[0];
            String relationshipName = relationshipNameBySObjectType.get(parentObject);
            for (
                SObject parentRecord : systemAccess.getParentsWithServiceDeliveries(
                    lookupFieldOnDelivery,
                    idsByLookupFieldToTarget.get(lookupFieldOnDelivery),
                    parentObject,
                    relationshipName
                )
            ) {
                calculateLastServiceDeliveryRollups(
                    parentRecord,
                    relationshipName,
                    lastServiceDateField
                );
            }
        }
    }

    private void calculateLastServiceDeliveryRollups(
        SObject parentRecord,
        String relationshipName,
        SObjectField lastServiceDateField
    ) {
        SObject targetObject = rollupTargetObjectById.get(parentRecord.Id);
        if (targetObject == null) {
            targetObject = parentRecord;
            rollupTargetObjectById.put(targetObject.Id, targetObject);
        }

        List<ServiceDelivery__c> serviceDeliveries = (List<ServiceDelivery__c>) parentRecord.getSObjects(
            relationshipName
        );
        if (serviceDeliveries == null || serviceDeliveries.isEmpty()) {
            targetObject.put(lastServiceDateField, null);
        } else {
            for (ServiceDelivery__c delivery : serviceDeliveries) {
                // Check for quantity. This check is done in the selector for trigger-based calcs, but not for batch-based calcs.
                if (delivery.Quantity__c > 0) {
                    System.debug('gonna use this one!');
                    targetObject.put(
                        lastServiceDateField,
                        (Date) delivery.get(DELIVERY_DATE)
                    );
                    break;
                }
            }
        }
    }

    public Map<String, Boolean> checkFieldPermissions() {
        Map<String, Boolean> result = new Map<String, Boolean>();
        List<Schema.SObjectField> fieldsRequireReadAccess = new List<Schema.SObjectField>{
            ServiceSession__c.PrimaryServiceProvider__c,
            ServiceSession__c.SessionStart__c,
            ServiceSession__c.ServiceSchedule__c,
            ServiceSession__c.SessionStart__c,
            ServiceSchedule__c.Service__c
        };
        fieldsRequireReadAccess.addAll(SERVICE_FIELD_BY_PARTICIPANT_FIELD.keySet());
        Boolean canReadServiceSchedule = PermissionValidator.getInstance()
            .hasObjectAccess(
                ServiceSchedule__c.SObjectType,
                PermissionValidator.CRUDAccessType.READABLE
            );
        Boolean canReadServiceParticipant = PermissionValidator.getInstance()
            .hasObjectAccess(
                ServiceParticipant__c.SObjectType,
                PermissionValidator.CRUDAccessType.READABLE
            );

        List<Schema.SObjectField> fieldsRequireUpdateAccess = new List<Schema.SObjectField>{
            ServiceSession__c.Status__c
        };

        List<Schema.SObjectField> fieldsRequireUpsertAccess = new List<Schema.SObjectField>{
            ServiceDelivery__c.ServiceSession__c,
            ServiceDelivery__c.AttendanceStatus__c,
            ServiceDelivery__c.Service_Provider__c,
            ServiceDelivery__c.DeliveryDate__c,
            ServiceDelivery__c.Service__c,
            ServiceDelivery__c.Quantity__c
        };
        fieldsRequireUpsertAccess.addAll(SERVICE_FIELD_BY_PARTICIPANT_FIELD.values());
        Boolean canUpsertServiceDelivery =
            PermissionValidator.getInstance()
                .hasObjectAccess(
                    ServiceDelivery__c.SObjectType,
                    PermissionValidator.CRUDAccessType.CREATEABLE
                ) &&
            PermissionValidator.getInstance()
                .hasObjectAccess(
                    ServiceDelivery__c.SObjectType,
                    PermissionValidator.CRUDAccessType.UPDATEABLE
                );
        Boolean canUpdateServiceSession = PermissionValidator.getInstance()
            .hasObjectAccess(
                ServiceSession__c.SObjectType,
                PermissionValidator.CRUDAccessType.UPDATEABLE
            );

        result.put(
            'read',
            PermissionValidator.getInstance()
                .hasFLSAccessForFields(fieldsRequireReadAccess, 'read') &&
            canReadServiceSchedule &&
            canReadServiceParticipant
        );

        result.put(
            'write',
            PermissionValidator.getInstance()
                .hasFLSAccessForFields(fieldsRequireUpsertAccess, 'upsert') &&
            PermissionValidator.getInstance()
                .hasFLSAccessForFields(fieldsRequireUpdateAccess, 'update') &&
            canUpsertServiceDelivery &&
            canUpdateServiceSession
        );

        return result;
    }

    private List<ServiceDelivery__c> createRows(Id sessionId) {
        Set<Id> existingClients = new Set<Id>();
        List<ServiceDelivery__c> deliveries = new List<ServiceDelivery__c>(
            attendanceSelector.getServiceDeliveriesBySessionId(sessionId)
        );

        for (ServiceDelivery__c delivery : deliveries) {
            existingClients.add(delivery.Contact__c);
        }

        ServiceSession__c session = attendanceSelector.getSession(sessionId);
        Id scheduleId = session.ServiceSchedule__c;

        for (
            ServiceParticipant__c participant : attendanceSelector.getServiceParticipantsByScheduleId(
                scheduleId,
                existingClients
            )
        ) {
            deliveries.add(createServiceDelivery(session, participant));
        }

        return deliveries;
    }

    @TestVisible
    private ServiceDelivery__c createServiceDelivery(
        ServiceSession__c session,
        ServiceParticipant__c participant
    ) {
        SObject particpantRecord = participant;
        SObject deliveryRecord = new ServiceDelivery__c(
            ServiceSession__c = session.Id,
            AttendanceStatus__c = DEFAULT_STATUS,
            Contact__r = participant.Contact__r,
            Service_Provider__c = session.PrimaryServiceProvider__c,
            DeliveryDate__c = Date.valueOf(session.SessionStart__c),
            Service__c = session.ServiceSchedule__r.Service__c,
            Quantity__c = session.ServiceSchedule__r.DefaultServiceQuantity__c
        );

        for (SObjectField sourceField : SERVICE_FIELD_BY_PARTICIPANT_FIELD.keySet()) {
            SObjectField lookupFieldOnDelivery = SERVICE_FIELD_BY_PARTICIPANT_FIELD.get(
                sourceField
            );
            deliveryRecord.put(lookupFieldOnDelivery, particpantRecord.get(sourceField));
        }

        return (ServiceDelivery__c) deliveryRecord;
    }

    private Map<String, List<String>> getStatusBuckets() {
        Map<String, List<String>> buckets = new Map<String, List<String>>();

        for (Bucket__mdt bucket : attendanceSelector.getAttendanceBuckets()) {
            buckets.put(bucket.DeveloperName, new List<String>());
            for (BucketedValue__mdt value : bucket.BucketedValues__r) {
                buckets.get(bucket.DeveloperName).add(value.Value__c);
            }
        }

        return buckets;
    }

    private void addDefaultTargetObjectsForAttendance(List<SObject> parents) {
        SObjectField lookupFieldOnDelivery = SERVICE_DELIVERY_LOOKUP_BY_PARENT_OBJECT.get(
            parents[0].Id.getSObjectType()
        );
        Set<Id> targetIds = new Map<Id, SObject>(parents).keySet();
        addDefaultTargetObjectsForAttendance(lookupFieldOnDelivery, targetIds);
    }

    private void addDefaultTargetObjectsForAttendance(
        SObjectField lookupFieldOnDelivery,
        Set<Id> targetIds
    ) {
        SObjectField attendedField = TOTAL_PRESENT_FIELD_BY_LOOKUP_FIELD.get(
            lookupFieldOnDelivery
        );
        SObjectField absentField = TOTAL_ABSENT_FIELD_BY_LOOKUP_FIELD.get(
            lookupFieldOnDelivery
        );
        SObjectField consecutiveAbsenceField = CONSECUTIVE_ABSENCES_FIELD_BY_LOOKUP_FIELD.get(
            lookupFieldOnDelivery
        );

        for (Id targetId : targetIds) {
            SObject targetObject = rollupTargetObjectById.get(targetId);
            if (targetObject == null) {
                targetObject = targetId.getSObjectType().newSObject(targetId);
                rollupTargetObjectById.put(targetId, targetObject);
                targetObject.put(attendedField, null);
                targetObject.put(absentField, null);
                if (consecutiveAbsenceField != null) {
                    targetObject.put(consecutiveAbsenceField, null);
                }
            }
        }
    }

    public class ServiceDeliveryException extends Exception {
    }
}
