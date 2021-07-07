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
    private static RollupRecord rollupRecord = new RollupRecord(mockRecordId);

    @IsTest
    private static void shouldBeProcessedByDefault() {
        Test.startTest();
        System.assert(
            rollupRecord.getIsProcessed(),
            'Expected is processed to default to true.'
        );
        Test.stopTest();
    }

    @IsTest
    private static void shouldNotBeProcessedWhenTotalSetByDefault() {
        rollupRecord.setTotalRecords(1);

        Test.startTest();
        System.assert(
            !rollupRecord.getIsProcessed(),
            'Expected is processed to default to false when total rollupRecord count is provided.'
        );
        Test.stopTest();
    }

    @IsTest
    private static void shouldBeProcessedWhenTotalRecordsEqualsTotalProcessed() {
        rollupRecord.setTotalRecords(1);
        rollupRecord.totalProcessed = 1;

        Test.startTest();
        System.assert(
            rollupRecord.getIsProcessed(),
            'Expected is processed to return true when total processed equals total records.'
        );
        Test.stopTest();
    }

    @IsTest
    private static void shouldIncrementProcessed() {
        System.assertEquals(
            0,
            rollupRecord.totalProcessed,
            'Sanity check: Expected the default number processed to be zero.'
        );

        Test.startTest();
        rollupRecord.incrementProcessed();
        Test.stopTest();

        System.assertEquals(
            1,
            rollupRecord.totalProcessed,
            'Expected the number processed to be 1.'
        );
    }

    @IsTest
    private static void shouldIncrementPresentWhenFieldIsPresent() {
        rollupRecord.numPresentField = Contact.NumPresentServiceDeliveries__c;
        setPresentStub(true);

        System.assertEquals(
            null,
            rollupRecord.presentCount,
            'Sanity check: Expected the number present to be null by default.'
        );

        Test.startTest();
        rollupRecord.processPresent(System.today());
        Test.stopTest();

        System.assertEquals(
            1,
            rollupRecord.presentCount,
            'Expected the number present to be 1.'
        );
    }

    @IsTest
    private static void shouldNotIncrementPresentWhenFieldIsNotPresent() {
        setPresentStub(true);
        System.assertEquals(
            null,
            rollupRecord.presentCount,
            'Sanity check: Expected the number present to be null by default.'
        );

        Test.startTest();
        rollupRecord.processPresent(System.today());
        Test.stopTest();

        System.assertEquals(
            null,
            rollupRecord.presentCount,
            'Expected the number present to be null when number field is not present.'
        );
    }

    @IsTest
    private static void shouldIncrementAbsentWhenFieldIsPresent() {
        rollupRecord.numAbsentField = Contact.NumAbsentServiceDeliveries__c;
        setAbsentStub(true);

        System.assertEquals(
            null,
            rollupRecord.absentCount,
            'Sanity check: Expected the number absent to be null by default.'
        );

        Test.startTest();
        rollupRecord.processAbsent(System.today());
        Test.stopTest();

        System.assertEquals(
            1,
            rollupRecord.absentCount,
            'Expected the number absent to be 1.'
        );
    }

    @IsTest
    private static void shouldNotIncrementAbsentWhenFieldIsNotPresent() {
        setAbsentStub(true);
        System.assertEquals(
            null,
            rollupRecord.absentCount,
            'Sanity check: Expected the number absent to be null by default.'
        );

        Test.startTest();
        rollupRecord.processAbsent(System.today());
        Test.stopTest();

        System.assertEquals(
            null,
            rollupRecord.absentCount,
            'Expected the number absent to be null when number field is not present.'
        );
    }

    @IsTest
    private static void shouldUpdateLastServiceDateWhenFieldIsPresent() {
        Date dateToday = System.today();
        rollupRecord.lastServiceDateField = Contact.NumAbsentServiceDeliveries__c;
        System.assertEquals(
            null,
            rollupRecord.lastServiceDate,
            'Sanity check: Expected the last service date to be null by default.'
        );

        Test.startTest();
        rollupRecord.processLastServiceDate(dateToday);
        Test.stopTest();

        System.assertEquals(
            dateToday,
            rollupRecord.lastServiceDate,
            'Expected the date to be updated.'
        );
    }

    @IsTest
    private static void shouldUpdateLastServiceDateWhenDateIsGreater() {
        Date dateToday = System.today();
        Date yesterday = System.today().addDays(-1);
        rollupRecord.lastServiceDateField = Contact.NumAbsentServiceDeliveries__c;
        rollupRecord.lastServiceDate = yesterday;

        Test.startTest();
        rollupRecord.processLastServiceDate(dateToday);
        Test.stopTest();

        System.assertEquals(
            dateToday,
            rollupRecord.lastServiceDate,
            'Expected the date to be updated.'
        );
    }
    @IsTest
    private static void shouldNotUpdateLastServiceDateWhenDateIsLess() {
        Date dateToday = System.today();
        Date tomorrow = System.today().addDays(1);
        rollupRecord.lastServiceDateField = Contact.NumAbsentServiceDeliveries__c;
        rollupRecord.lastServiceDate = tomorrow;

        Test.startTest();
        rollupRecord.processLastServiceDate(dateToday);
        Test.stopTest();

        System.assertEquals(
            tomorrow,
            rollupRecord.lastServiceDate,
            'Expected the date not to have been updated.'
        );
    }

    @IsTest
    private static void shouldNotUpdateLastServiceDateWhenFieldIsNotPresent() {
        Date dateToday = System.today();
        System.assertEquals(
            null,
            rollupRecord.lastServiceDate,
            'Sanity check: Expected the last service date to be null by default.'
        );

        Test.startTest();
        rollupRecord.processLastServiceDate(dateToday);
        Test.stopTest();

        System.assertEquals(
            null,
            rollupRecord.lastServiceDate,
            'Expected the last service date to be null when number field is not present.'
        );
    }

    @IsTest
    private static void shouldDecrementAbsentWhenFieldIsPresent() {
        setAbsentStub(false);
        rollupRecord.numAbsentField = Contact.NumAbsentServiceDeliveries__c;
        rollupRecord.absentCount = 2;

        Test.startTest();
        rollupRecord.decrementAbsent();
        Test.stopTest();

        System.assertEquals(
            1,
            rollupRecord.absentCount,
            'Expected the number absent to be decremented to 1.'
        );
    }

    @IsTest
    private static void shouldNotDecrementAbsentWhenFieldIsNotPresent() {
        rollupRecord.absentCount = 2;

        Test.startTest();
        rollupRecord.decrementAbsent();
        Test.stopTest();

        System.assertEquals(
            2,
            rollupRecord.absentCount,
            'Did not expect the number absent to change.'
        );
    }

    @IsTest
    private static void shouldDecrementPresentWhenFieldIsPresent() {
        rollupRecord.numPresentField = Contact.NumPresentServiceDeliveries__c;
        rollupRecord.presentCount = 2;

        Test.startTest();
        rollupRecord.decrementPresent();
        Test.stopTest();

        System.assertEquals(
            1,
            rollupRecord.presentCount,
            'Expected the number present to be decremented to 1.'
        );
    }

    @IsTest
    private static void shouldNotDecrementPresentWhenFieldIsNotPresent() {
        rollupRecord.presentCount = 2;

        Test.startTest();
        rollupRecord.decrementPresent();
        Test.stopTest();

        System.assertEquals(
            2,
            rollupRecord.presentCount,
            'Did not expect the number present to change.'
        );
    }

    @IsTest
    private static void shouldSetCorrespondingFields() {
        System.assertEquals(
            null,
            rollupRecord.numAbsentField,
            'Sanity check: numAbsentField should be null by default.'
        );
        System.assertEquals(
            null,
            rollupRecord.numPresentField,
            'Sanity check: numPresentField should be null by default.'
        );
        System.assertEquals(
            null,
            rollupRecord.consecutiveAbsencesField,
            'Sanity check: consecutiveAbsencesField should be null by default.'
        );
        System.assertEquals(
            null,
            rollupRecord.lastServiceDateField,
            'Sanity check: lastServiceDateField should be null by default.'
        );

        Test.startTest();
        setRollupFields();
        Test.stopTest();

        System.assertEquals(
            Contact.NumAbsentServiceDeliveries__c,
            rollupRecord.numAbsentField,
            'numAbsentField should be set.'
        );
        System.assertEquals(
            Contact.NumPresentServiceDeliveries__c,
            rollupRecord.numPresentField,
            'numPresentField should be set.'
        );
        System.assertEquals(
            Contact.ConsecutiveAbsences__c,
            rollupRecord.consecutiveAbsencesField,
            'consecutiveAbsencesField should be set.'
        );
        System.assertEquals(
            Contact.LastServiceDate__c,
            rollupRecord.lastServiceDateField,
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
        rollupRecord.presentCount = 1;
        rollupRecord.absentCount = 1;
        rollupRecord.consecutiveCount = 0;
        rollupRecord.lastServiceDate = yesterday;

        Test.startTest();
        System.assert(
            !rollupRecord.isModified(originalContact),
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
        rollupRecord.presentCount = 1;
        rollupRecord.absentCount = 1;
        rollupRecord.consecutiveCount = 0;
        rollupRecord.lastServiceDate = System.today();

        Test.startTest();
        System.assert(
            rollupRecord.isModified(originalContact),
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
        rollupRecord.presentCount = 1;
        rollupRecord.absentCount = 1;
        rollupRecord.consecutiveCount = 0;
        rollupRecord.lastServiceDate = yesterday;

        Test.startTest();
        System.assertEquals(
            String.valueOf(matchingContact),
            String.valueOf(rollupRecord.getSObject()),
            'Expected the records to match.'
        );
        Test.stopTest();
    }

    @IsTest
    private static void shouldResetAttendanceFieldsWhenNoAttendanceCounts() {
        setRollupFields();
        rollupRecord.absentCount = 1;
        rollupRecord.presentCount = 0;
        rollupRecord.consecutiveCount = 1;

        Test.startTest();
        rollupRecord.decrementAbsent();
        Test.stopTest();

        System.assertEquals(
            null,
            rollupRecord.absentCount,
            'Expected the absent count to be set to null.'
        );
        System.assertEquals(
            null,
            rollupRecord.consecutiveCount,
            'Expected the consecutive absent count to be set to null.'
        );
        System.assertEquals(
            null,
            rollupRecord.presentCount,
            'Expected the present count to be set to null.'
        );
    }

    @IsTest
    private static void shouldProcessPresentDelivery() {
        setRollupFields();
        TestStub deliveryStub = createDeliveryStub(false, true, false, System.today());

        Test.startTest();
        rollupRecord.process((ServiceDelivery) deliveryStub.create());
        Test.stopTest();

        System.assertEquals(
            rollupRecord.presentCount,
            1,
            'Expected present count to be set to 1.'
        );
    }

    @IsTest
    private static void shouldProcessAbsentDelivery() {
        setRollupFields();
        TestStub deliveryStub = createDeliveryStub(true, false, false, System.today());

        Test.startTest();
        rollupRecord.process((ServiceDelivery) deliveryStub.create());
        Test.stopTest();

        System.assertEquals(
            rollupRecord.absentCount,
            1,
            'Expected absent count to be set to 1.'
        );
    }

    @IsTest
    private static void shouldProcessDeliveredDelivery() {
        setRollupFields();
        Date dateToday = System.today();
        TestStub deliveryStub = createDeliveryStub(false, false, true, dateToday);

        Test.startTest();
        rollupRecord.process((ServiceDelivery) deliveryStub.create());
        Test.stopTest();

        System.assertEquals(
            rollupRecord.lastServiceDate,
            dateToday,
            'Expected last delivery date to be set to today.'
        );
    }

    @IsTest
    private static void shouldIncrementConsecutiveAbsences() {
        setRollupFields();
        Date dateToday = System.today();
        TestStub absentStub = createDeliveryStub(true, false, false, dateToday);
        TestStub olderAbsentStub = createDeliveryStub(
            true,
            false,
            false,
            dateToday.addDays(-3)
        );
        TestStub presentStub = createDeliveryStub(
            false,
            true,
            false,
            dateToday.addDays(-2)
        );

        Test.startTest();
        rollupRecord.process((ServiceDelivery) absentStub.create());
        rollupRecord.process((ServiceDelivery) olderAbsentStub.create());
        rollupRecord.process((ServiceDelivery) presentStub.create());
        Test.stopTest();

        System.assertEquals(
            rollupRecord.consecutiveCount,
            1,
            'Expected one consecutive absence.'
        );
    }

    @IsTest
    private static void shouldInitializeAllFieldValues() {
        setRollupFields();
        Date dateToday = System.today();
        rollupRecord.initialize(
            new Contact(
                NumPresentServiceDeliveries__c = 1,
                NumAbsentServiceDeliveries__c = 1,
                ConsecutiveAbsences__c = 1,
                LastServiceDate__c = dateToday
            ),
            Util.prefixNamespace('ServiceDeliveries__r')
        );

        System.assertEquals(
            1,
            rollupRecord.presentCount,
            'Expected the value to be initialized from the contact record.'
        );
        System.assertEquals(
            1,
            rollupRecord.absentCount,
            'Expected the value to be initialized from the contact record.'
        );
        System.assertEquals(
            1,
            rollupRecord.consecutiveCount,
            'Expected the value to be initialized from the contact record.'
        );
        System.assertEquals(
            dateToday,
            rollupRecord.lastServiceDate,
            'Expected the value to be initialized from the contact record.'
        );
    }

    @IsTest
    private static void shouldInitializeAllFieldValuesToNullWhenFieldsAreNotPresent() {
        Date dateToday = System.today();
        rollupRecord.initialize(
            new Contact(
                NumPresentServiceDeliveries__c = 1,
                NumAbsentServiceDeliveries__c = 1,
                ConsecutiveAbsences__c = 1,
                LastServiceDate__c = dateToday
            ),
            Util.prefixNamespace('ServiceDeliveries__r')
        );

        System.assertEquals(
            null,
            rollupRecord.presentCount,
            'Expected the value to be initialized to null when the field is not present.'
        );
        System.assertEquals(
            null,
            rollupRecord.absentCount,
            'Expected the value to be initialized to null when the field is not present.'
        );
        System.assertEquals(
            null,
            rollupRecord.consecutiveCount,
            'Expected the value to be initialized to null when the field is not present.'
        );
        System.assertEquals(
            null,
            rollupRecord.lastServiceDate,
            'Expected the value to be initialized to null when the field is not present.'
        );
    }

    @IsTest
    private static void shouldTrackServiceDelivery() {
        rollupRecord.addDelivery(new ServiceDelivery(new ServiceDelivery__c()));

        System.assertEquals(
            1,
            rollupRecord.deliveries.size(),
            'Expected the delivery to be added.'
        );
    }

    @IsTest
    private static void shouldTrackOriginalServiceDelivery() {
        rollupRecord.addOriginalDelivery(new ServiceDelivery(new ServiceDelivery__c()));

        System.assertEquals(
            1,
            rollupRecord.originalDeliveries.size(),
            'Expected the delivery to be added.'
        );
    }

    @IsTest
    private static void shouldUpdateCountsWhenPresentChangesToAbsent() {
        setRollupFields();
        rollupRecord.initialize(
            new Contact(
                NumPresentServiceDeliveries__c = 1,
                NumAbsentServiceDeliveries__c = 0,
                ConsecutiveAbsences__c = 0,
                LastServiceDate__c = System.today()
            ),
            Util.prefixNamespace('ServiceDeliveries__r')
        );
        rollupRecord.addDelivery(
            (ServiceDelivery) createDeliveryStub(true, false, false, System.today())
                .create()
        );
        rollupRecord.addOriginalDelivery(
            (ServiceDelivery) createDeliveryStub(false, true, false, System.today())
                .create()
        );
        rollupRecord.existingDeliveries = new List<ServiceDelivery>{
            rollupRecord.deliveries[0]
        };

        Test.startTest();
        rollupRecord.process();
        Test.stopTest();

        System.assertEquals(
            0,
            rollupRecord.presentCount,
            'The present count was not as expected.'
        );
        System.assertEquals(
            1,
            rollupRecord.absentCount,
            'The absent count was not as expected.'
        );
        System.assertEquals(
            1,
            rollupRecord.consecutiveCount,
            'The consecutive count was not as expected.'
        );
    }

    @IsTest
    private static void shouldUpdateCountsWhenAbsentChangesToPresent() {
        setRollupFields();
        rollupRecord.initialize(
            new Contact(
                NumPresentServiceDeliveries__c = 0,
                NumAbsentServiceDeliveries__c = 1,
                ConsecutiveAbsences__c = 1,
                LastServiceDate__c = System.today()
            ),
            Util.prefixNamespace('ServiceDeliveries__r')
        );
        rollupRecord.addDelivery(
            (ServiceDelivery) createDeliveryStub(false, true, false, System.today())
                .create()
        );
        rollupRecord.addOriginalDelivery(
            (ServiceDelivery) createDeliveryStub(true, false, false, System.today())
                .create()
        );
        rollupRecord.existingDeliveries = new List<ServiceDelivery>{
            rollupRecord.deliveries[0]
        };

        Test.startTest();
        rollupRecord.process();
        Test.stopTest();

        System.assertEquals(
            1,
            rollupRecord.presentCount,
            'The present count was not as expected.'
        );
        System.assertEquals(
            0,
            rollupRecord.absentCount,
            'The absent count was not as expected.'
        );
        System.assertEquals(
            0,
            rollupRecord.consecutiveCount,
            'The consecutive count was not as expected.'
        );
    }

    @IsTest
    private static void shouldUpdateLastServiceDateWhenDateChanges() {
        setRollupFields();
        Date yesterday = System.today() - 1;
        Date dateToday = System.today();
        rollupRecord.initialize(
            new Contact(
                NumPresentServiceDeliveries__c = 1,
                NumAbsentServiceDeliveries__c = 0,
                ConsecutiveAbsences__c = 0,
                LastServiceDate__c = yesterday
            ),
            Util.prefixNamespace('ServiceDeliveries__r')
        );
        rollupRecord.addDelivery(
            (ServiceDelivery) createDeliveryStub(false, true, true, dateToday).create()
        );
        rollupRecord.addOriginalDelivery(
            (ServiceDelivery) createDeliveryStub(false, true, true, yesterday).create()
        );
        rollupRecord.existingDeliveries = new List<ServiceDelivery>{
            rollupRecord.deliveries[0]
        };

        Test.startTest();
        rollupRecord.process();
        Test.stopTest();

        System.assertEquals(
            dateToday,
            rollupRecord.lastServiceDate,
            'The last service date was not updated as expected.'
        );
    }

    @IsTest
    private static void shouldProcessDeletes() {
        setRollupFields();
        rollupRecord.initialize(
            new Contact(
                NumPresentServiceDeliveries__c = 1,
                NumAbsentServiceDeliveries__c = 1,
                ConsecutiveAbsences__c = 1,
                LastServiceDate__c = System.today()
            ),
            Util.prefixNamespace('ServiceDeliveries__r')
        );
        rollupRecord.addOriginalDelivery(
            (ServiceDelivery) createDeliveryStub(false, true, true, System.today())
                .create()
        );
        rollupRecord.addOriginalDelivery(
            (ServiceDelivery) createDeliveryStub(true, false, false, System.today())
                .create()
        );

        Test.startTest();
        rollupRecord.process();
        Test.stopTest();

        System.assertEquals(
            null,
            rollupRecord.presentCount,
            'The present count was not as expected.'
        );
        System.assertEquals(
            null,
            rollupRecord.absentCount,
            'The absent count was not as expected.'
        );
        System.assertEquals(
            null,
            rollupRecord.consecutiveCount,
            'The consecutive count was not as expected.'
        );
        System.assertEquals(
            null,
            rollupRecord.lastServiceDate,
            'The lastServiceDate count was not as expected.'
        );
    }

    ////////// Helpers //////////

    private static void setRollupFields() {
        rollupRecord.rollupFields(
            Contact.NumAbsentServiceDeliveries__c,
            Contact.NumPresentServiceDeliveries__c,
            Contact.ConsecutiveAbsences__c,
            Contact.LastServiceDate__c
        );
    }

    private static void setAbsentStub(Boolean val) {
        TestStub deliveryStub = createDeliveryStub(true, false, false, System.today());

        rollupRecord.deliveries = new List<ServiceDelivery>{
            (ServiceDelivery) deliveryStub.create()
        };
    }

    private static void setPresentStub(Boolean val) {
        TestStub deliveryStub = createDeliveryStub(false, true, true, System.today());

        rollupRecord.deliveries = new List<ServiceDelivery>{
            (ServiceDelivery) deliveryStub.create()
        };
    }

    private static TestStub createDeliveryStub(
        Boolean absent,
        Boolean present,
        Boolean delivered,
        Date deliveryDate
    ) {
        return new StubBuilder(ServiceDelivery.class)
            .when('isAbsent')
            .called()
            .thenReturn(absent)
            .when('isPresent')
            .called()
            .thenReturn(present)
            .when('isDelivered')
            .called()
            .thenReturn(delivered)
            .when('getDeliveryDate')
            .called()
            .thenReturn(deliveryDate)
            .build();
    }
}
