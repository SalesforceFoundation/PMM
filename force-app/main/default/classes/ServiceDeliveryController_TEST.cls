/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class ServiceDeliveryController_TEST {
    private static BasicStub serviceStub = new BasicStub(ServiceService.class);

    @IsTest
    private static void testGetFieldSet() {
        final List<Object> expected = new List<Object>();
        serviceStub.withReturnValue('getBulkFields', expected);

        Test.startTest();

        ServiceDeliveryController.service = (ServiceService) serviceStub.createMock();

        final List<Object> actual = ServiceDeliveryController.getFieldSet();

        Test.stopTest();

        System.assertEquals(
            true,
            expected === actual,
            'Expected the controller to return the field set from the service.'
        );
        serviceStub.assertCalled('getBulkFields');
    }

    @isTest
    private static void testGetFieldSetWithException() {
        final List<Object> expected = new List<Object>();
        serviceStub.withThrowException('getBulkFields');

        Test.startTest();

        ServiceDeliveryController.service = (ServiceService) serviceStub.createMock();
        final List<Object> actual;
        Exception actualException;

        try {
            actual = ServiceDeliveryController.getFieldSet();
        } catch (Exception e) {
            actualException = e;
        }

        Test.stopTest();

        System.assertEquals(
            serviceStub.testExceptionMessage,
            actualException.getMessage(),
            'Expected the controller to rethrow the exception from the service'
        );

        serviceStub.assertCalled('getBulkFields');
    }

    @isTest
    private static void testGetServicesAndEngagements() {
        Id contactId = TestUtil.mockId(Contact.SObjectType);
        Map<String, List<Object>> expected = new Map<String, List<Object>>();
        expected.put('engagements', new List<Object>());
        expected.put('services', new List<Object>());

        serviceStub.withReturnValue(
            'getServicesEngagementsByContactId',
            Id.class,
            expected
        );

        Test.startTest();
        ServiceDeliveryController.service = (ServiceService) serviceStub.createMock();

        final Map<String, Object> actual = ServiceDeliveryController.getServicesAndEngagements(
            contactId
        );

        Test.stopTest();

        Set<String> expectedKeySet = new Set<String>{ 'engagements', 'services' };
        System.assertEquals(expectedKeySet, actual.keySet());

        serviceStub.assertCalledWith(
            'getServicesEngagementsByContactId',
            Id.class,
            contactId
        );
    }

    @isTest
    private static void testGetServicesAndEngagementsWithException() {
        Id contactId = TestUtil.mockId(Contact.SObjectType);
        Map<String, List<Object>> expected = new Map<String, List<Object>>();
        expected.put('engagements', new List<Object>());
        expected.put('services', new List<Object>());
        serviceStub.withThrowException('getServicesEngagementsByContactId', Id.class);

        Test.startTest();
        ServiceDeliveryController.service = (ServiceService) serviceStub.createMock();

        final Map<String, List<Object>> actual;
        Exception actualException;

        try {
            actual = ServiceDeliveryController.getServicesAndEngagements(contactId);
        } catch (Exception e) {
            actualException = e;
        }

        Test.stopTest();

        System.assertEquals(
            serviceStub.testExceptionMessage,
            actualException.getMessage(),
            'Expected the controller to rethrow the exception from the service.'
        );

        serviceStub.assertCalledWith(
            'getServicesEngagementsByContactId',
            Id.class,
            contactId
        );
    }
}
