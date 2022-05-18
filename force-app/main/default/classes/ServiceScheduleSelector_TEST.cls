/*
 *
 *  * Copyright (c) 2022, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class ServiceScheduleSelector_TEST {
    private static BasicStub permissionValidatorStub = new BasicStub(
        PermissionValidator.class
    );
    private static ServiceScheduleSelector scheduleSelector = new ServiceScheduleSelector();

    @TestSetup
    private static void createScheduleData() {
        TestDataFactory.generateServiceData();
        TestDataFactory.generateServiceScheduleData('Daily', System.today());
    }

    @IsTest
    private static void testgetServiceScheduleFromId() {
        ServiceSchedule__c expectedSchedule = [
            SELECT Id, Name
            FROM ServiceSchedule__c
            LIMIT 1
        ];

        Test.startTest();
        ServiceSchedule__c actualSchedule = scheduleSelector.getServiceScheduleFromId(
            expectedSchedule.Id
        );
        Test.stopTest();

        System.assertEquals(
            expectedSchedule.Id,
            actualSchedule.Id,
            'The Id of the returned record should match the record we requested'
        );

        System.assertEquals(
            expectedSchedule.Name,
            actualSchedule.Name,
            'The Name of the returned record should match the record we requested'
        );
    }

    @IsTest
    private static void testGetServiceScheduleNoAccess() {
        ServiceSchedule__c expectedSchedule = [SELECT Id FROM ServiceSchedule__c LIMIT 1];

        permissionValidatorStub.withReturnValue(
            'hasObjectAccess',
            new List<Type>{ SObjectType.class, PermissionValidator.CRUDAccessType.class },
            false
        );

        Test.startTest();
        PermissionValidator.instance = (PermissionValidator) permissionValidatorStub.createMock();
        ServiceSchedule__c actualSchedule = scheduleSelector.getServiceScheduleFromId(
            expectedSchedule.Id
        );
        Test.stopTest();

        System.assertEquals(
            null,
            actualSchedule,
            'Expected null ServiceSchedule__c since the user does not have access to the object'
        );

        permissionValidatorStub.assertCalledWith(
            'hasObjectAccess',
            new List<Type>{ SObjectType.class, PermissionValidator.CRUDAccessType.class },
            new List<Object>{
                ServiceSchedule__c.SObjectType,
                PermissionValidator.CRUDAccessType.READABLE
            }
        );
    }
}
