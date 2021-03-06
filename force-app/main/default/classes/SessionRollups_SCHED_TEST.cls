/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@isTest
private class SessionRollups_SCHED_TEST {
    private static BasicStub attendanceServiceStub = new BasicStub(
        AttendanceService.class
    );

    @testSetup
    static void setup() {
        TestUtil.turnOffFeatureGates();
        TestDataFactory.generateAttendanceData('Monthly');
    }

    @IsTest
    private static void shouldCallServiceWithSessions() {
        List<String> attendanceStatuses = new AttendanceService().getAttendanceStatuses();

        List<ServiceSession__c> sessionsWithServiceDeliveries = [
            SELECT
                Id,
                (
                    SELECT
                        ServiceSession__c,
                        AttendanceStatus__c,
                        DeliveryDate__c,
                        Quantity__c
                    FROM ServiceDeliveries__r
                    WHERE
                        AttendanceStatus__c IN :attendanceStatuses
                        OR (DeliveryDate__c <= TODAY
                        AND Quantity__c > 0)
                )
            FROM ServiceSession__c
        ];
        System.assert(
            !sessionsWithServiceDeliveries.isEmpty(),
            'Expected test data to be queried.'
        );

        Test.startTest();

        SessionRollups_SCHED rollups = new SessionRollups_SCHED();
        attendanceServiceStub.withReturnValue(
            'getAttendanceStatuses',
            attendanceStatuses
        );
        SessionRollups_SCHED.attendanceService = (AttendanceService) attendanceServiceStub.createMock();
        rollups.execute(null);

        Test.stopTest();

        attendanceServiceStub.assertCalledWith(
            'doRollups',
            List<SObject>.class,
            sessionsWithServiceDeliveries
        );
    }
}
