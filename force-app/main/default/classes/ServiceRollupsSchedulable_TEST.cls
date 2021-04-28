/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@isTest
private class ServiceRollupsSchedulable_TEST {
    private static BasicStub attendanceServiceStub = new BasicStub(
        ServiceDeliveryService.class
    );

    @testSetup
    static void setup() {
        TestUtil.turnOffFeatureGates();
        TestDataFactory.generateAttendanceData('Monthly');
    }

    @IsTest
    private static void shouldCallServiceWithServices() {
        List<String> attendanceStatuses = new ServiceDeliveryService().attendanceStatuses;

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

        ServiceRollupsSchedulable rollups = new ServiceRollupsSchedulable();
        attendanceServiceStub.withReturnValue(
            'getAttendanceStatuses',
            attendanceStatuses
        );
        ServiceRollupsSchedulable.deliveryService = (ServiceDeliveryService) attendanceServiceStub.createMock();
        rollups.execute(null);

        Test.stopTest();

        attendanceServiceStub.assertCalledWith(
            'doRollups',
            new List<Type>{ SObjectType.class, List<SObject>.class },
            new List<Object>{ Service__c.SObjectType, servicesWithServiceDeliveries }
        );
    }
}
