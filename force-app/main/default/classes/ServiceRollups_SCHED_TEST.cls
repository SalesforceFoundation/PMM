@isTest
private class ServiceRollups_SCHED_TEST {
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

    @IsTest
    private static void shouldCallServiceWithServices() {
        List<String> attendanceStatuses = new AttendanceService().getAttendanceStatuses();

        List<Service__c> servicesWithServiceDeliveries = [
            SELECT
                Id,
                (
                    SELECT Service__c, AttendanceStatus__c, DeliveryDate__c, Quantity__c
                    FROM ServiceDeliveries__r
                    WHERE
                        AttendanceStatus__c IN :attendanceStatuses
                        OR (DeliveryDate__c <= TODAY
                        AND Quantity__c > 0)
                )
            FROM Service__c
        ];
        System.assert(
            !servicesWithServiceDeliveries.isEmpty(),
            'Expected test data to be queried.'
        );

        Test.startTest();

        ServiceRollups_SCHED rollups = new ServiceRollups_SCHED();
        attendanceServiceStub.withReturnValue(
            'getAttendanceStatuses',
            attendanceStatuses
        );
        ServiceRollups_SCHED.attendanceService = (AttendanceService) attendanceServiceStub.createMock();
        rollups.execute(null);

        Test.stopTest();

        attendanceServiceStub.assertCalledWith(
            'doRollups',
            List<SObject>.class,
            servicesWithServiceDeliveries
        );
    }
}
