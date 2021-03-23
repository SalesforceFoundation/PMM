/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
/**
 * Utility methods for test classes
 */
public with sharing class TestUtil {
    private static BasicStub customMetadataSelectorStub = new BasicStub(
        CustomMetadataSelector.class
    );

    public static final String TEST_USER_EMAIL = 'temptestuser@caseplan.example.com';

    public static Integer counter {
        get {
            if (counter == null) {
                counter = 0;
            }
            counter++;

            return counter;
        }
        set;
    }

    public static Id mockId(SObjectType sObjType) {
        return mockIds(sObjType, 1)[0];
    }

    public static List<Id> mockIds(SObjectType sObjectType, Integer size) {
        String keyPrefix = sObjectType.getDescribe().getKeyPrefix();
        List<Id> ids = new List<Id>();

        for (Integer i = 0; i < size; i++) {
            Integer uniqueCounter = counter;
            ids.add(
                keyPrefix +
                '0'.repeat(12 - String.valueOf(uniqueCounter).length()) +
                uniqueCounter
            );
        }

        return ids;
    }

    public static User getTestUser() {
        // create user with no custom object permissions to test CRUD checks
        Profile p = [SELECT Id FROM Profile WHERE Name = 'Standard User'];
        User user = new User(
            Alias = 'standt',
            Email = TEST_USER_EMAIL,
            EmailEncodingKey = 'UTF-8',
            LastName = 'Testing',
            LanguageLocaleKey = 'en_US',
            LocaleSidKey = 'en_US',
            ProfileId = p.Id,
            TimeZoneSidKey = 'America/Chicago',
            UserName = TEST_USER_EMAIL
        );
        return user;
    }

    public static void turnOffFeatureGates() {
        // Stub turned off Feature Gates so we can insert Service Deliveries without triggers running
        customMetadataSelectorStub.withReturnValue(
            'getAllFeatureGates',
            new List<FeatureGate__mdt>{
                new FeatureGate__mdt(
                    DeveloperName = 'ServiceDeliveriesToContact',
                    IsActive__c = false
                ),
                new FeatureGate__mdt(
                    DeveloperName = 'ServiceDeliveriesToService',
                    IsActive__c = false
                ),
                new FeatureGate__mdt(
                    DeveloperName = 'ServiceDeliveriesToServiceSession',
                    IsActive__c = false
                ),
                new FeatureGate__mdt(
                    DeveloperName = 'ServiceDeliveriesToProgramEngagement',
                    IsActive__c = false
                )
            }
        );
        CustomMetadataSelector.instance = (CustomMetadataSelector) customMetadataSelectorStub.createMock();
    }
}
