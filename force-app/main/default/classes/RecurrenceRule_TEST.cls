@IsTest
public with sharing class RecurrenceRule_TEST {
    @IsTest
    private static void shouldSetAndGetFrequencyFromEnum() {
        RecurrenceRule.Frequency freq = RecurrenceRule.Frequency.DAILY;

        Test.startTest();
        RecurrenceRule rule = new RecurrenceRule().withFrequency(freq);
        Test.stopTest();

        System.assertEquals(freq, rule.getFrequency());
    }

    @IsTest
    private static void shouldSetAndGetFrequencyFromString() {
        String freq = 'DAILY';

        Test.startTest();
        RecurrenceRule rule = new RecurrenceRule().withFrequency(freq);
        Test.stopTest();

        System.assertEquals(RecurrenceRule.Frequency.DAILY, rule.getFrequency());
    }

    @IsTest
    private static void shouldSetAndGetInterval() {
        Integer interval = 3;

        Test.startTest();
        RecurrenceRule rule = new RecurrenceRule().withInterval(interval);
        Test.stopTest();

        System.assertEquals(interval, rule.getInterval());
    }

    @IsTest
    private static void shouldSetAndGetEndDate() {
        Date endDate = System.today();

        Test.startTest();
        RecurrenceRule rule = new RecurrenceRule().withEndDate(endDate);
        Test.stopTest();

        System.assertEquals(endDate, rule.getEndDate());
    }

    @IsTest
    private static void shouldSetAndGetCount() {
        Integer count = 5;

        Test.startTest();
        RecurrenceRule rule = new RecurrenceRule().withCount(count);
        Test.stopTest();

        System.assertEquals(count, rule.getCount());
    }

    @IsTest
    private static void shouldSetAndGetDaysFromEnums() {
        List<RecurrenceRule.Day> days = new List<RecurrenceRule.Day>{
            RecurrenceRule.Day.WE,
            RecurrenceRule.Day.MO
        };

        Test.startTest();
        RecurrenceRule rule = new RecurrenceRule().withDays(days);
        Test.stopTest();

        System.assertEquals(days, rule.getDays());
    }

    @IsTest
    private static void shouldSetAndGetDaysFromIntegers() {
        List<Integer> dayNums = new List<Integer>{ 1, 2 };
        List<RecurrenceRule.Day> days = new List<RecurrenceRule.Day>{
            RecurrenceRule.Day.SU,
            RecurrenceRule.Day.MO
        };

        Test.startTest();
        RecurrenceRule rule = new RecurrenceRule().withDays(dayNums);
        Test.stopTest();

        System.assertEquals(days, rule.getDays());
    }

    @IsTest
    private static void shouldCatchInvalidFrequency() {
        String badFreq = 'abc';
        RecurrenceRule rule = new RecurrenceRule();
        RecurrenceRule.RecurrenceRuleException actualException;

        Test.startTest();
        try {
            rule.withFrequency(badFreq);
        } catch (RecurrenceRule.RecurrenceRuleException e) {
            actualException = e;
        }
        Test.stopTest();

        System.assertEquals(null, rule.getFrequency());
        System.assertNotEquals(null, actualException);
    }
    @IsTest
    private static void shouldCatchInvalidDayNum() {
        List<Integer> dayNums = new List<Integer>{ 7, 8 };
        RecurrenceRule rule = new RecurrenceRule();
        RecurrenceRule.RecurrenceRuleException actualException;

        Test.startTest();
        try {
            rule.withDays(dayNums);
        } catch (RecurrenceRule.RecurrenceRuleException e) {
            actualException = e;
        }
        Test.stopTest();

        System.assertEquals(0, rule.getDays().size());
        System.assertNotEquals(null, actualException);
    }

    @IsTest
    private static void shouldResetRule() {
        RecurrenceRule rule = new RecurrenceRule()
            .withFrequency('DAILY')
            .withInterval(2)
            .withEndDate(System.today())
            .withCount(3)
            .withDays(new List<Integer>{ 1, 2 });

        System.assertNotEquals(null, rule.getFrequency());
        System.assertNotEquals(1, rule.getInterval());
        System.assertNotEquals(null, rule.getEndDate());
        System.assertNotEquals(null, rule.getCount());
        System.assertNotEquals(null, rule.getDays());

        Test.startTest();
        rule = rule.reset();
        Test.stopTest();

        System.assertEquals(null, rule.getFrequency());
        System.assertEquals(1, rule.getInterval());
        System.assertEquals(null, rule.getEndDate());
        System.assertEquals(null, rule.getCount());
        System.assertEquals(null, rule.getDays());
    }

    @IsTest
    private static void shouldSetRuleString() {
        String rrString = 'abc';

        Test.startTest();
        RecurrenceRule rule = new RecurrenceRule().withRuleString(rrString);
        Test.stopTest();

        System.assertEquals(rrString, rule.rRule);
        //TODO: update once parse/build are available
    }
}
