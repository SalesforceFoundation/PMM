@isTest
private class ContactRollups_SCHED_TEST {
    private static BasicStub attendanceServiceStub = new BasicStub(
        AttendanceService.class
    );

    @testSetup
    static void setup() {
        TestUtil.turnOffFeatureGates();
        TestDataFactory.generateAttendanceData('Monthly');
    }

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
        rollups.execute(null);

        Test.stopTest();

        attendanceServiceStub.assertCalledWith(
            'doRollups',
            List<SObject>.class,
            contactsWithServiceDeliveries
        );
    }
}
