@isTest
private class ContactRollups_SCHED_TEST {
    private static BasicStub attendanceServiceStub = new BasicStub(
        AttendanceService.class
    );

    private static List<ServiceDelivery__c> serviceDeliveries;
    private static final String PRESENT_STATUS = 'Present';
    private static final String ABSENCE_STATUS = 'Excused Absence';

    @testSetup
    static void setup() {
        TestUtil.turnOffFeatureGates();
        TestDataFactory.generateAttendanceData('Monthly');
    }

    // TODO: maybe functional test scenarios
    // contact w/ some, add more
    // contact w/ some, delete some
    // contact with none, insert some
    // contact with some, delete all

    @IsTest
    private static void shouldCallServiceWithContacts() {
        List<String> attendanceStatuses = new AttendanceService().getAttendanceStatuses();

        List<Contact> contactsWithServiceDeliveries = [
            SELECT
                Id,
                (
                    SELECT Contact__c, AttendanceStatus__c, DeliveryDate__c, Quantity__c
                    FROM Service_Deliveries__r
                    WHERE
                        AttendanceStatus__c IN :attendanceStatuses
                        OR (DeliveryDate__c <= TODAY
                        AND Quantity__c > 0)
                )
            FROM Contact
        ];
        System.assert(
            !contactsWithServiceDeliveries.isEmpty(),
            'Expected test data to be queried.'
        );

        Test.startTest();

        ContactRollups_SCHED rollups = new ContactRollups_SCHED();
        attendanceServiceStub.withReturnValue(
            'getAttendanceStatuses',
            attendanceStatuses
        );
        ContactRollups_SCHED.attendanceService = (AttendanceService) attendanceServiceStub.createMock();
        Id batchId = Database.executeBatch(rollups);

        Test.stopTest();

        attendanceServiceStub.assertCalledWith(
            'doRollups',
            List<SObject>.class,
            contactsWithServiceDeliveries
        );
    }
}
