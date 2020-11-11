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

    private static final String DEFAULT_STATUS = 'Present';

    // While we allow the Attendance UI and the ultimate saved Service Delivery records
    // to be driven by a field set, the mapping from Service Participants to the seeded
    // Service Deliveries that appear in the Attendance UI is hard-coded here.
    // We could, in the future, allow this to be driven by design parameters or CMDT.
    // It is a heavy lift for questionable value. (Is there a use case for mapping additional
    // information from Participant to Attendance Service Delivery?)
    private static final Map<SObjectField, SObjectField> SERVICE_FIELD_BY_PARTICIPANT_FIELD = new Map<SObjectField, SObjectField>{
        ServiceParticipant__c.Contact__c => ServiceDelivery__c.Contact__c,
        ServiceParticipant__c.ProgramEngagement__c => ServiceDelivery__c.ProgramEngagement__c,
        ServiceParticipant__c.Service__c => ServiceDelivery__c.Service__c
    };

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
            DeliveryDate__c = Date.valueOf(session.SessionStart__c)
        );

        for (SObjectField sourceField : SERVICE_FIELD_BY_PARTICIPANT_FIELD.keySet()) {
            SObjectField targetField = SERVICE_FIELD_BY_PARTICIPANT_FIELD.get(
                sourceField
            );
            deliveryRecord.put(targetField, particpantRecord.get(sourceField));
        }

        return (ServiceDelivery__c) deliveryRecord;
    }

    public class ServiceDeliveryException extends Exception {
    }
}
