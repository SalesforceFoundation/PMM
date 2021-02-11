@IsTest
public with sharing class ServiceDeliveryTriggerHandler_TEST {
    private static Contact contact;
    private static Service__c service;
    private static List<ServiceSession__c> sessions;
    private static ProgramEngagement__c programEngagement;

    private static void refreshData() {
        contact = [
            SELECT Id, NumPresentServiceDeliveries__c, NumAbsentServiceDeliveries__c
            FROM Contact
            LIMIT 1
        ];
        service = [
            SELECT Id, NumPresentServiceDeliveries__c, NumAbsentServiceDeliveries__c
            FROM Service__c
            LIMIT 1
        ];
        sessions = [
            SELECT Id, NumPresentServiceDeliveries__c, NumAbsentServiceDeliveries__c
            FROM ServiceSession__c
            LIMIT 2
        ];
        programEngagement = [
            SELECT Id, NumPresentServiceDeliveries__c, NumAbsentServiceDeliveries__c
            FROM ProgramEngagement__c
            LIMIT 1
        ];
    }

    @TestSetup
    private static void createServiceData() {
        TestDataFactory.generateAttendanceData('Monthly');
    }

    @IsTest
    private static void testExecuteFromNonTrigger() {
        new ServiceDeliveryTriggerHandler().execute();
    }

    @IsTest
    private static void testDML() {
        refreshData();

        System.assertEquals(null, contact.NumPresentServiceDeliveries__c);
        //TODO : fix expect vs actual position
        System.assertEquals(contact.NumAbsentServiceDeliveries__c, null);
        System.assertEquals(service.NumPresentServiceDeliveries__c, null);
        System.assertEquals(service.NumAbsentServiceDeliveries__c, null);
        System.assertEquals(sessions[0].NumPresentServiceDeliveries__c, null);
        System.assertEquals(sessions[0].NumAbsentServiceDeliveries__c, null);
        System.assertEquals(sessions[1].NumPresentServiceDeliveries__c, null);
        System.assertEquals(sessions[1].NumAbsentServiceDeliveries__c, null);
        System.assertEquals(programEngagement.NumPresentServiceDeliveries__c, null);
        System.assertEquals(programEngagement.NumAbsentServiceDeliveries__c, null);

        List<ServiceDelivery__c> serviceDeliveries = new List<ServiceDelivery__c>{
            new ServiceDelivery__c(
                Name = 'test',
                Service__c = service.Id,
                Contact__c = contact.Id,
                ServiceSession__c = sessions[0].Id,
                ProgramEngagement__c = programEngagement.Id,
                AttendanceStatus__c = 'Present'
            ),
            new ServiceDelivery__c(
                Name = 'test2',
                Service__c = service.Id,
                Contact__c = contact.Id,
                ServiceSession__c = sessions[1].Id,
                ProgramEngagement__c = programEngagement.Id,
                AttendanceStatus__c = 'Excused Absence'
            )
        };

        insert serviceDeliveries;

        refreshData();

        System.assertEquals(1, contact.NumPresentServiceDeliveries__c);
        System.assertEquals(1, contact.NumAbsentServiceDeliveries__c);
        System.assertEquals(1, service.NumPresentServiceDeliveries__c);
        System.assertEquals(1, service.NumAbsentServiceDeliveries__c);
        System.assertEquals(1, sessions[0].NumPresentServiceDeliveries__c);
        System.assertEquals(null, sessions[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(null, sessions[1].NumPresentServiceDeliveries__c);
        System.assertEquals(1, sessions[1].NumAbsentServiceDeliveries__c);
        System.assertEquals(1, programEngagement.NumPresentServiceDeliveries__c);
        System.assertEquals(1, programEngagement.NumAbsentServiceDeliveries__c);

        serviceDeliveries[1].AttendanceStatus__c = 'Present';

        update serviceDeliveries[1];

        refreshData();

        System.assertEquals(2, contact.NumPresentServiceDeliveries__c);
        System.assertEquals(null, contact.NumAbsentServiceDeliveries__c);
        System.assertEquals(2, service.NumPresentServiceDeliveries__c);
        System.assertEquals(null, service.NumAbsentServiceDeliveries__c);
        System.assertEquals(1, sessions[0].NumPresentServiceDeliveries__c);
        System.assertEquals(null, sessions[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(1, sessions[1].NumPresentServiceDeliveries__c);
        System.assertEquals(null, sessions[1].NumAbsentServiceDeliveries__c);
        System.assertEquals(2, programEngagement.NumPresentServiceDeliveries__c);
        System.assertEquals(null, programEngagement.NumAbsentServiceDeliveries__c);

        delete serviceDeliveries[0];

        refreshData();

        System.assertEquals(1, contact.NumPresentServiceDeliveries__c);
        System.assertEquals(null, contact.NumAbsentServiceDeliveries__c);
        System.assertEquals(1, service.NumPresentServiceDeliveries__c);
        System.assertEquals(null, service.NumAbsentServiceDeliveries__c);
        System.assertEquals(null, sessions[0].NumPresentServiceDeliveries__c);
        System.assertEquals(null, sessions[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(1, sessions[1].NumPresentServiceDeliveries__c);
        System.assertEquals(null, sessions[1].NumAbsentServiceDeliveries__c);
        System.assertEquals(1, programEngagement.NumPresentServiceDeliveries__c);
        System.assertEquals(null, programEngagement.NumAbsentServiceDeliveries__c);

        undelete serviceDeliveries[0];

        refreshData();

        System.assertEquals(2, contact.NumPresentServiceDeliveries__c);
        System.assertEquals(null, contact.NumAbsentServiceDeliveries__c);
        System.assertEquals(2, service.NumPresentServiceDeliveries__c);
        System.assertEquals(null, service.NumAbsentServiceDeliveries__c);
        System.assertEquals(1, sessions[0].NumPresentServiceDeliveries__c);
        System.assertEquals(null, sessions[0].NumAbsentServiceDeliveries__c);
        System.assertEquals(1, sessions[1].NumPresentServiceDeliveries__c);
        System.assertEquals(null, sessions[1].NumAbsentServiceDeliveries__c);
        System.assertEquals(2, programEngagement.NumPresentServiceDeliveries__c);
        System.assertEquals(null, programEngagement.NumAbsentServiceDeliveries__c);
    }
}
