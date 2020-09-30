@IsTest
public with sharing class DailyIterable_TEST {
    private static RecurrenceRule rRule = new RecurrenceRule();
    private static Date today = System.today();

    @IsTest
    private static void shouldAssignRule() {
        DailyIterable iterable = new DailyIterable(today, rRule);
        System.assertEquals(
            today,
            iterable.runningDate,
            'Should assign rule on construction.'
        );
        System.assertEquals(rRule, iterable.rRule, 'Should assign rule on construction.');
    }

    @IsTest
    private static void shouldReturnFalseWithoutStartDate() {
        DailyIterable iterable = new DailyIterable(null, rRule);

        System.assert(
            !iterable.hasNext(),
            'Should return does NOT have next when no starting date is provided.'
        );
    }

    @IsTest
    private static void shouldReturnTrueWithoutEndDefined() {
        rRule.withRuleString('FREQ=DAILY');
        DailyIterable iterable = new DailyIterable(today, rRule);

        System.assert(
            iterable.hasNext(),
            'Should return true for has next forever when no end is defined.'
        );
    }

    /* FUNCTIONAL TESTS */

    @IsTest
    private static void shouldIterateEveryDay5TimesOverDaylightSavingsEnd() {
        // Start on Oct 31 2020, 9PM (9PM means the UTC date is Nov 1)
        DateTime dateTimeStart = DateTime.newInstance(2020, 10, 31, 21, 0, 0);
        // every day, 5 times
        rRule.withRuleString('FREQ=DAILY;COUNT=5');
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 10, 31, 21, 0, 0),
            DateTime.newInstance(2020, 11, 1, 21, 0, 0), // daylight savings ends Nov 1 2020, we expect local time to stay the same value, 2PM
            DateTime.newInstance(2020, 11, 2, 21, 0, 0),
            DateTime.newInstance(2020, 11, 3, 21, 0, 0),
            DateTime.newInstance(2020, 11, 4, 21, 0, 0)
        };
        DailyIterable iterable = new DailyIterable(dateTimeStart.date(), rRule);

        Test.startTest();
        List<DateTime> actual = new List<DateTime>();
        while (iterable.hasNext()) {
            actual.add(DateTime.newInstance(iterable.next(), datetimeStart.time()));
        }
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterable was not as expected.'
        );
    }

    @IsTest
    private static void shouldIterateEveryDayUntilGivenDateOverLeapYear() {
        // Start on Feb 25 2020, 11PM
        DateTime dateTimeStart = DateTime.newInstance(2020, 2, 25, 23, 0, 0);
        // every day until Mar 2 2020
        rRule.withRuleString('FREQ=DAILY;UNTIL=20200302T000000Z');
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 2, 25, 23, 0, 0),
            DateTime.newInstance(2020, 2, 26, 23, 0, 0),
            DateTime.newInstance(2020, 2, 27, 23, 0, 0),
            DateTime.newInstance(2020, 2, 28, 23, 0, 0),
            DateTime.newInstance(2020, 2, 29, 23, 0, 0),
            DateTime.newInstance(2020, 3, 1, 23, 0, 0),
            DateTime.newInstance(2020, 3, 2, 23, 0, 0)
        };
        DailyIterable iterable = new DailyIterable(dateTimeStart.date(), rRule);

        Test.startTest();
        List<DateTime> actual = new List<DateTime>();
        while (iterable.hasNext()) {
            actual.add(DateTime.newInstance(iterable.next(), datetimeStart.time()));
        }
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterable was not as expected.'
        );
    }

    @IsTest
    private static void shouldIterateEveryThirdDayUntilGivenDateOverLeapYear() {
        // Start on Feb 25 2020, 2PM
        DateTime dateTimeStart = DateTime.newInstance(2020, 2, 25, 14, 0, 0);
        // every 3rd day until Mar 3 2020
        rRule.withRuleString('FREQ=DAILY;INTERVAL=3;UNTIL=20200303T000000Z');
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 2, 25, 14, 0, 0),
            DateTime.newInstance(2020, 2, 28, 14, 0, 0),
            DateTime.newInstance(2020, 3, 2, 14, 0, 0)
        };
        DailyIterable iterable = new DailyIterable(dateTimeStart.date(), rRule);

        Test.startTest();
        List<DateTime> actual = new List<DateTime>();
        while (iterable.hasNext()) {
            actual.add(DateTime.newInstance(iterable.next(), datetimeStart.time()));
        }
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterable was not as expected.'
        );
    }

    @IsTest
    private static void shouldStopAtEarliestGivenEndPointWhenUntil() {
        // Start on Feb 25 2020, 2PM
        DateTime dateTimeStart = DateTime.newInstance(2020, 2, 25, 14, 0, 0);
        // every 3rd day 50 times until Mar 1 2020
        rRule.withRuleString('FREQ=DAILY;UNTIL=20200301T000000Z;COUNT=50');
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 2, 25, 14, 0, 0),
            DateTime.newInstance(2020, 2, 26, 14, 0, 0),
            DateTime.newInstance(2020, 2, 27, 14, 0, 0),
            DateTime.newInstance(2020, 2, 28, 14, 0, 0),
            DateTime.newInstance(2020, 2, 29, 14, 0, 0),
            DateTime.newInstance(2020, 3, 1, 14, 0, 0)
        };
        DailyIterable iterable = new DailyIterable(dateTimeStart.date(), rRule);

        Test.startTest();
        List<DateTime> actual = new List<DateTime>();
        while (iterable.hasNext()) {
            actual.add(DateTime.newInstance(iterable.next(), datetimeStart.time()));
        }
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterable was not as expected.'
        );
    }

    @IsTest
    private static void shouldStopAtEarliestGivenEndPointWhenCount() {
        // Start on Feb 25 2020, 2PM
        DateTime dateTimeStart = DateTime.newInstance(2020, 2, 25, 14, 0, 0);
        // every 3rd day 3 times until Mar 1 2020
        rRule.withRuleString('FREQ=DAILY;UNTIL=20200301T000000Z;COUNT=3');
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 2, 25, 14, 0, 0),
            DateTime.newInstance(2020, 2, 26, 14, 0, 0),
            DateTime.newInstance(2020, 2, 27, 14, 0, 0)
        };
        DailyIterable iterable = new DailyIterable(dateTimeStart.date(), rRule);

        Test.startTest();
        List<DateTime> actual = new List<DateTime>();
        while (iterable.hasNext()) {
            actual.add(DateTime.newInstance(iterable.next(), datetimeStart.time()));
        }
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterable was not as expected.'
        );
    }
}
