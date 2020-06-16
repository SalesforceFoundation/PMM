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

    @isTest
    private static void testGetServicesByProgramEngagementIds() {
        Id programEngagementId = TestUtil.mockId(ProgramEngagement__c.SObjectType);
        Id serviceId = TestUtil.mockId(Service__c.SObjectType);
        Id programId = TestUtil.mockId(Program__c.SObjectType);
        String name = 'service name';

        Map<String, String> expected = new Map<String, String>();
        expected.put('value', serviceId);
        expected.put('label', name);
        expected.put('program', programId);

        serviceStub.withReturnValue(
            'getServicesByProgramEngagementId',
            Id.class,
            expected
        );

        Test.startTest();
        ServiceDeliveryController.service = (ServiceService) serviceStub.createMock();

        final Map<String, String> actual = ServiceDeliveryController.getServicesByProgramEngagementId(
            programEngagementId
        );

        Test.stopTest();

        Set<String> expectedKeySet = new Set<String>{ 'value', 'label', 'program' };
        List<String> expectedValue = new List<String>{ serviceId, name, programId };

        System.assertEquals(expectedKeySet, actual.keySet());
        System.assertEquals(expectedValue, actual.values());

        serviceStub.assertCalledWith(
            'getServicesByProgramEngagementId',
            Id.class,
            programEngagementId
        );
    }

    @isTest
    private static void testGetServicesByProgramEngagementIdsException() {
        Id programEngagementId = TestUtil.mockId(ProgramEngagement__c.SObjectType);
        Id serviceId = TestUtil.mockId(Program__c.SObjectType);

        Map<String, String> expected = new Map<String, String>();
        expected.put('value', serviceId);

        serviceStub.withThrowException('getServicesByProgramEngagementId', Id.class);

        Test.startTest();
        ServiceDeliveryController.service = (ServiceService) serviceStub.createMock();

        final Map<String, String> actual;
        Exception actualException;

        try {
            actual = ServiceDeliveryController.getServicesByProgramEngagementId(
                programEngagementId
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

        serviceStub.assertCalledWith(
            'getServicesByProgramEngagementId',
            Id.class,
            programEngagementId
        );
    }
}
