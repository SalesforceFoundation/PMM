/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@isTest
public with sharing class ServiceDeliveryController_TEST {
    @isTest
    private static void testGetFieldSet() {
        final List<Object> expected = new List<Object>();

        ServiceService_TEST.GetBulkFieldsMethod getBulkFieldsMethod = new ServiceService_Test.GetBulkFieldsMethod();
        getBulkFieldsMethod.returnValue = expected;

        final List<Stub.Method> expectedMethodsCalled = new List<Stub.Method>{
            getBulkFieldsMethod
        };

        Test.startTest();

        final Stub stub = new Stub(expectedMethodsCalled);

        ServiceDeliveryController.service = (ServiceService) Test.createStub(
            ServiceService.class,
            stub
        );

        final List<Object> actual = ServiceDeliveryController.getFieldSet();

        Test.stopTest();

        System.assertEquals(true, expected == actual);

        stub.assertMethodsCalled();
    }

    @isTest
    private static void testGetFieldSetWithException() {
        final List<Object> expected = new List<Object>();
        final String expectedExceptionMessage = 'Script-thrown exception';

        ServiceService_TEST.GetBulkFieldsMethod getBulkFieldsMethod = new ServiceService_Test.GetBulkFieldsMethod();
        getBulkFieldsMethod.returnValue = expected;
        getBulkFieldsMethod.setExceptionThrownBeforeReturningValue(
            expectedExceptionMessage
        );

        final List<Stub.Method> expectedMethodsCalled = new List<Stub.Method>{
            getBulkFieldsMethod
        };

        Test.startTest();

        final Stub stub = new Stub(expectedMethodsCalled);

        ServiceDeliveryController.service = (ServiceService) Test.createStub(
            ServiceService.class,
            stub
        );
        final List<Object> actual;
        Exception actualException;

        try {
            actual = ServiceDeliveryController.getFieldSet();
        } catch (Exception e) {
            actualException = e;
        }

        Test.stopTest();

        System.assertEquals(expectedExceptionMessage, actualException.getMessage());

        stub.assertMethodsCalled();
    }

    @isTest
    private static void testGetServicesAndEngagements() {
        Id contactId = Stub.generateFakeId(Schema.SObjectType.Contact);
        Map<String, List<Object>> expected = new Map<String, List<Object>>();
        expected.put('engagements', new List<Object>());
        expected.put('services', new List<Object>());

        ServiceService_TEST.GetServicesEngagementsByContactIdMethod getServicesEngagementsByContactIdMethod = new ServiceService_TEST.GetServicesEngagementsByContactIdMethod();
        getServicesEngagementsByContactIdMethod.contactId = contactId;
        getServicesEngagementsByContactIdMethod.returnValue = expected;

        final List<Stub.Method> expectedMethodsCalled = new List<Stub.Method>{
            getServicesEngagementsByContactIdMethod
        };

        Test.startTest();

        final Stub stub = new Stub(expectedMethodsCalled);

        ServiceDeliveryController.service = (ServiceService) Test.createStub(
            ServiceService.class,
            stub
        );

        final Map<String, Object> actual = ServiceDeliveryController.getServicesAndEngagements(
            contactId
        );

        Test.stopTest();

        Set<String> expectedKeySet = new Set<String>{ 'engagements', 'services' };
        System.assertEquals(expectedKeySet, actual.keySet());

        // Assert the actual methods called by Stub Provider equal the expected methods called.
        stub.assertMethodsCalled();
    }

    @isTest
    private static void testGetServicesAndEngagementsWithException() {
        Id contactId = Stub.generateFakeId(Schema.SObjectType.Contact);
        Map<String, List<Object>> expected = new Map<String, List<Object>>();
        expected.put('engagements', new List<Object>());
        expected.put('services', new List<Object>());
        final String expectedExceptionMessage = 'Script-thrown exception';

        ServiceService_TEST.GetServicesEngagementsByContactIdMethod getServicesEngagementsByContactIdMethod = new ServiceService_TEST.GetServicesEngagementsByContactIdMethod();
        getServicesEngagementsByContactIdMethod.contactId = contactId;
        getServicesEngagementsByContactIdMethod.returnValue = expected;
        getServicesEngagementsByContactIdMethod.setExceptionThrownBeforeReturningValue(
            expectedExceptionMessage
        );

        final List<Stub.Method> expectedMethodsCalled = new List<Stub.Method>{
            getServicesEngagementsByContactIdMethod
        };

        Test.startTest();

        final Stub stub = new Stub(expectedMethodsCalled);

        ServiceDeliveryController.service = (ServiceService) Test.createStub(
            ServiceService.class,
            stub
        );

        final Map<String, List<Object>> actual;
        Exception actualException;

        try {
            actual = ServiceDeliveryController.getServicesAndEngagements(contactId);
        } catch (Exception e) {
            actualException = e;
        }

        Test.stopTest();

        System.assertEquals(expectedExceptionMessage, actualException.getMessage());

        stub.assertMethodsCalled();
    }
}
