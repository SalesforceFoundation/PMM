/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ServiceDeliveryService {
    @TestVisible
    private ServiceDeliverySelector deliverySelector = new ServiceDeliverySelector();
    @TestVisible
    private FieldBucketSelector bucketSelector = new FieldBucketSelector();
    @TestVisible
    private FieldSetService fieldSetService = new FieldSetService();

    @TestVisible
    private ServiceDeliveryDomain domain = new ServiceDeliveryDomain();
    private static final String ABSENT = 'Absent';
    private static final String PRESENT = 'Present';
    private static final String DEFAULT_STATUS = PRESENT;
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

    public List<String> presentStatuses {
        get {
            return statusBuckets.get(PRESENT);
        }
        set;
    }

    public List<String> absentStatuses {
        get {
            return statusBuckets.get(ABSENT);
        }
        set;
    }

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

    public Roster generateRoster(Id sessionId, ServiceDeliveryService.Filters filters) {
        ServiceSession__c session = deliverySelector.getSession(sessionId);
        FieldSet fieldSet = getFieldSet(session.ServiceSchedule__c);

        List<ServiceDelivery__c> deliveries = createServiceDeliveries(
            fieldSet,
            session,
            filters
        );

        return new Roster(
            fieldSetService.getFieldSetForLWC(
                String.valueOf(ServiceDelivery__c.SObjectType),
                fieldSet.getName(),
                false
            ),
            deliveries
        );
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

    private FieldSet getFieldSet(Id scheduleId) {
        FieldSet defaultFieldSet = SObjectType.ServiceDelivery__c.FieldSets.Attendance_Service_Deliveries;
        String fieldSetName = deliverySelector.getAttendanceFieldSetName(scheduleId);
        if (fieldSetName == null) {
            return defaultFieldSet;
        }
        FieldSet fieldSet = fieldSetService.getFieldSet(
            ServiceDelivery__c.SObjectType.getDescribe(),
            fieldSetName
        );

        return fieldSet == null ? defaultFieldSet : fieldSet;
    }

    private List<ServiceDelivery__c> createServiceDeliveries(
        FieldSet fieldSet,
        ServiceSession__c session,
        ServiceDeliveryService.Filters filters
    ) {
        Set<Id> existingClients = new Set<Id>();

        List<ServiceDelivery__c> deliveries = new List<ServiceDelivery__c>(
            deliverySelector.getServiceDeliveriesBySessionId(fieldSet, session.Id)
        );

        for (ServiceDelivery__c delivery : deliveries) {
            existingClients.add(delivery.Contact__c);
        }

        List<ServiceParticipant__c> participants = deliverySelector.getServiceParticipantsByScheduleId(
            session.ServiceSchedule__c,
            existingClients
        );

        for (ServiceParticipant__c participant : participants) {
            if (filters != null && filters.shouldInclude(participant)) {
                deliveries.add(createServiceDelivery(session, participant));
            }
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
        List<String> bucketNames = new List<String>{ ABSENT, PRESENT };
        Map<String, List<String>> buckets = new Map<String, List<String>>();

        Schema.SObjectType serviceDeliverySObjType = ServiceDelivery__c.SObjectType;
        Schema.SObjectField statusField = ServiceDelivery__c.AttendanceStatus__c;

        for (
            Bucket__mdt bucket : bucketSelector.getBuckets(
                bucketNames,
                serviceDeliverySObjType,
                statusField
            )
        ) {
            buckets.put(bucket.DeveloperName, new List<String>());
            for (BucketedValue__mdt value : bucket.BucketedValues__r) {
                buckets.get(bucket.DeveloperName).add(value.Value__c);
            }
        }

        return buckets;
    }

    public class Roster {
        @AuraEnabled
        public List<Map<String, Object>> fieldSet;
        @AuraEnabled
        public List<ServiceDelivery__c> deliveries;

        public Roster(
            List<Map<String, Object>> fieldSet,
            List<ServiceDelivery__c> deliveries
        ) {
            this.fieldSet = fieldSet;
            this.deliveries = deliveries;
        }
    }

    public class Filters {
        private Set<String> excludedServiceParticipantStatuses;
        private Set<String> excludedProgramEngagementRoles;
        private Set<String> excludedProgramEngagementStages;

        public Filters(
            String omitServiceParticipantStatuses,
            String omitProgramEngagementRoles,
            String omitProgramEngagementStages
        ) {
            List<String> spStatuses = omitServiceParticipantStatuses.split(',');
            List<String> peRoles = omitProgramEngagementRoles.split(',');
            List<String> peStages = omitProgramEngagementStages.split(',');

            for (Integer i = 0; i < spStatuses.size(); i++) {
                spStatuses[i] = spStatuses[i].trim();
            }

            for (Integer i = 0; i < peRoles.size(); i++) {
                peRoles[i] = peRoles[i].trim();
            }

            for (Integer i = 0; i < peStages.size(); i++) {
                peStages[i] = peStages[i].trim();
            }

            setFilters(
                new Set<String>(spStatuses),
                new Set<String>(peRoles),
                new Set<String>(peStages)
            );
        }

        public Filters(
            Set<String> excludedServiceParticipantStatuses,
            Set<String> excludedProgramEngagementRoles,
            Set<String> excludedProgramEngagementStages
        ) {
            setFilters(
                excludedServiceParticipantStatuses,
                excludedProgramEngagementRoles,
                excludedProgramEngagementStages
            );
        }

        public Boolean shouldInclude(ServiceParticipant__c participant) {
            if (
                excludedServiceParticipantStatuses.contains(participant.Status__c) ||
                excludedProgramEngagementRoles.contains(
                    participant.ProgramEngagement__r.Role__c
                ) ||
                excludedProgramEngagementStages.contains(
                    participant.ProgramEngagement__r.Stage__c
                )
            ) {
                return false;
            }
            return true;
        }

        private void setFilters(
            Set<String> excludedServiceParticipantStatuses,
            Set<String> excludedProgramEngagementRoles,
            Set<String> excludedProgramEngagementStages
        ) {
            this.excludedServiceParticipantStatuses = excludedServiceParticipantStatuses;
            this.excludedProgramEngagementRoles = excludedProgramEngagementRoles;
            this.excludedProgramEngagementStages = excludedProgramEngagementStages;
        }
    }

    public class ServiceDeliveryException extends Exception {
    }
}
