/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class RecentServiceSessionController_TEST {
    private static BasicStub serviceStub = new BasicStub(ServiceSessionService.class);

    @IsTest
    private static void testGetServiceSessionsByStartDate() {
        final String methodName = 'getServiceSessionsByStartDate';
        final String dateLiteral = 'THIS_WEEK';

        Map<String, List<ServiceSession__c>> expected = new Map<String, List<ServiceSession__c>>();

        expected.put(System.now().format('EEEE, dd MMMM'), new List<ServiceSession__c>());

        serviceStub.withReturnValue(methodName, String.class, expected);

        Test.startTest();
        RecentServiceSessionController.serviceSessionService = (ServiceSessionService) serviceStub.createMock();

        final Map<String, List<ServiceSession__c>> actual = RecentServiceSessionController.getServiceSessionsByStartDate(
            dateLiteral
        );

        Test.stopTest();

        System.assertEquals(
            expected.keySet(),
            actual.keySet(),
            'Actual key returned is not the same as expected key'
        );

        serviceStub.assertCalledWith(methodName, String.class, dateLiteral);
    }

    @IsTest
    private static void testGetServiceSessionsByStartDateWithException() {
        final String methodName = 'getServiceSessionsByStartDate';
        final String dateLiteral = 'THIS_WEEK';

        serviceStub.withThrowException(methodName, String.class);

        Test.startTest();
        RecentServiceSessionController.serviceSessionService = (ServiceSessionService) serviceStub.createMock();

        final Map<String, List<ServiceSession__c>> actual;
        Exception actualException;

        try {
            actual = RecentServiceSessionController.getServiceSessionsByStartDate(
                dateLiteral
            );
        } catch (Exception e) {
            actualException = e;
        }

        Test.stopTest();

        System.assertEquals(
            serviceStub.testExceptionMessage,
            actualException.getMessage(),
            'Expected the controller to rethrow the exception from the service.'
        );

        serviceStub.assertCalledWith(methodName, String.class, dateLiteral);
    }

    @IsTest
    private static void testGetServiceSessionsByStartDateWithDateLiteralNotInMap() {
        final String methodName = 'getServiceSessionsByStartDate';
        final String dateLiteral = 'TEST';

        Map<String, List<ServiceSession__c>> expected;

        serviceStub.withReturnValue(methodName, String.class, expected);

        Test.startTest();
        RecentServiceSessionController.serviceSessionService = (ServiceSessionService) serviceStub.createMock();

        final Map<String, List<ServiceSession__c>> actual = RecentServiceSessionController.getServiceSessionsByStartDate(
            dateLiteral
        );

        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'Expected actual value to be null with an invalid date literal'
        );
    }

    @IsTest
    private static void testGetMenuOptions() {
        final String methodName = 'getMenuOptions';

        Map<String, String> expected = RecentServiceSessionController.DATE_LITERAL_OPTIONS;

        Test.startTest();

        final Map<String, String> actual = RecentServiceSessionController.getMenuOptions();

        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'Actual dateliteral options not the same as expected dateLiteral options'
        );
    }

    @IsTest
    private static void testGetCompleteServiceSessionStatuses() {
        String methodName = 'getServiceSessionStatusBuckets';
        Map<String, List<String>> expectedStatusesToReturn = new Map<String, List<String>>();
        expectedStatusesToReturn.put('Complete', new List<String>{ 'Complete' });
        expectedStatusesToReturn.put('Pending', new List<String>{ 'Pending' });

        TestStub serviceSessionServiceStub = new StubBuilder(ServiceSessionService.class)
            .when(methodName)
            .called()
            .thenReturn(expectedStatusesToReturn)
            .build();

        RecentServiceSessionController.serviceSessionService = (ServiceSessionService) serviceSessionServiceStub.create();

        Test.startTest();
        Map<String, List<String>> returnedStatuses = new Map<String, List<String>>();
        returnedStatuses = RecentServiceSessionController.getServiceSessionStatusBuckets();

        Test.stopTest();

        System.assertEquals(
            expectedStatusesToReturn,
            returnedStatuses,
            'Expected the controller to return list delivered by service.'
        );
        serviceSessionServiceStub.assertCalledAsExpected();
    }

    @IsTest
    private static void testGetCompleteServiceSessionStatusesWithException() {
        String methodName = 'getServiceSessionStatusBuckets';
        Exception actualException;

        TestStub serviceSessionServiceStub = new StubBuilder(ServiceSessionService.class)
            .when(methodName)
            .called()
            .thenThrowException()
            .build();

        RecentServiceSessionController.serviceSessionService = (ServiceSessionService) serviceSessionServiceStub.create();

        Test.startTest();
        try {
            RecentServiceSessionController.getServiceSessionStatusBuckets();
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
