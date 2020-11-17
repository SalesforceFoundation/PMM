/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class AttendanceController_TEST {
    private static BasicStub serviceStub = new BasicStub(AttendanceService.class);

    @IsTest
    private static void shouldReturnServiceDeliveriesFromService() {
        String generateRoster = 'generateRoster';
        List<ServiceDelivery__c> serviceDeliveriesToReturn = new List<ServiceDelivery__c>();
        serviceStub.withReturnValue(generateRoster, Id.class, serviceDeliveriesToReturn);
        Id sessionId = TestUtil.mockId(ServiceSession__c.SObjectType);
        AttendanceController.service = (AttendanceService) serviceStub.createMock();

        Test.startTest();
        System.assert(
            serviceDeliveriesToReturn === AttendanceController.generateRoster(sessionId),
            'Expected the controller to return the list returned by the service.'
        );
        Test.stopTest();

        serviceStub.assertCalledWith(generateRoster, Id.class, sessionId);
    }

    @IsTest
    private static void shouldRethrowExceptionFromService() {
        String generateRoster = 'generateRoster';
        Id sessionId = TestUtil.mockId(ServiceSession__c.SObjectType);
        serviceStub.withThrowException(generateRoster, Id.class);
        AttendanceController.service = (AttendanceService) serviceStub.createMock();
        Exception actualException;

        Test.startTest();
        try {
            AttendanceController.generateRoster(sessionId);
        } catch (Exception ex) {
            actualException = ex;
        }
        Test.stopTest();

        System.assertEquals(
            serviceStub.testExceptionMessage,
            actualException.getMessage(),
            'Expected the controller to rethrow the exception from the service.'
        );

        serviceStub.assertCalledWith(generateRoster, Id.class, sessionId);
    }

    @IsTest
    private static void shouldPassServiceDeliveriesToServiceOnUpsert() {
        String methodName = 'upsertServiceDeliveries';
        List<ServiceDelivery__c> deliveries = new List<ServiceDelivery__c>();

        AttendanceController.service = (AttendanceService) serviceStub.createMock();

        Test.startTest();
        AttendanceController.upsertServiceDeliveries(deliveries);
        Test.stopTest();

        serviceStub.assertCalledWith(
            methodName,
            List<ServiceDelivery__c>.class,
            deliveries
        );
    }

    @IsTest
    private static void shouldRethrowExceptionFromServiceOnUpsert() {
        String methodName = 'upsertServiceDeliveries';
        List<ServiceDelivery__c> deliveries = new List<ServiceDelivery__c>();

        serviceStub.withThrowException(methodName, List<ServiceDelivery__c>.class);
        AttendanceController.service = (AttendanceService) serviceStub.createMock();
        Exception actualException;

        Test.startTest();
        try {
            AttendanceController.upsertServiceDeliveries(deliveries);
        } catch (Exception ex) {
            actualException = ex;
        }
        Test.stopTest();

        System.assertEquals(
            serviceStub.testExceptionMessage,
            actualException.getMessage(),
            'Expected the controller to rethrow the exception from the service.'
        );

        serviceStub.assertCalledWith(
            methodName,
            List<ServiceDelivery__c>.class,
            deliveries
        );
    }

    @IsTest
    private static void shouldCallServiceToCheckFLS() {
        String methodName = 'checkFieldPermissions';
        Boolean expected = true;
        serviceStub.withReturnValue(methodName, expected);
        AttendanceController.service = (AttendanceService) serviceStub.createMock();

        Test.startTest();
        Boolean actual = AttendanceController.checkFieldPermissions();
        Test.stopTest();

        serviceStub.assertCalled(methodName);
        System.assertEquals(
            expected,
            actual,
            'Expected the controller to return the same value returned by the service.'
        );
    }

    @IsTest
    private static void shouldRethrowExceptionFromServiceOnFLSCheck() {
        String methodName = 'checkFieldPermissions';

        serviceStub.withThrowException(methodName);
        AttendanceController.service = (AttendanceService) serviceStub.createMock();
        Exception actualException;
        Boolean actual;
        Test.startTest();
        try {
            actual = AttendanceController.checkFieldPermissions();
        } catch (Exception ex) {
            actualException = ex;
        }
        Test.stopTest();

        System.assertEquals(
            serviceStub.testExceptionMessage,
            actualException.getMessage(),
            'Expected the controller to rethrow the exception from the service.'
        );
        System.assertEquals(null, actual);

        serviceStub.assertCalled(methodName);
    }
}
