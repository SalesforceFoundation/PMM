/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class SystemAccess_TEST {
    private static SystemAccess systemAccess = new SystemAccess();
    private static Service__c serviceRecord;
    private static final String PRESENT_STATUS = 'Present';
    private static final String ABSENT_STATUS = 'UnExcused Absence';
    private static final String PRESENT_FIELD = 'NumPresentServiceDeliveries__c';
    private static final String ABSENT_FIELD = 'NumAbsentServiceDeliveries__c';

    @TestSetup
    private static void setupServiceSessionData() {
        TestUtil.turnOffFeatureGates();
        TestDataFactory.generateAttendanceData('Monthly');

        serviceRecord = [SELECT Id FROM Service__c LIMIT 1];

        List<ServiceDelivery__c> serviceDeliveries = new List<ServiceDelivery__c>();
        serviceDeliveries.add(
            new ServiceDelivery__c(
                Name = 'test',
                Service__c = serviceRecord.Id,
                Quantity__c = 10,
                AttendanceStatus__c = PRESENT_STATUS
            )
        );

        serviceDeliveries.add(
            new ServiceDelivery__c(
                Name = 'test Absent',
                Service__c = serviceRecord.Id,
                Quantity__c = 0,
                AttendanceStatus__c = ABSENT_STATUS
            )
        );

        insert serviceDeliveries;
    }

    @IsTest
    private static void shouldGetAllDeliveryRollupRecordsForStandardUser() {
        serviceRecord = [SELECT Id FROM Service__c LIMIT 1];

        User standardUser = TestUtil.getTestUser();
        List<ServiceDelivery__c> recordsWithAccess;

        System.runAs(standardUser) {
            recordsWithAccess = systemAccess.getDeliveryRecordsToRollup(
                String.valueOf(ServiceDelivery__c.Service__c),
                new Set<Id>{ serviceRecord.Id }
            );
        }

        System.assertEquals(
            3,
            recordsWithAccess.size(),
            'Expected the user to be able to bypass sharing.'
        );
    }

    @IsTest
    private static void shouldGetAllDeliveryRollupsCountsForStandardUser() {
        serviceRecord = [SELECT Id FROM Service__c LIMIT 1];

        User standardUser = TestUtil.getTestUser();
        Integer rollupCount;

        System.runAs(standardUser) {
            rollupCount = systemAccess.getDeliveryRollupsCount(
                'Service__c',
                serviceRecord.Id
            );
        }

        System.assertEquals(
            3,
            rollupCount,
            'Expected the user to be able to bypass sharing.'
        );
    }

    @IsTest
    private static void shouldUpdateUnsharedRecordByStandardUser() {
        String updatedName = 'Services R Us';
        serviceRecord = [SELECT Id, Name FROM Service__c LIMIT 1];
        System.assertNotEquals(
            updatedName,
            serviceRecord.Name,
            'The service record name was not as expected.'
        );
        serviceRecord.Name = updatedName;

        User standardUser = TestUtil.getTestUser();

        System.runAs(standardUser) {
            systemAccess.updateRecords(new List<SObject>{ serviceRecord });
        }

        serviceRecord = [SELECT Id, Name FROM Service__c LIMIT 1];
        System.assertEquals(
            updatedName,
            serviceRecord.Name,
            'The service record name was not as expected.'
        );
    }

    @IsTest
    private static void shouldGetAllRecordIdsForStandardUser() {
        serviceRecord = [SELECT Id FROM Service__c LIMIT 1];

        User standardUser = TestUtil.getTestUser();
        List<sObject> recordsWithAccess;

        System.runAs(standardUser) {
            recordsWithAccess = systemAccess.getRecordsById(
                Service__c.sObjectType,
                new Set<Id>{ serviceRecord.Id },
                new List<String>{ PRESENT_FIELD, ABSENT_FIELD }
            );
        }

        System.assertEquals(
            1,
            recordsWithAccess.size(),
            'Expected the user to be able to bypass sharing.'
        );
    }

    @IsTest
    private static void shouldGetDeliveryRollupsQueryForStandardUser() {
        serviceRecord = [SELECT Id FROM Service__c LIMIT 1];

        User standardUser = TestUtil.getTestUser();
        String rollupQuery;

        System.runAs(standardUser) {
            rollupQuery = systemAccess.getDeliveryRollupsQuery('Service__c');
        }

        System.assertNotEquals(null, rollupQuery, 'Expected the query to be returned.');
    }
}
