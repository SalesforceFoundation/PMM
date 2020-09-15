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
    private static void shouldIterateEveryDay5Times() {
        Datetime datetimeStart = Datetime.newInstance(2020, 9, 1, 14, 0, 0); // Sept 1 2020, 2PM
        RecurrenceRule rRule = new RecurrenceRule().withRuleString('FREQ=DAILY;COUNT=5'); // every day, 5 times
        List<Datetime> expected = new List<Datetime>{
            Datetime.newInstance(2020, 9, 1, 14, 0, 0),
            Datetime.newInstance(2020, 9, 2, 14, 0, 0),
            Datetime.newInstance(2020, 9, 3, 14, 0, 0),
            Datetime.newInstance(2020, 9, 4, 14, 0, 0),
            Datetime.newInstance(2020, 9, 5, 14, 0, 0)
        };
        DailyIterator iterator = new DailyIterator(rRule);

        Test.startTest();
        List<Datetime> actual = iterator.iterate(datetimeStart);
        Test.stopTest();

        System.assertEquals(expected, actual);
    }

    @IsTest
    private static void shouldIterateEveryDayUntilGivenDateOverLeapYear() {
        Datetime datetimeStart = Datetime.newInstance(2020, 2, 25, 23, 0, 0); // Feb 25 2020, 11PM
        RecurrenceRule rRule = new RecurrenceRule()
            .withRuleString('FREQ=DAILY;UNTIL=20200302T000000Z'); // every day until Mar 2 2020
        List<Datetime> expected = new List<Datetime>{
            Datetime.newInstance(2020, 2, 25, 23, 0, 0),
            Datetime.newInstance(2020, 2, 26, 23, 0, 0),
            Datetime.newInstance(2020, 2, 27, 23, 0, 0),
            Datetime.newInstance(2020, 2, 28, 23, 0, 0),
            Datetime.newInstance(2020, 2, 29, 23, 0, 0),
            Datetime.newInstance(2020, 3, 1, 23, 0, 0),
            Datetime.newInstance(2020, 3, 2, 23, 0, 0)
        };
        DailyIterator iterator = new DailyIterator(rRule);

        Test.startTest();
        List<Datetime> actual = iterator.iterate(datetimeStart);
        Test.stopTest();

        System.assertEquals(expected, actual);
    }

    @IsTest
    private static void shouldIterateEveryThirdDayUntilGivenDateOverLeapYear() {
        Datetime datetimeStart = Datetime.newInstance(2020, 2, 25, 14, 0, 0); // Feb 25 2020, 2PM
        RecurrenceRule rRule = new RecurrenceRule()
            .withRuleString('FREQ=DAILY;INTERVAL=3;UNTIL=20200303T000000Z'); // every 3rd day until Mar 3 2020
        List<Datetime> expected = new List<Datetime>{
            Datetime.newInstance(2020, 2, 25, 14, 0, 0),
            Datetime.newInstance(2020, 2, 28, 14, 0, 0),
            Datetime.newInstance(2020, 3, 2, 14, 0, 0)
        };
        DailyIterator iterator = new DailyIterator(rRule);

        Test.startTest();
        List<Datetime> actual = iterator.iterate(datetimeStart);
        Test.stopTest();

        System.assertEquals(expected, actual);
    }

    @IsTest
    private static void shouldStopAtEarliestGivenEndPointWhenUntil() {
        Datetime datetimeStart = Datetime.newInstance(2020, 2, 25, 14, 0, 0); // Feb 25 2020, 2PM
        RecurrenceRule rRule = new RecurrenceRule()
            .withRuleString('FREQ=DAILY;UNTIL=20200301T000000Z;COUNT=50'); // every 3rd day 50 times until Mar 1 2020
        List<Datetime> expected = new List<Datetime>{
            Datetime.newInstance(2020, 2, 25, 14, 0, 0),
            Datetime.newInstance(2020, 2, 26, 14, 0, 0),
            Datetime.newInstance(2020, 2, 27, 14, 0, 0),
            Datetime.newInstance(2020, 2, 28, 14, 0, 0),
            Datetime.newInstance(2020, 2, 29, 14, 0, 0),
            Datetime.newInstance(2020, 3, 1, 14, 0, 0)
        };
        DailyIterator iterator = new DailyIterator(rRule);

        Test.startTest();
        List<Datetime> actual = iterator.iterate(datetimeStart);
        Test.stopTest();

        System.assertEquals(expected, actual);
    }

    @IsTest
    private static void shouldStopAtEarliestGivenEndPointWhenCount() {
        Datetime datetimeStart = Datetime.newInstance(2020, 2, 25, 14, 0, 0); // Feb 25 2020, 2PM
        RecurrenceRule rRule = new RecurrenceRule()
            .withRuleString('FREQ=DAILY;UNTIL=20200301T000000Z;COUNT=3'); // every 3rd day 3 times until Mar 1 2020
        List<Datetime> expected = new List<Datetime>{
            Datetime.newInstance(2020, 2, 25, 14, 0, 0),
            Datetime.newInstance(2020, 2, 26, 14, 0, 0),
            Datetime.newInstance(2020, 2, 27, 14, 0, 0)
        };
        DailyIterator iterator = new DailyIterator(rRule);

        Test.startTest();
        List<Datetime> actual = iterator.iterate(datetimeStart);
        Test.stopTest();

        System.assertEquals(expected, actual);
    }
}
