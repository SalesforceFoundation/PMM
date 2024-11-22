/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
private with sharing class ServiceDeliveryDomain_TEST {
    private static BasicStub validatorStub = new BasicStub(PermissionValidator.class);

    @IsTest
    private static void shouldNotThrowExceptionWithoutDeletePermissionsOnEmptyList() {
        String methodName = 'hasObjectAccess';
        Integer dmlLimitAfter;
        Exception actualException;

        validatorStub.withReturnValue(
            methodName,
            new List<Type>{ SObjectType.class, PermissionValidator.CRUDAccessType.class },
            false
        );

        PermissionValidator.instance = (PermissionValidator) validatorStub.createMock();
        List<ServiceDelivery__c> serviceDeliveriesToDelete = new List<ServiceDelivery__c>();

        Test.startTest();
        try {
            new ServiceDeliveryDomain()
                .deleteServiceDeliveries(serviceDeliveriesToDelete);
            dmlLimitAfter = System.Limits.getDmlStatements();
        } catch (Exception ex) {
            actualException = ex;
        }
        Test.stopTest();

        System.assertEquals(
            null,
            actualException,
            'Did not expect the domain to throw the exception for an empty list.'
        );

        System.assertEquals(
            0,
            dmlLimitAfter,
            'Did not expect any dml statements for an empty list.'
        );
    }

    @IsTest
    private static void shouldDeleteServiceDeliveries() {
        TestDataFactory.generateServiceData();

        List<ServiceDelivery__c> existingServiceDeliveries = [
            SELECT Id, Name
            FROM ServiceDelivery__c
        ];

        Test.startTest();
        new ServiceDeliveryDomain().deleteServiceDeliveries(existingServiceDeliveries);
        Test.stopTest();

        List<ServiceDelivery__c> serviceDeliveriesAfter = [
            SELECT Id, Name
            FROM ServiceDelivery__c
        ];
        System.assertEquals(
            0,
            serviceDeliveriesAfter.size(),
            'Service Delivery reocords should have been deleted.'
        );
    }

    @IsTest
    private static void shouldThrowExceptionWhenDeletePermissionCheckFails() {
        String methodName = 'hasObjectAccess';
        Integer dmlLimitAfter;
        Exception actualException;

        validatorStub.withReturnValue(
            methodName,
            new List<Type>{ SObjectType.class, PermissionValidator.CRUDAccessType.class },
            false
        );

        PermissionValidator.instance = (PermissionValidator) validatorStub.createMock();
        List<ServiceDelivery__c> serviceDeliveriesToDelete = new List<ServiceDelivery__c>{
            new ServiceDelivery__c(Name = 'Test Upsert Failure.')
        };

        Test.startTest();
        try {
            new ServiceDeliveryDomain()
                .deleteServiceDeliveries(serviceDeliveriesToDelete);
        } catch (Exception ex) {
            dmlLimitAfter = System.Limits.getDmlStatements();
            actualException = ex;
        }
        Test.stopTest();

        System.assert(
            actualException instanceof ServiceDeliveryDomain.ServiceDeliveryDomainException,
            'Expected the domain to throw the exception.'
        );

        System.assertEquals(
            0,
            dmlLimitAfter,
            'Expected the exception to be thrown before any dml statements.'
        );
    }

    @IsTest
    private static void shouldUpsertServiceDeliveries() {
        TestDataFactory.generateServiceData();
        Service__c service = [SELECT Id FROM Service__c LIMIT 1];

        List<ServiceDelivery__c> existingServiceDeliveries = [
            SELECT Id, Name
            FROM ServiceDelivery__c
        ];
        for (ServiceDelivery__c delivery : existingServiceDeliveries) {
            System.assertNotEquals('Upserted', delivery.Name);
            delivery.Name = 'Upserted';
            delivery.AutonameOverride__c = true;
        }

        ServiceDelivery__c newServiceDelivery = new ServiceDelivery__c(
            Name = 'Upserted',
            AutonameOverride__c = true,
            Service__c = service.Id
        );

        List<ServiceDelivery__c> serviceDeliveriesToUpsert = new List<ServiceDelivery__c>();
        serviceDeliveriesToUpsert.addAll(existingServiceDeliveries);
        serviceDeliveriesToUpsert.add(newServiceDelivery);

        Test.startTest();
        new ServiceDeliveryDomain().upsertServiceDeliveries(serviceDeliveriesToUpsert);
        Test.stopTest();

        List<ServiceDelivery__c> serviceDeliveriesAfter = [
            SELECT Id, Name
            FROM ServiceDelivery__c
        ];
        System.assertEquals(
            existingServiceDeliveries.size() + 1,
            serviceDeliveriesAfter.size(),
            'One new record should be inserted.'
        );
        for (ServiceDelivery__c delivery : serviceDeliveriesAfter) {
            System.assertEquals(
                'Upserted',
                delivery.Name,
                'All records should be renamed.'
            );
        }
    }

    @IsTest
    private static void shouldReturnUpsertResultsOnUpsertServiceDeliveriesWithAllOrNone() {
        TestDataFactory.generateServiceData();
        Service__c service = [SELECT Id FROM Service__c LIMIT 1];

        List<ServiceDelivery__c> existingServiceDeliveries = [
            SELECT Id, Name
            FROM ServiceDelivery__c
        ];
        for (ServiceDelivery__c delivery : existingServiceDeliveries) {
            System.assertNotEquals('Upserted', delivery.Name);
            delivery.Name = 'Upserted';
            delivery.AutonameOverride__c = true;
        }

        ServiceDelivery__c newServiceDelivery = new ServiceDelivery__c(
            Name = 'Upserted',
            AutonameOverride__c = true,
            Service__c = service.Id
        );

        List<ServiceDelivery__c> serviceDeliveriesToUpsert = new List<ServiceDelivery__c>();
        serviceDeliveriesToUpsert.addAll(existingServiceDeliveries);
        serviceDeliveriesToUpsert.add(newServiceDelivery);

        Test.startTest();
        List<Database.UpsertResult> results = new ServiceDeliveryDomain()
            .upsertServiceDeliveries(serviceDeliveriesToUpsert, false);
        Test.stopTest();

        List<ServiceDelivery__c> serviceDeliveriesAfter = [
            SELECT Id, Name
            FROM ServiceDelivery__c
        ];
        System.assertEquals(
            existingServiceDeliveries.size() + 1,
            serviceDeliveriesAfter.size(),
            'One new record should be inserted.'
        );
        System.assertEquals(
            serviceDeliveriesAfter.size(),
            results.size(),
            'Results should be returned for each record upserted.'
        );
        for (ServiceDelivery__c delivery : serviceDeliveriesAfter) {
            System.assertEquals(
                'Upserted',
                delivery.Name,
                'All records should be renamed.'
            );
        }
    }

    @IsTest
    private static void shouldThrowExceptionWhenInsertPermissionCheckFails() {
        String methodName = 'hasObjectAccess';
        Integer dmlLimitAfter;
        Exception actualException;

        validatorStub.withReturnValue(
            methodName,
            new List<Type>{ SObjectType.class, PermissionValidator.CRUDAccessType.class },
            false
        );

        PermissionValidator.instance = (PermissionValidator) validatorStub.createMock();
        List<ServiceDelivery__c> serviceDeliveriesToUpsert = new List<ServiceDelivery__c>{
            new ServiceDelivery__c(Name = 'Test Upsert Failure.')
        };

        Test.startTest();
        try {
            new ServiceDeliveryDomain()
                .upsertServiceDeliveries(serviceDeliveriesToUpsert);
        } catch (Exception ex) {
            dmlLimitAfter = System.Limits.getDmlStatements();
            actualException = ex;
        }
        Test.stopTest();

        System.assert(
            actualException instanceof ServiceDeliveryDomain.ServiceDeliveryDomainException,
            'Expected the domain to throw the exception.'
        );

        System.assertEquals(
            0,
            dmlLimitAfter,
            'Expected the exception to be thrown before any dml statements.'
        );
    }

    @IsTest
    private static void shouldThrowExceptionWhenUpdatePermissionCheckFails() {
        String methodName = 'hasObjectAccess';
        Integer dmlLimitAfter;
        Exception actualException;

        validatorStub.withReturnValue(
            methodName,
            new List<Type>{ SObjectType.class, PermissionValidator.CRUDAccessType.class },
            false
        );

        PermissionValidator.instance = (PermissionValidator) validatorStub.createMock();
        List<ServiceDelivery__c> serviceDeliveriesToUpsert = new List<ServiceDelivery__c>{
            new ServiceDelivery__c(
                Id = TestUtil.mockId(ServiceDelivery__c.SObjectType),
                Name = 'Test Insert Failure.'
            )
        };

        Test.startTest();
        try {
            new ServiceDeliveryDomain()
                .upsertServiceDeliveries(serviceDeliveriesToUpsert);
        } catch (Exception ex) {
            dmlLimitAfter = System.Limits.getDmlStatements();
            actualException = ex;
        }
        Test.stopTest();

        System.assert(
            actualException instanceof ServiceDeliveryDomain.ServiceDeliveryDomainException,
            'Expected the domain to throw the exception.'
        );

        System.assertEquals(
            0,
            dmlLimitAfter,
            'Expected the exception to be thrown before any dml statements.'
        );
    }

    @IsTest
    private static void shouldNotThrowExceptionWithoutPermissionsOnEmptyList() {
        String methodName = 'hasObjectAccess';
        Integer dmlLimitAfter;
        Exception actualException;

        validatorStub.withReturnValue(
            methodName,
            new List<Type>{ SObjectType.class, PermissionValidator.CRUDAccessType.class },
            false
        );

        PermissionValidator.instance = (PermissionValidator) validatorStub.createMock();
        List<ServiceDelivery__c> serviceDeliveriesToUpsert = new List<ServiceDelivery__c>();

        Test.startTest();
        try {
            new ServiceDeliveryDomain()
                .upsertServiceDeliveries(serviceDeliveriesToUpsert);
            dmlLimitAfter = System.Limits.getDmlStatements();
        } catch (Exception ex) {
            actualException = ex;
        }
        Test.stopTest();

        System.assertEquals(
            null,
            actualException,
            'Did not expect the domain to throw the exception for an empty list.'
        );

        System.assertEquals(
            0,
            dmlLimitAfter,
            'Did not expect any dml statements for an empty list.'
        );
    }
}
