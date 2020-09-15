@IsTest
public with sharing class DailyIterator_TEST {
    @IsTest
    private static void shouldAssignRule() {
        RecurrenceRule rRule = new RecurrenceRule();
        DailyIterator iterator = new DailyIterator(rRule);
        System.assertEquals(
            rRule,
            iterator.recurrenceRule,
            'Should assign rule on construction.'
        );
    }

    @IsTest
    private static void shouldIterate() {
        DateTime dateTimeStart = System.now();
        List<DateTime> expected = new List<DateTime>{ dateTimeStart };
        List<DateTime> actual = new DailyIterator(new RecurrenceRule())
            .iterate(dateTimeStart);
        System.assertEquals(expected, actual);
    }
}
