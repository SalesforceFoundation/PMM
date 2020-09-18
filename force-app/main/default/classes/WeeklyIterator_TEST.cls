@IsTest
public with sharing class WeeklyIterator_TEST {
    @IsTest
    private static void shouldAssignRule() {
        RecurrenceRule rRule = new RecurrenceRule();
        WeeklyIterator iterator = new WeeklyIterator(rRule);
        System.assertEquals(rRule, iterator.rRule, 'Should assign rule on construction.');
    }

    /* FUNCTIONAL TESTS */

    @IsTest
    private static void shouldIterateEveryOtherMonday5TimesOverDaylightSavings() {
        // Start on Tuesday Sept 1 2020, 2PM
        DateTime dateTimeStart = DateTime.newInstance(2020, 9, 1, 14, 0, 0);
        // every other Monday, 5 times or Oct 8 2099
        RecurrenceRule rRule = new RecurrenceRule()
            .withRuleString(
                'FREQ=WEEKLY;COUNT=5;INTERVAL=2;BYDAY=MO;UNTIL=20991008T100000Z'
            );
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 9, 14, 14, 0, 0),
            DateTime.newInstance(2020, 9, 28, 14, 0, 0),
            DateTime.newInstance(2020, 10, 12, 14, 0, 0),
            DateTime.newInstance(2020, 10, 26, 14, 0, 0),
            DateTime.newInstance(2020, 11, 9, 14, 0, 0) // crosses DST
        };
        WeeklyIterator iterator = new WeeklyIterator(rRule);

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
    private static void shouldIterateEveryMondayAndTuesdayUntilGivenDate() {
        // Start on Tuesday Sept 1 2020, 2PM
        DateTime dateTimeStart = DateTime.newInstance(2020, 9, 1, 14, 0, 0);
        // every Monday and Tuesday until October 8 or 30 times
        RecurrenceRule rRule = new RecurrenceRule()
            .withRuleString('FREQ=WEEKLY;UNTIL=20201008T120000Z;BYDAY=MO,TU;COUNT=30');
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 9, 1, 14, 0, 0),
            DateTime.newInstance(2020, 9, 7, 14, 0, 0),
            DateTime.newInstance(2020, 9, 8, 14, 0, 0),
            DateTime.newInstance(2020, 9, 14, 14, 0, 0),
            DateTime.newInstance(2020, 9, 15, 14, 0, 0),
            DateTime.newInstance(2020, 9, 21, 14, 0, 0),
            DateTime.newInstance(2020, 9, 22, 14, 0, 0),
            DateTime.newInstance(2020, 9, 28, 14, 0, 0),
            DateTime.newInstance(2020, 9, 29, 14, 0, 0),
            DateTime.newInstance(2020, 10, 5, 14, 0, 0),
            DateTime.newInstance(2020, 10, 6, 14, 0, 0)
        };
        WeeklyIterator iterator = new WeeklyIterator(rRule);

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
    private static void shouldIterateEveryThirdWeekendFor6Instances() {
        // Start on Monday Oct 12 2020, 8PM
        DateTime dateTimeStart = DateTime.newInstance(2020, 10, 12, 20, 0, 0);
        // every 3 weeks on Saturday, Sunday for 6 times
        RecurrenceRule rRule = new RecurrenceRule()
            .withRuleString('FREQ=WEEKLY;COUNT=6;INTERVAL=3;BYDAY=SA,SU');
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 10, 17, 20, 0, 0),
            DateTime.newInstance(2020, 10, 18, 20, 0, 0),
            DateTime.newInstance(2020, 11, 7, 20, 0, 0), // crosses DST
            DateTime.newInstance(2020, 11, 8, 20, 0, 0),
            DateTime.newInstance(2020, 11, 28, 20, 0, 0),
            DateTime.newInstance(2020, 11, 29, 20, 0, 0)
        };
        WeeklyIterator iterator = new WeeklyIterator(rRule);

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
    private static void shouldIterateEveryOtherTuesdaySundayFor4Instances() {
        // Start on Sunday Oct 11 2020, 8PM
        DateTime dateTimeStart = DateTime.newInstance(2020, 10, 11, 11, 0, 0);
        // every 3 weeks on Tuesday, Sunday for 4 times
        RecurrenceRule rRule = new RecurrenceRule()
            .withRuleString('FREQ=WEEKLY;COUNT=4;INTERVAL=2;BYDAY=TU,SU');
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 10, 11, 11, 0, 0),
            DateTime.newInstance(2020, 10, 20, 11, 0, 0),
            DateTime.newInstance(2020, 10, 25, 11, 0, 0),
            DateTime.newInstance(2020, 11, 3, 11, 0, 0) // crosses DST
        };
        WeeklyIterator iterator = new WeeklyIterator(rRule);

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
    private static void shouldReturnEmptyListWhenNoCountOrEndDateGiven() {
        // Note: This should never actually happen because the RecurrenceRule
        // class should validate that one end parameter exists.

        // Start on Sunday Oct 11 2020, 11AM
        DateTime dateTimeStart = DateTime.newInstance(2020, 10, 11, 11, 0, 0);
        // every week on Wednesdays, no end specified
        RecurrenceRule rRule = new RecurrenceRule()
            .withRuleString('FREQ=WEEKLY;BYDAY=WE');
        List<DateTime> expected = new List<DateTime>{};
        WeeklyIterator iterator = new WeeklyIterator(rRule);

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
