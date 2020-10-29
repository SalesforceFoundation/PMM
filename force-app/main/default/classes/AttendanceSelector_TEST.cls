@IsTest
public with sharing class AttendanceSelector_TEST {
    private static AttendanceSelector selector = new AttendanceSelector();

    @TestSetup
    private static void setupServiceSessionData() {
        TestDataFactory.generateAttendanceData();
    }

    @IsTest
    private static void getServiceDeliveriesFiltersWithClient() {
        List<ServiceDelivery__c> actualDeliveries;
        Id sessionId = [SELECT Id FROM ServiceSession__c LIMIT 1].Id;

        ServiceDelivery__c serviceDelivery = [
            SELECT Service__c, ServiceSession__c
            FROM ServiceDelivery__c
            WHERE ServiceSession__c = :sessionId
        ];
        serviceDelivery.Contact__c = null;
        insert serviceDelivery.clone();

        Test.startTest();
        actualDeliveries = selector.getServiceDeliveriesBySessionId(sessionId);
        Test.stopTest();

        List<ServiceDelivery__c> sessionDeliveries = [
            SELECT Id
            FROM ServiceDelivery__c
            WHERE ServiceSession__c = :sessionId
        ];
        System.assert(
            !actualDeliveries.isEmpty() &&
            sessionDeliveries.size() > actualDeliveries.size(),
            'Expected only sessions with contact ids to be returned, actualDeliveries: ' +
            actualDeliveries.size() +
            '; sessionDeliveries: ' +
            sessionDeliveries.size()
        );

        for (ServiceDelivery__c delivery : actualDeliveries) {
            System.assertNotEquals(
                null,
                delivery.Contact__c,
                'Expected only deliveries related to a client to be returned.'
            );
        }
    }

    @IsTest
    private static void getServiceParticipantsByScheduleIdShouldReturnAllWhenNoExistingContacts() {
        ServiceSession__c session = [
            SELECT Id, ServiceSchedule__c
            FROM ServiceSession__c
            LIMIT 1
        ];
        List<ServiceParticipant__c> participants = [
            SELECT Id, Contact__c
            FROM ServiceParticipant__c
            WHERE ServiceSchedule__c = :session.ServiceSchedule__c
        ];
        System.assert(
            participants.size() > 1,
            'Sanity check that at least 2 participants should be found.'
        );
        List<ServiceParticipant__c> actualParticipants = selector.getServiceParticipantsByScheduleId(
            session.ServiceSchedule__c,
            new Set<Id>()
        );

        System.assertEquals(
            participants.size(),
            actualParticipants.size(),
            'Expected all participant records to be returned.'
        );
    }

    @IsTest
    private static void getServiceParticipantsByScheduleIdShouldOmitExistingContacts() {
        ServiceSession__c session = [
            SELECT Id, ServiceSchedule__c
            FROM ServiceSession__c
            LIMIT 1
        ];
        List<ServiceParticipant__c> participants = [
            SELECT Id, Contact__c
            FROM ServiceParticipant__c
            WHERE ServiceSchedule__c = :session.ServiceSchedule__c
        ];
        System.assert(
            participants.size() > 1,
            'Sanity check that at least 2 participants should be found.'
        );
        List<ServiceParticipant__c> actualParticipants = selector.getServiceParticipantsByScheduleId(
            session.ServiceSchedule__c,
            new Set<Id>{ participants[0].Contact__c }
        );

        System.assertEquals(
            participants.size() - 1,
            actualParticipants.size(),
            'Expected one participant record to be excluded.'
        );
    }
}
