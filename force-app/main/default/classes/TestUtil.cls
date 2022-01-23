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
    private static final Set<String> featureGateNames = new Set<String>{
        'ServiceDeliveriesToContact',
        'ServiceDeliveriesToService',
        'ServiceDeliveriesToServiceSession',
        'ServiceDeliveriesToProgramEngagement'
    };

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

    public static void turnOffFeatureGates(Set<String> developerNames) {
        // TestStub turned off Feature Gates so we can insert Service Deliveries without triggers running
        List<FeatureGate__mdt> featureGates = new List<FeatureGate__mdt>();
        for (String name : featureGateNames) {
            featureGates.add(
                new FeatureGate__mdt(
                    DeveloperName = name,
                    IsActive__c = !developerNames.contains(name)
                )
            );
        }

        TestStub customMetadataSelectorStub = new StubBuilder(
                CustomMetadataSelector.class
            )
            .when('getAllFeatureGates')
            .called()
            .thenReturn(featureGates)
            .build();

        CustomMetadataSelector.instance = (CustomMetadataSelector) customMetadataSelectorStub.create();
    }

    public static void turnOffFeatureGates() {
        turnOffFeatureGates(featureGateNames);
    }

    public class BucketedFieldBuilder extends RecordBuilder {
        public BucketedFieldBuilder() {
            super(BucketedField__mdt.SObjectType);
        }

        public BucketedFieldBuilder withDeveloperName(String developerName) {
            valuesByFieldName.put(
                String.valueOf(BucketedField__mdt.DeveloperName),
                developerName
            );
            return this;
        }

        public BucketedFieldBuilder withQualifiedApiName(String qualifiedApiName) {
            valuesByFieldName.put(
                String.valueOf(BucketedField__mdt.QualifiedApiName),
                qualifiedApiName
            );
            return this;
        }

        public BucketedFieldBuilder withField(String fieldApiName) {
            valuesByFieldName.put(
                String.valueOf(BucketedField__mdt.Field__c),
                fieldApiName
            );
            return this;
        }

        public BucketedFieldBuilder withObject(String objectApiName) {
            valuesByFieldName.put(
                String.valueOf(BucketedField__mdt.Object__c),
                objectApiName
            );
            return this;
        }
    }

    public class BucketedValueBuilder extends RecordBuilder {
        public BucketedValueBuilder() {
            super(BucketedValue__mdt.SObjectType);
        }

        public BucketedValueBuilder withDeveloperName(String developerName) {
            valuesByFieldName.put(
                String.valueOf(BucketedValue__mdt.DeveloperName),
                developerName
            );
            return this;
        }

        public BucketedValueBuilder withQualifiedApiName(String qualifiedApiName) {
            valuesByFieldName.put(
                String.valueOf(BucketedValue__mdt.QualifiedApiName),
                qualifiedApiName
            );
            return this;
        }

        public BucketedValueBuilder withBucket(String bucketName) {
            valuesByFieldName.put(
                String.valueOf(BucketedValue__mdt.Bucket__c),
                bucketName
            );
            return this;
        }

        public BucketedValueBuilder withValue(String value) {
            valuesByFieldName.put(String.valueOf(BucketedValue__mdt.Value__c), value);
            return this;
        }
    }

    public class BucketBuilder extends RecordBuilder {
        public BucketBuilder() {
            super(Bucket__mdt.SObjectType);
        }

        public BucketBuilder withDeveloperName(String developerName) {
            valuesByFieldName.put(
                String.valueOf(Bucket__mdt.DeveloperName),
                developerName
            );
            return this;
        }

        public BucketBuilder withQualifiedApiName(String qualifiedApiName) {
            valuesByFieldName.put(
                String.valueOf(Bucket__mdt.QualifiedApiName),
                qualifiedApiName
            );
            return this;
        }

        public BucketBuilder withBucketedField(BucketedField__mdt bucketedFieldRecord) {
            valuesByFieldName.put(
                Bucket__mdt.BucketedField__c.getDescribe().getRelationshipName(),
                bucketedFieldRecord
            );
            return withBucketedField(bucketedFieldRecord.Id);
        }

        public BucketBuilder withBucketedField(Id bucketedFieldId) {
            valuesByFieldName.put(
                String.valueOf(Bucket__mdt.BucketedField__c),
                bucketedFieldId
            );
            return this;
        }

        public BucketBuilder withBucketedValues(List<BucketedValue__mdt> values) {
            valuesByFieldName.put(
                Util.prefixNamespace('BucketedValues__r'),
                makeRelatedList(values)
            );
            return this;
        }
    }

    public virtual class RecordBuilder {
        protected Map<String, Object> valuesByFieldName = new Map<String, Object>();
        private String sObjectTypeName;

        public RecordBuilder(SObjectType sObjectType) {
            sObjectTypeName = String.valueOf(sObjectType);
        }

        public virtual RecordBuilder withMockId() {
            valuesByFieldName.put('Id', mockId(Bucket__mdt.SObjectType));
            return this;
        }

        public virtual RecordBuilder withId(Id actionItemId) {
            valuesByFieldName.put('Id', actionItemId);
            return this;
        }

        public virtual RecordBuilder withName(String name) {
            valuesByFieldName.put('Name', name);
            return this;
        }

        public virtual SObject build() {
            valuesByFieldName.put(
                'attributes',
                new Map<String, Object>{ 'type' => sObjectTypeName }
            );
            String jsonString = JSON.serialize(valuesByFieldName);

            return (SObject) JSON.deserialize(jsonString, SObject.class);
        }

        protected Map<String, Object> makeRelatedList(List<SObject> childRecords) {
            Map<String, Object> relatedList = new Map<String, Object>();
            relatedList.put('records', childRecords);
            relatedList.put('totalSize', childRecords.size());
            relatedList.put('done', true);

            return relatedList;
        }
    }
}
