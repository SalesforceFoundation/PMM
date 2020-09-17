@IsTest
public with sharing class DailyIterator_TEST {
    @IsTest
    private static void shouldAssignRule() {
        RecurrenceRule rRule = new RecurrenceRule();
        DailyIterator iterator = new DailyIterator(rRule);
        System.assertEquals(rRule, iterator.rRule, 'Should assign rule on construction.');
    }

    /* FUNCTIONAL TESTS */

    @IsTest
    private static void shouldIterateEveryDay5TimesOverDaylightSavingsEnd() {
        // Start on Oct 31 2020, 9PM (9PM means the UTC date is Nov 1)
        DateTime dateTimeStart = DateTime.newInstance(2020, 10, 31, 21, 0, 0);
        // every day, 5 times
        RecurrenceRule rRule = new RecurrenceRule().withRuleString('FREQ=DAILY;COUNT=5');
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 10, 31, 21, 0, 0),
            DateTime.newInstance(2020, 11, 1, 21, 0, 0), // daylight savings ends Nov 1 2020, we expect local time to stay the same value, 2PM
            DateTime.newInstance(2020, 11, 2, 21, 0, 0),
            DateTime.newInstance(2020, 11, 3, 21, 0, 0),
            DateTime.newInstance(2020, 11, 4, 21, 0, 0)
        };
        DailyIterator iterator = new DailyIterator(rRule);

        Test.startTest();
        List<DateTime> actual = iterator.iterate(dateTimeStart);
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterator was not as expected.'
        );
    }

    @IsTest
    private static void shouldIterateEveryDayUntilGivenDateOverLeapYear() {
        // Start on Feb 25 2020, 11PM
        DateTime dateTimeStart = DateTime.newInstance(2020, 2, 25, 23, 0, 0);
        // every day until Mar 2 2020
        RecurrenceRule rRule = new RecurrenceRule()
            .withRuleString('FREQ=DAILY;UNTIL=20200302T000000Z');
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 2, 25, 23, 0, 0),
            DateTime.newInstance(2020, 2, 26, 23, 0, 0),
            DateTime.newInstance(2020, 2, 27, 23, 0, 0),
            DateTime.newInstance(2020, 2, 28, 23, 0, 0),
            DateTime.newInstance(2020, 2, 29, 23, 0, 0),
            DateTime.newInstance(2020, 3, 1, 23, 0, 0),
            DateTime.newInstance(2020, 3, 2, 23, 0, 0)
        };
        DailyIterator iterator = new DailyIterator(rRule);

        Test.startTest();
        List<DateTime> actual = iterator.iterate(dateTimeStart);
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterator was not as expected.'
        );
    }

    @IsTest
    private static void shouldIterateEveryThirdDayUntilGivenDateOverLeapYear() {
        // Start on Feb 25 2020, 2PM
        DateTime dateTimeStart = DateTime.newInstance(2020, 2, 25, 14, 0, 0);
        // every 3rd day until Mar 3 2020
        RecurrenceRule rRule = new RecurrenceRule()
            .withRuleString('FREQ=DAILY;INTERVAL=3;UNTIL=20200303T000000Z');
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 2, 25, 14, 0, 0),
            DateTime.newInstance(2020, 2, 28, 14, 0, 0),
            DateTime.newInstance(2020, 3, 2, 14, 0, 0)
        };
        DailyIterator iterator = new DailyIterator(rRule);

        Test.startTest();
        List<DateTime> actual = iterator.iterate(dateTimeStart);
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterator was not as expected.'
        );
    }

    @IsTest
    private static void shouldStopAtEarliestGivenEndPointWhenUntil() {
        // Start on Feb 25 2020, 2PM
        DateTime dateTimeStart = DateTime.newInstance(2020, 2, 25, 14, 0, 0);
        // every 3rd day 50 times until Mar 1 2020
        RecurrenceRule rRule = new RecurrenceRule()
            .withRuleString('FREQ=DAILY;UNTIL=20200301T000000Z;COUNT=50');
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 2, 25, 14, 0, 0),
            DateTime.newInstance(2020, 2, 26, 14, 0, 0),
            DateTime.newInstance(2020, 2, 27, 14, 0, 0),
            DateTime.newInstance(2020, 2, 28, 14, 0, 0),
            DateTime.newInstance(2020, 2, 29, 14, 0, 0),
            DateTime.newInstance(2020, 3, 1, 14, 0, 0)
        };
        DailyIterator iterator = new DailyIterator(rRule);

        Test.startTest();
        List<DateTime> actual = iterator.iterate(dateTimeStart);
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterator was not as expected.'
        );
    }

    @IsTest
    private static void shouldStopAtEarliestGivenEndPointWhenCount() {
        // Start on Feb 25 2020, 2PM
        DateTime dateTimeStart = DateTime.newInstance(2020, 2, 25, 14, 0, 0);
        // every 3rd day 3 times until Mar 1 2020
        RecurrenceRule rRule = new RecurrenceRule()
            .withRuleString('FREQ=DAILY;UNTIL=20200301T000000Z;COUNT=3');
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 2, 25, 14, 0, 0),
            DateTime.newInstance(2020, 2, 26, 14, 0, 0),
            DateTime.newInstance(2020, 2, 27, 14, 0, 0)
        };
        DailyIterator iterator = new DailyIterator(rRule);

        Test.startTest();
        List<DateTime> actual = iterator.iterate(dateTimeStart);
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterator was not as expected.'
        );
    }
}
