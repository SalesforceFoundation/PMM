/*
 *
 *  * Copyright (c) 2022, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class ServiceSessionDomain_TEST {
    private static ServiceSessionDomain domain = new ServiceSessionDomain();

    @IsTest
    private static void shouldUpdateServiceSession() {
        ServiceSession__c session = new ServiceSession__c(
            Name = 'Testing Update Sessions'
        );
        insert session;

        ServiceSession__c sessionToUpdate = new ServiceSession__c(
            Id = session.Id,
            Name = 'Updated name.'
        );
        domain.updateServiceSession(sessionToUpdate);

        ServiceSession__c queriedSession = [
            SELECT Name
            FROM ServiceSession__c
            WHERE Id = :session.Id
        ];

        System.assertEquals(
            sessionToUpdate.Name,
            queriedSession.Name,
            'Expected the name to have been updated.'
        );
        System.assertNotEquals(
            session.Name,
            queriedSession.Name,
            'Expected the name to have been updated.'
        );
    }

    @IsTest
    private static void shouldThrowUpsertExceptionWithoutPermissions() {
        Exception actualException;
        ServiceSession__c session = new ServiceSession__c(
            Name = 'Testing Update Sessions'
        );
        insert session;

        ServiceSession__c sessionToUpdate = new ServiceSession__c(
            Id = session.Id,
            Name = 'Updated name.'
        );

        BasicStub permissionValidatorStub = new BasicStub(PermissionValidator.class);
        permissionValidatorStub.withReturnValue(
            'hasObjectAccess',
            new List<Type>{ SObjectType.class, PermissionValidator.CRUDAccessType.class },
            false
        );
        PermissionValidator.instance = (PermissionValidator) permissionValidatorStub.createMock();

        Test.startTest();
        try {
            domain.updateServiceSession(sessionToUpdate);
        } catch (Exception ex) {
            actualException = ex;
        }

        System.assertEquals(
            System.Label.UpsertOperationException,
            actualException.getMessage(),
            'Expected the upsert operation exception to have been thrown.'
        );
    }
}
