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
    private static BasicStub serviceStub = new BasicStub(ServiceDeliveryService.class);

    @IsTest
    private static void shouldReturnServiceDeliveriesFromService() {
        String generateRoster = 'generateRoster';
        List<ServiceDelivery__c> serviceDeliveriesToReturn = new List<ServiceDelivery__c>();
        ServiceDeliveryService.Roster rosterToReturn = new ServiceDeliveryService.Roster(
            null,
            serviceDeliveriesToReturn
        );
        serviceStub.withReturnValue(
            generateRoster,
            new List<Type>{ Id.class, ServiceDeliveryService.Filters.class },
            rosterToReturn
        );
        Id sessionId = TestUtil.mockId(ServiceSession__c.SObjectType);
        AttendanceController.service = (ServiceDeliveryService) serviceStub.createMock();

        Test.startTest();
        System.assert(
            serviceDeliveriesToReturn ===
            AttendanceController.generateRoster(sessionId, '', '', '').deliveries,
            'Expected the controller to return the list returned by the service.'
        );
        Test.stopTest();

        serviceStub.assertCalledWith(
            generateRoster,
            new List<Type>{ Id.class, ServiceDeliveryService.Filters.class },
            new List<Object>{ sessionId, new ServiceDeliveryService.Filters('', '', '') }
        );
    }

    @IsTest
    private static void shouldRethrowExceptionFromService() {
        String generateRoster = 'generateRoster';
        Id sessionId = TestUtil.mockId(ServiceSession__c.SObjectType);
        serviceStub.withThrowException(
            generateRoster,
            new List<Type>{ Id.class, ServiceDeliveryService.Filters.class }
        );
        AttendanceController.service = (ServiceDeliveryService) serviceStub.createMock();
        Exception actualException;

        Test.startTest();
        try {
            AttendanceController.generateRoster(sessionId, '', '', '');
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
            generateRoster,
            new List<Type>{ Id.class, ServiceDeliveryService.Filters.class },
            new List<Object>{ sessionId, new ServiceDeliveryService.Filters('', '', '') }
        );
    }

    @IsTest
    private static void shouldPassServiceDeliveriesToServiceOnUpsert() {
        String methodName = 'upsertServiceDeliveries';
        List<ServiceDelivery__c> deliveries = new List<ServiceDelivery__c>();

        AttendanceController.service = (ServiceDeliveryService) serviceStub.createMock();

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
        AttendanceController.service = (ServiceDeliveryService) serviceStub.createMock();
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
        Map<String, Boolean> expected = new Map<String, Boolean>();
        serviceStub.withReturnValue(methodName, expected);
        AttendanceController.service = (ServiceDeliveryService) serviceStub.createMock();

        Test.startTest();
        Map<String, Boolean> actual = AttendanceController.checkFieldPermissions();
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
        AttendanceController.service = (ServiceDeliveryService) serviceStub.createMock();
        Exception actualException;
        Map<String, Boolean> actual;
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

    @IsTest
    private static void testGetServiceSessionStatusBuckets() {
        List<String> bucketNames = new List<String>{ 'Complete', 'Pending' };
        String methodName = 'getServiceSessionStatusBuckets';

        Map<String, List<String>> expectedValues = new Map<String, List<String>>();
        expectedValues.put('Complete', new List<String>{ 'Complete' });
        expectedValues.put('Pending', new List<String>{ 'Pending' });

        TestStub serviceSessionStub = new StubBuilder(ServiceSessionService.class)
            .when(methodName)
            .called()
            .thenReturn(expectedValues)
            .build();

        AttendanceController.sessionService = (ServiceSessionService) serviceSessionStub.create();

        Test.startTest();
        Map<String, List<String>> actualValues = AttendanceController.getServiceSessionStatusBuckets();

        Test.stopTest();

        System.assertEquals(
            expectedValues,
            actualValues,
            'Expected the controller to return list delivered by service.'
        );

        serviceSessionStub.assertCalledAsExpected();
    }

    @IsTest
    private static void testGetServiceSessionStatusBucketsWithException() {
        String methodName = 'getServiceSessionStatusBuckets';
        Exception actualException;

        TestStub serviceSessionStub = new StubBuilder(ServiceSessionService.class)
            .when(methodName)
            .called()
            .thenThrowException()
            .build();

        AttendanceController.sessionService = (ServiceSessionService) serviceSessionStub.create();

        Test.startTest();
        try {
            AttendanceController.getServiceSessionStatusBuckets();
        } catch (Exception ex) {
            actualException = ex;
        }

        Test.stopTest();

        System.assert(
            actualException instanceof AuraHandledException,
            actualException.getTypeName() + ': Expected an aura handled exception.'
        );
    }
}
