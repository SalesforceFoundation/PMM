/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */
@IsTest
public with sharing class RollupRecord_TEST {
    private static Id mockRecordId = TestUtil.mockId(Contact.SObjectType);
    private static RollupRecord record = new RollupRecord(mockRecordId);

    @IsTest
    private static void shouldBeProcessedByDefault() {
        Test.startTest();
        System.assert(
            record.getIsProcessed(),
            'Expected is processed to default to true.'
        );
        Test.stopTest();
    }

    @IsTest
    private static void shouldNotBeProcessedWhenTotalSetByDefault() {
        record.setTotalRecords(1);

        Test.startTest();
        System.assert(
            !record.getIsProcessed(),
            'Expected is processed to default to false when total record count is provided.'
        );
        Test.stopTest();
    }

    @IsTest
    private static void shouldBeProcessedWhenTotalRecordsEqualsTotalProcessed() {
        record.setTotalRecords(1);
        record.totalProcessed = 1;

        Test.startTest();
        System.assert(
            record.getIsProcessed(),
            'Expected is processed to return true when total processed equals total records.'
        );
        Test.stopTest();
    }

    @IsTest
    private static void shouldIncrementProcessed() {
        System.assertEquals(
            0,
            record.totalProcessed,
            'Sanity check: Expected the default number processed to be zero.'
        );

        Test.startTest();
        record.incrementProcessed();
        Test.stopTest();

        System.assertEquals(
            1,
            record.totalProcessed,
            'Expected the number processed to be 1.'
        );
    }

    @IsTest
    private static void shouldIncrementPresentWhenFieldIsPresent() {
        record.numPresentField = Contact.NumPresentServiceDeliveries__c;
        System.assertEquals(
            null,
            record.presentCount,
            'Sanity check: Expected the number present to be null by default.'
        );

        Test.startTest();
        record.processPresent();
        Test.stopTest();

        System.assertEquals(
            1,
            record.presentCount,
            'Expected the number present to be 1.'
        );
    }

    @IsTest
    private static void shouldNotIncrementPresentWhenFieldIsNotPresent() {
        System.assertEquals(
            null,
            record.presentCount,
            'Sanity check: Expected the number present to be null by default.'
        );

        Test.startTest();
        record.processPresent();
        Test.stopTest();

        System.assertEquals(
            null,
            record.presentCount,
            'Expected the number present to be null when number field is not present.'
        );
    }

    @IsTest
    private static void shouldIncrementAbsentWhenFieldIsPresent() {
        record.numAbsentField = Contact.NumAbsentServiceDeliveries__c;
        System.assertEquals(
            null,
            record.absentCount,
            'Sanity check: Expected the number absent to be null by default.'
        );

        Test.startTest();
        record.processAbsent(System.today());
        Test.stopTest();

        System.assertEquals(1, record.absentCount, 'Expected the number absent to be 1.');
    }

    @IsTest
    private static void shouldNotIncrementAbsentWhenFieldIsNotPresent() {
        System.assertEquals(
            null,
            record.absentCount,
            'Sanity check: Expected the number absent to be null by default.'
        );

        Test.startTest();
        record.processAbsent(System.today());
        Test.stopTest();

        System.assertEquals(
            null,
            record.absentCount,
            'Expected the number absent to be null when number field is not absent.'
        );
    }

    @IsTest
    private static void shouldUpdateLastServiceDateWhenFieldIsPresent() {
        Date dateToday = System.today();
        record.lastServiceDateField = Contact.NumAbsentServiceDeliveries__c;
        System.assertEquals(
            null,
            record.lastServiceDate,
            'Sanity check: Expected the last service date to be null by default.'
        );

        Test.startTest();
        record.updateLastServiceDate(dateToday);
        Test.stopTest();

        System.assertEquals(
            dateToday,
            record.lastServiceDate,
            'Expected the date to be updated.'
        );
    }

    @IsTest
    private static void shouldUpdateLastServiceDateWhenDateIsGreater() {
        Date dateToday = System.today();
        Date yesterday = System.today().addDays(-1);
        record.lastServiceDateField = Contact.NumAbsentServiceDeliveries__c;
        record.lastServiceDate = yesterday;

        Test.startTest();
        record.updateLastServiceDate(dateToday);
        Test.stopTest();

        System.assertEquals(
            dateToday,
            record.lastServiceDate,
            'Expected the date to be updated.'
        );
    }
    @IsTest
    private static void shouldNotUpdateLastServiceDateWhenDateIsLess() {
        Date dateToday = System.today();
        Date tomorrow = System.today().addDays(1);
        record.lastServiceDateField = Contact.NumAbsentServiceDeliveries__c;
        record.lastServiceDate = tomorrow;

        Test.startTest();
        record.updateLastServiceDate(dateToday);
        Test.stopTest();

        System.assertEquals(
            tomorrow,
            record.lastServiceDate,
            'Expected the date not to have been updated.'
        );
    }

    @IsTest
    private static void shouldNotUpdateLastServiceDateWhenFieldIsNotAbsent() {
        Date dateToday = System.today();
        System.assertEquals(
            null,
            record.lastServiceDate,
            'Sanity check: Expected the last service date to be null by default.'
        );

        Test.startTest();
        record.updateLastServiceDate(dateToday);
        Test.stopTest();

        System.assertEquals(
            null,
            record.lastServiceDate,
            'Expected the last service date to be null when number field is not absent.'
        );
    }

    @IsTest
    private static void shouldSetCorrespondingFields() {
        System.assertEquals(
            null,
            record.numAbsentField,
            'Sanity check: numAbsentField should be null by default.'
        );
        System.assertEquals(
            null,
            record.numPresentField,
            'Sanity check: numPresentField should be null by default.'
        );
        System.assertEquals(
            null,
            record.consecutiveAbsencesField,
            'Sanity check: consecutiveAbsencesField should be null by default.'
        );
        System.assertEquals(
            null,
            record.lastServiceDateField,
            'Sanity check: lastServiceDateField should be null by default.'
        );

        Test.startTest();
        setRollupFields();
        Test.stopTest();

        System.assertEquals(
            Contact.NumAbsentServiceDeliveries__c,
            record.numAbsentField,
            'numAbsentField should be set.'
        );
        System.assertEquals(
            Contact.NumPresentServiceDeliveries__c,
            record.numPresentField,
            'numPresentField should be set.'
        );
        System.assertEquals(
            Contact.ConsecutiveAbsences__c,
            record.consecutiveAbsencesField,
            'consecutiveAbsencesField should be set.'
        );
        System.assertEquals(
            Contact.LastServiceDate__c,
            record.lastServiceDateField,
            'lastServiceDateField should be set.'
        );
    }

    @IsTest
    private static void shouldNotBeModifiedWhenAllFieldsMatch() {
        Date yesterday = System.today().addDays(-1);
        Contact originalContact = new Contact(
            NumAbsentServiceDeliveries__c = 1,
            NumPresentServiceDeliveries__c = 1,
            ConsecutiveAbsences__c = 0,
            LastServiceDate__c = yesterday
        );

        setRollupFields();
        record.presentCount = 1;
        record.absentCount = 1;
        record.consecutiveCount = 0;
        record.lastServiceDate = yesterday;

        Test.startTest();
        System.assert(
            !record.isModified(originalContact),
            'Did not expect the Contact to have been modified.'
        );
        Test.stopTest();
    }

    @IsTest
    private static void shouldBeModifiedWhenFieldsDoNotMatch() {
        Date yesterday = System.today().addDays(-1);
        Contact originalContact = new Contact(
            NumAbsentServiceDeliveries__c = 1,
            NumPresentServiceDeliveries__c = 1,
            ConsecutiveAbsences__c = 0,
            LastServiceDate__c = yesterday
        );

        setRollupFields();
        record.presentCount = 1;
        record.absentCount = 1;
        record.consecutiveCount = 0;
        record.lastServiceDate = System.today();

        Test.startTest();
        System.assert(
            record.isModified(originalContact),
            'Expected the Contact to have been modified.'
        );
        Test.stopTest();
    }

    @IsTest
    private static void shouldCreateSObjectWithMatchingFieldValues() {
        Date yesterday = System.today().addDays(-1);
        SObject matchingContact = new Contact(
            Id = mockRecordId,
            NumPresentServiceDeliveries__c = 1,
            NumAbsentServiceDeliveries__c = 1,
            ConsecutiveAbsences__c = 0,
            LastServiceDate__c = yesterday
        );

        setRollupFields();
        record.presentCount = 1;
        record.absentCount = 1;
        record.consecutiveCount = 0;
        record.lastServiceDate = yesterday;

        Test.startTest();
        System.assertEquals(
            String.valueOf(matchingContact),
            String.valueOf(record.getSObject()),
            'Expected the records to match.'
        );
        Test.stopTest();
    }

    ////////// Helpers //////////

    private static void setRollupFields() {
        record.rollupFields(
            Contact.NumAbsentServiceDeliveries__c,
            Contact.NumPresentServiceDeliveries__c,
            Contact.ConsecutiveAbsences__c,
            Contact.LastServiceDate__c
        );
    }
}
