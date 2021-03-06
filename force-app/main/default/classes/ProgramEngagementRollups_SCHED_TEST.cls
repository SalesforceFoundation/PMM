/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@isTest
private class ProgramEngagementRollups_SCHED_TEST {
    private static BasicStub attendanceServiceStub = new BasicStub(
        AttendanceService.class
    );

    @testSetup
    static void setup() {
        TestUtil.turnOffFeatureGates();
        TestDataFactory.generateAttendanceData('Monthly');
    }

    @IsTest
    private static void shouldCallServiceWithProgramEngagements() {
        List<String> attendanceStatuses = new AttendanceService().getAttendanceStatuses();

        List<ProgramEngagement__c> programEngagementsWithServiceDeliveries = [
            SELECT
                Id,
                (
                    SELECT Contact__c, AttendanceStatus__c, DeliveryDate__c, Quantity__c
                    FROM ServiceDeliveries__r
                    WHERE
                        AttendanceStatus__c IN :attendanceStatuses
                        OR (DeliveryDate__c <= TODAY
                        AND Quantity__c > 0)
                )
            FROM ProgramEngagement__c
        ];
        System.assert(
            !programEngagementsWithServiceDeliveries.isEmpty(),
            'Expected test data to be queried.'
        );

        Test.startTest();

        ProgramEngagementRollups_SCHED rollups = new ProgramEngagementRollups_SCHED();
        attendanceServiceStub.withReturnValue(
            'getAttendanceStatuses',
            attendanceStatuses
        );
        ProgramEngagementRollups_SCHED.attendanceService = (AttendanceService) attendanceServiceStub.createMock();
        rollups.execute(null);

        Test.stopTest();

        attendanceServiceStub.assertCalledWith(
            'doRollups',
            List<SObject>.class,
            programEngagementsWithServiceDeliveries
        );
    }
}
