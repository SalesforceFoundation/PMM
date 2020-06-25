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

    @IsTest
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

    @IsTest
    private static void testGetServicesByProgramEngagementIds() {
        Id programEngagementId = TestUtil.mockId(ProgramEngagement__c.SObjectType);

        List<Object> expected = new List<Object>();

        serviceStub.withReturnValue(
            'getServicesByProgramEngagementId',
            Id.class,
            expected
        );

        Test.startTest();
        ServiceDeliveryController.service = (ServiceService) serviceStub.createMock();

        final List<Object> actual = ServiceDeliveryController.getServicesByProgramEngagementId(
            programEngagementId
        );

        Test.stopTest();

        System.assertEquals(
            expected.size(),
            actual.size(),
            'Expected the controller to return the list returned by the service'
        );

        serviceStub.assertCalledWith(
            'getServicesByProgramEngagementId',
            Id.class,
            programEngagementId
        );
    }

    @IsTest
    private static void testGetServicesByProgramEngagementIdsException() {
        Id programEngagementId = TestUtil.mockId(ProgramEngagement__c.SObjectType);

        serviceStub.withThrowException('getServicesByProgramEngagementId', Id.class);

        Test.startTest();
        ServiceDeliveryController.service = (ServiceService) serviceStub.createMock();

        final List<Object> actual;
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

        System.assertEquals(null, actual);

        serviceStub.assertCalledWith(
            'getServicesByProgramEngagementId',
            Id.class,
            programEngagementId
        );
    }
}
