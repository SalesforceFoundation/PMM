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
    private static BasicStub selectorStub = new BasicStub(ServiceDeliverySelector.class);
    private static BasicStub domainStub = new BasicStub(ServiceDeliveryDomain.class);
    private static BasicStub validatorStub = new BasicStub(PermissionValidator.class);

    @IsTest
    private static void testCanDeleteServiceDeliveriesWithAccess() {
        validatorStub.withReturnValue(
            'hasObjectAccess',
            new List<Type>{ SObjectType.class, PermissionValidator.CRUDAccessType.class },
            true
        );

        Test.startTest();
        PermissionValidator.instance = (PermissionValidator) validatorStub.createMock();
        Boolean hasAccess = ServiceDeliveryController.canDeleteServiceDeliveries();
        Test.stopTest();

        System.assert(
            hasAccess,
            'Controller should allow delete when user has delete access on object.'
        );

        validatorStub.assertCalledWith(
            'hasObjectAccess',
            new List<Type>{ SObjectType.class, PermissionValidator.CRUDAccessType.class },
            new List<Object>{
                ServiceDelivery__c.SObjectType,
                PermissionValidator.CRUDAccessType.DELETEABLE
            }
        );
    }

    @IsTest
    private static void testCanDeleteServiceDeliveriesNoAccess() {
        validatorStub.withReturnValue(
            'hasObjectAccess',
            new List<Type>{ SObjectType.class, PermissionValidator.CRUDAccessType.class },
            false
        );

        Test.startTest();
        PermissionValidator.instance = (PermissionValidator) validatorStub.createMock();
        Boolean hasAccess = ServiceDeliveryController.canDeleteServiceDeliveries();
        Test.stopTest();

        System.assert(
            !hasAccess,
            'Controller should NOT allow delete when user lacks delete access on object.'
        );

        validatorStub.assertCalledWith(
            'hasObjectAccess',
            new List<Type>{ SObjectType.class, PermissionValidator.CRUDAccessType.class },
            new List<Object>{
                ServiceDelivery__c.SObjectType,
                PermissionValidator.CRUDAccessType.DELETEABLE
            }
        );
    }

    @IsTest
    private static void testCanDeleteServiceDeliveriesException() {
        validatorStub.withThrowException(
            'hasObjectAccess',
            new List<Type>{ SObjectType.class, PermissionValidator.CRUDAccessType.class }
        );

        Test.startTest();
        PermissionValidator.instance = (PermissionValidator) validatorStub.createMock();
        Exception actualException;
        try {
            Boolean hasAccess = ServiceDeliveryController.canDeleteServiceDeliveries();
        } catch (Exception e) {
            actualException = e;
        }
        Test.stopTest();

        System.assertEquals(
            validatorStub.testExceptionMessage,
            actualException.getMessage(),
            'Expected the controller to rethrow the exception from the validator.'
        );

        validatorStub.assertCalledWith(
            'hasObjectAccess',
            new List<Type>{ SObjectType.class, PermissionValidator.CRUDAccessType.class },
            new List<Object>{
                ServiceDelivery__c.SObjectType,
                PermissionValidator.CRUDAccessType.DELETEABLE
            }
        );
    }

    @IsTest
    private static void testDeleteServiceDeliveriesForSessionException() {
        List<ServiceDelivery__c> expectedServiceDeliveries = new List<ServiceDelivery__c>{
            new ServiceDelivery__c(
                Name = 'Test1',
                Id = TestUtil.mockId(ServiceDelivery__c.SObjectType)
            ),
            new ServiceDelivery__c(
                Name = 'Test2',
                Id = TestUtil.mockId(ServiceDelivery__c.SObjectType)
            ),
            new ServiceDelivery__c(
                Name = 'Test3',
                Id = TestUtil.mockId(ServiceDelivery__c.SObjectType)
            )
        };
        Id sessionId = TestUtil.mockId(ServiceSession__c.SObjectType);
        selectorStub.withReturnValue(
            'getServiceDeliveriesForSession',
            Id.class,
            expectedServiceDeliveries
        );

        domainStub.withThrowException(
            'deleteServiceDeliveries',
            List<ServiceDelivery__c>.class
        );

        Test.startTest();
        ServiceDeliveryController.deliverySelector = (ServiceDeliverySelector) selectorStub.createMock();
        ServiceDeliveryController.deliveryDomain = (ServiceDeliveryDomain) domainStub.createMock();

        Exception actualException;
        try {
            final Integer actualNumberDeleted = ServiceDeliveryController.deleteServiceDeliveriesForSession(
                sessionId
            );
        } catch (Exception e) {
            actualException = e;
        }
        Test.stopTest();

        System.assertEquals(
            domainStub.testExceptionMessage,
            actualException.getMessage(),
            'Expected the controller to rethrow the exception from the domain.'
        );
        domainStub.assertCalledWith(
            'deleteServiceDeliveries',
            List<ServiceDelivery__c>.class,
            expectedServiceDeliveries
        );
        selectorStub.assertCalledWith(
            'getServiceDeliveriesForSession',
            Id.class,
            sessionId
        );
    }

    @IsTest
    private static void testGetNumberOfServiceDeliveriesForSessionException() {
        Id sessionId = TestUtil.mockId(ServiceSession__c.SObjectType);
        selectorStub.withThrowException(
            'getNumberOfServiceDeliveriesForSession',
            Id.class
        );

        Test.startTest();
        ServiceDeliveryController.deliverySelector = (ServiceDeliverySelector) selectorStub.createMock();
        Exception actualException;
        try {
            final Integer actualNumberOfDeliveries = ServiceDeliveryController.getNumberOfServiceDeliveriesForSession(
                sessionId
            );
        } catch (Exception e) {
            actualException = e;
        }
        Test.stopTest();

        System.assertEquals(
            selectorStub.testExceptionMessage,
            actualException.getMessage(),
            'Expected the controller to rethrow the exception from the selector.'
        );

        selectorStub.assertCalledWith(
            'getNumberOfServiceDeliveriesForSession',
            Id.class,
            sessionId
        );
    }

    @IsTest
    private static void testDeleteServiceDeliveriesForSession() {
        List<ServiceDelivery__c> expectedServiceDeliveries = new List<ServiceDelivery__c>{
            new ServiceDelivery__c(
                Name = 'Test1',
                Id = TestUtil.mockId(ServiceDelivery__c.SObjectType)
            ),
            new ServiceDelivery__c(
                Name = 'Test2',
                Id = TestUtil.mockId(ServiceDelivery__c.SObjectType)
            ),
            new ServiceDelivery__c(
                Name = 'Test3',
                Id = TestUtil.mockId(ServiceDelivery__c.SObjectType)
            )
        };
        Id sessionId = TestUtil.mockId(ServiceSession__c.SObjectType);
        selectorStub.withReturnValue(
            'getServiceDeliveriesForSession',
            Id.class,
            expectedServiceDeliveries
        );

        domainStub.withReturnValue(
            'deleteServiceDeliveries',
            List<ServiceDelivery__c>.class,
            null
        );

        Test.startTest();
        ServiceDeliveryController.deliverySelector = (ServiceDeliverySelector) selectorStub.createMock();
        ServiceDeliveryController.deliveryDomain = (ServiceDeliveryDomain) domainStub.createMock();
        final Integer actualNumberDeleted = ServiceDeliveryController.deleteServiceDeliveriesForSession(
            sessionId
        );
        Test.stopTest();

        System.assertEquals(
            expectedServiceDeliveries.size(),
            actualNumberDeleted,
            'The controller should return the expected count of deliveries that were deleted'
        );
        domainStub.assertCalledWith(
            'deleteServiceDeliveries',
            List<ServiceDelivery__c>.class,
            expectedServiceDeliveries
        );
        selectorStub.assertCalledWith(
            'getServiceDeliveriesForSession',
            Id.class,
            sessionId
        );
    }

    @IsTest
    private static void testUpsertServiceDeliveries() {
        List<ServiceDelivery__c> serviceDeliveries = new List<ServiceDelivery__c>{
            new ServiceDelivery__c(
                Name = 'Test1',
                Id = TestUtil.mockId(ServiceDelivery__c.SObjectType)
            ),
            new ServiceDelivery__c(
                Name = 'Test2',
                Id = TestUtil.mockId(ServiceDelivery__c.SObjectType)
            ),
            new ServiceDelivery__c(
                Name = 'Test3',
                Id = TestUtil.mockId(ServiceDelivery__c.SObjectType)
            )
        };

        domainStub.withReturnValue(
            'upsertServiceDeliveries',
            new List<Type>{ List<Database.UpsertResult>.class, Boolean.class },
            null
        );

        Test.startTest();
        ServiceDeliveryController.deliveryDomain = (ServiceDeliveryDomain) domainStub.createMock();
        ServiceDeliveryController.upsertServiceDeliveries(serviceDeliveries, false);
        Test.stopTest();

        domainStub.assertCalledWith(
            'upsertServiceDeliveries',
            new List<Type>{ List<ServiceDelivery__c>.class, Boolean.class },
            new List<Object>{ serviceDeliveries, false }
        );
    }

    @IsTest
    private static void testUpsertServiceDeliveriesException() {
        List<ServiceDelivery__c> serviceDeliveries = new List<ServiceDelivery__c>{
            new ServiceDelivery__c(
                Name = 'Test1',
                Id = TestUtil.mockId(ServiceDelivery__c.SObjectType)
            ),
            new ServiceDelivery__c(
                Name = 'Test2',
                Id = TestUtil.mockId(ServiceDelivery__c.SObjectType)
            ),
            new ServiceDelivery__c(
                Name = 'Test3',
                Id = TestUtil.mockId(ServiceDelivery__c.SObjectType)
            )
        };

        domainStub.withThrowException(
            'upsertServiceDeliveries',
            new List<Type>{ List<ServiceDelivery__c>.class, Boolean.class }
        );

        Test.startTest();
        ServiceDeliveryController.deliveryDomain = (ServiceDeliveryDomain) domainStub.createMock();

        Exception actualException;
        try {
            ServiceDeliveryController.upsertServiceDeliveries(serviceDeliveries, false);
        } catch (Exception e) {
            actualException = e;
        }
        Test.stopTest();

        System.assertEquals(
            domainStub.testExceptionMessage,
            actualException.getMessage(),
            'Expected the controller to rethrow the exception from the domain.'
        );
        domainStub.assertCalledWith(
            'upsertServiceDeliveries',
            new List<Type>{ List<ServiceDelivery__c>.class, Boolean.class },
            new List<Object>{ serviceDeliveries, false }
        );
    }

    @IsTest
    private static void testGetNumberOfServiceDeliveriesForSession() {
        Integer expectedNumberOfDeliveries = 5;
        Id sessionId = TestUtil.mockId(ServiceSession__c.SObjectType);
        selectorStub.withReturnValue(
            'getNumberOfServiceDeliveriesForSession',
            Id.class,
            expectedNumberOfDeliveries
        );

        Test.startTest();
        ServiceDeliveryController.deliverySelector = (ServiceDeliverySelector) selectorStub.createMock();
        final Integer actualNumberOfDeliveries = ServiceDeliveryController.getNumberOfServiceDeliveriesForSession(
            sessionId
        );
        Test.stopTest();

        System.assertEquals(
            expectedNumberOfDeliveries,
            actualNumberOfDeliveries,
            'The controller should return the expected count of deliveries'
        );
    }

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

    @IsTest
    private static void testGetServiceDeliveryFieldSets() {
        String methodName = 'getServiceDeliveryFieldSets';
        Test.startTest();

        ServiceDeliveryController.service = (ServiceService) serviceStub.createMock();
        ServiceDeliveryController.getServiceDeliveryFieldSets();

        Test.stopTest();

        serviceStub.assertCalled(methodName);
    }

    @IsTest
    private static void whenGetServiceDeliveryFieldSetsThrowsException() {
        String methodName = 'getServiceDeliveryFieldSets';

        serviceStub.withThrowException(methodName);

        Test.startTest();

        ServiceDeliveryController.service = (serviceService) serviceStub.createMock();

        Exception actualException;

        try {
            ServiceDeliveryController.getServiceDeliveryFieldSets();
        } catch (Exception e) {
            actualException = e;
        }

        Test.stopTest();

        System.assertEquals(
            true,
            actualException instanceof AuraHandledException,
            actualException
        );
        System.assertEquals(
            serviceStub.testExceptionMessage,
            actualException.getMessage()
        );

        serviceStub.assertCalled(methodName);
    }
}
