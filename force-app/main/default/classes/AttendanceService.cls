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
    private final SObjectField DELIVERY_DATE = ServiceDelivery__c.DeliveryDate__c;

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

    public void rollupAttendance(Map<SObjectField, Set<Id>> idsByLookupFieldToTarget) {
        Map<Id, SObject> targetObjectById = new Map<Id, SObject>();
        Set<Id> consecutiveAbsencesCountComplete = new Set<Id>();
        if (idsByLookupFieldToTarget == null || idsByLookupFieldToTarget.isEmpty()) {
            return;
        }

        List<String> presentStatuses = statusBuckets.get('Present');
        List<String> absentStatuses = statusBuckets.get('Absent');
        List<String> allStatuses = new List<String>();
        allStatuses.addAll(presentStatuses);
        allStatuses.addAll(absentStatuses);

        for (SObjectField lookupFieldOnDelivery : idsByLookupFieldToTarget.keySet()) {
            addDefaultTargetObjects(
                lookupFieldOnDelivery,
                idsByLookupFieldToTarget.get(lookupFieldOnDelivery),
                targetObjectById
            );

            for (
                ServiceDelivery__c delivery : systemAccess.getAttendanceRecords(
                    lookupFieldOnDelivery,
                    idsByLookupFieldToTarget.get(lookupFieldOnDelivery),
                    allStatuses
                )
            ) {
                Id targetId = (Id) delivery.get(lookupFieldOnDelivery);
                if (targetId == null) {
                    continue;
                }
                SObject targetObject = targetObjectById.get(targetId);
                SObjectField rollupField;
                SObjectField consecutiveAbsencesField = CONSECUTIVE_ABSENCES_FIELD_BY_LOOKUP_FIELD.get(
                    lookupFieldOnDelivery
                );
                Boolean rollupConsecutiveAbsences = consecutiveAbsencesField != null;

                if (presentStatuses.contains(delivery.AttendanceStatus__c)) {
                    rollupField = TOTAL_PRESENT_FIELD_BY_LOOKUP_FIELD.get(
                        lookupFieldOnDelivery
                    );

                    if (rollupConsecutiveAbsences) {
                        if (targetObject.get(consecutiveAbsencesField) == null) {
                            targetObject.put(consecutiveAbsencesField, 0);
                        }
                        consecutiveAbsencesCountComplete.add(targetId);
                    }
                } else if (absentStatuses.contains(delivery.AttendanceStatus__c)) {
                    rollupField = TOTAL_ABSENT_FIELD_BY_LOOKUP_FIELD.get(
                        lookupFieldOnDelivery
                    );

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
        }

        systemAccess.updateRecords(targetObjectById.values());
    }

    public void rollupLastServiceDate(
        Map<SObjectField, Set<Id>> idsByLookupFieldToTarget
    ) {
        List<SObject> parentRecordsToUpdate = new List<SObject>();
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

            SObjectType parentObject = lookupFieldOnDelivery.getDescribe()
                .getReferenceTo()[0];
            String relationshipName;
            for (
                ChildRelationship child : parentObject.getDescribe()
                    .getChildRelationships()
            ) {
                if (child.getField() == lookupFieldOnDelivery) {
                    relationshipName = child.getRelationshipName();
                    break;
                }
            }

            for (
                SObject parentRecord : systemAccess.getParentsWithServiceDeliveries(
                    lookupFieldOnDelivery,
                    idsByLookupFieldToTarget.get(lookupFieldOnDelivery),
                    parentObject,
                    relationshipName
                )
            ) {
                List<ServiceDelivery__c> serviceDeliveries = (List<ServiceDelivery__c>) parentRecord.getSObjects(
                    relationshipName
                );
                if (serviceDeliveries == null || serviceDeliveries.isEmpty()) {
                    parentRecord.put(lastServiceDateField, null);
                } else {
                    parentRecord.put(
                        lastServiceDateField,
                        (Date) serviceDeliveries[0].get(DELIVERY_DATE)
                    );
                }
                parentRecordsToUpdate.add(parentRecord);
            }
        }

        systemAccess.updateRecords(parentRecordsToUpdate);
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

    private void addDefaultTargetObjects(
        SObjectField lookupFieldOnDelivery,
        Set<Id> targetIds,
        Map<Id, SObject> targetObjectById
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
            SObject targetObject = targetObjectById.get(targetId);
            if (targetObject == null) {
                targetObject = targetId.getSObjectType().newSObject(targetId);
                targetObjectById.put(targetId, targetObject);
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
