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
    private static void shouldSetAndGetBySetPos() {
        Integer defaultBySetPos = -1;

        Test.startTest();
        RecurrenceRule rule = new RecurrenceRule();
        Test.stopTest();

        System.assertEquals(defaultBySetPos, rule.getbySetPos());
    }

    @IsTest
    private static void shouldSetAndGetByMonthDayFor29thOfTheMonth() {
        DateTime dateTimeStart = DateTime.newInstance(2020, 1, 29, 13, 0, 0);
        Set<Integer> monthDays = new Set<Integer>{ 28, 29 };
        Test.startTest();
        RecurrenceRule rule = new RecurrenceRule().withByMonthDays(dateTimeStart);
        Test.stopTest();

        System.assertEquals(monthDays, rule.getByMonthDays());
    }

    @IsTest
    private static void shouldSetAndGetByMonthDayFor30thOfTheMonth() {
        DateTime dateTimeStart = DateTime.newInstance(2020, 1, 30, 13, 0, 0);
        Set<Integer> monthDays = new Set<Integer>{ 28, 29, 30 };
        Test.startTest();
        RecurrenceRule rule = new RecurrenceRule().withByMonthDays(dateTimeStart);
        Test.stopTest();

        System.assertEquals(monthDays, rule.getByMonthDays());
    }

    @IsTest
    private static void shouldSetAndGetByMonthDayFor31stOfTheMonth() {
        DateTime dateTimeStart = DateTime.newInstance(2020, 12, 31, 13, 0, 0);
        Set<Integer> monthDays = new Set<Integer>{ 28, 29, 30, 31 };
        Test.startTest();
        RecurrenceRule rule = new RecurrenceRule().withByMonthDays(dateTimeStart);
        Test.stopTest();

        System.assertEquals(monthDays, rule.getByMonthDays());
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

        System.assertEquals(
            null,
            rule.getDays(),
            'No days should be assigned if any invalid values are passed in.'
        );
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
    private static void shouldSetRuleStringAndParse() {
        String rrString = 'FREQ=DAILY;INTERVAL=3;UNTIL=20200301T000000Z;COUNT=50;BYDAY=SU,MO,TU,WE,TH,FR,SA';

        Test.startTest();
        RecurrenceRule rule = new RecurrenceRule().withRuleString(rrString);
        Test.stopTest();

        System.assertEquals(rrString, rule.rRule);
        System.assertEquals(rule.getFrequency(), RecurrenceRule.Frequency.DAILY);
        System.assertEquals(rule.getInterval(), 3);
        System.assertEquals(rule.getEndDate(), Date.newInstance(2020, 3, 1));
        System.assertEquals(rule.getCount(), 50);
        System.assertEquals(
            rule.getDays(),
            new List<RecurrenceRule.Day>{
                RecurrenceRule.Day.SU,
                RecurrenceRule.Day.MO,
                RecurrenceRule.Day.TU,
                RecurrenceRule.Day.WE,
                RecurrenceRule.Day.TH,
                RecurrenceRule.Day.FR,
                RecurrenceRule.Day.SA
            }
        );
    }

    @IsTest
    private static void shouldCatchInvalidRRuleKey() {
        String rrString = 'FREQ=DAILY;GARBAGE=2';
        RecurrenceRule rule = new RecurrenceRule();
        RecurrenceRule.RecurrenceRuleException actualException;

        Test.startTest();
        try {
            rule.withRuleString(rrString);
        } catch (RecurrenceRule.RecurrenceRuleException e) {
            actualException = e;
        }
        Test.stopTest();

        System.assertEquals(null, rule.rRule);
        System.assertNotEquals(null, actualException);
    }

    @IsTest
    private static void shouldBuild() {
        String expected = 'FREQ=DAILY;INTERVAL=3;UNTIL=20200301T000000Z;COUNT=50;BYDAY=SU,MO,TU,WE,TH,FR,SA';
        RecurrenceRule rule = new RecurrenceRule()
            .withFrequency('DAILY')
            .withEndDate(Date.newInstance(2020, 3, 1))
            .withCount(50)
            .withInterval(3)
            .withDays(new List<Integer>{ 1, 2, 3, 4, 5, 6, 7 });

        Test.startTest();
        String actual = rule.build();
        Test.stopTest();

        System.assertEquals(expected, actual);
    }

    @IsTest
    private static void shouldBuildMonthlyFrequencyWithbyMonthDay() {
        String expected = 'FREQ=MONTHLY;UNTIL=20200731T000000Z;BYSETPOS=-1;BYMONTHDAY=28,29,30,31';

        RecurrenceRule rule = new RecurrenceRule()
            .withFrequency('MONTHLY')
            .withEndDate(Date.newInstance(2020, 7, 31))
            .withByMonthDays(DateTime.newInstance(2020, 1, 31, 13, 0, 0));

        Test.startTest();
        String actual = rule.build();
        Test.stopTest();

        System.assertEquals(expected, actual);
    }

    @IsTest
    private static void shouldSetMonthlyRuleStringAndParse() {
        String rrString = 'FREQ=MONTHLY;UNTIL=20200731T000000Z;BYSETPOS=-1;BYMONTHDAY=28,29,30,31';

        Test.startTest();
        RecurrenceRule rule = new RecurrenceRule().withRuleString(rrString);
        Test.stopTest();

        System.assertEquals(rrString, rule.rRule);
        System.assertEquals(rule.getFrequency(), RecurrenceRule.Frequency.MONTHLY);
        System.assertEquals(rule.getEndDate(), Date.newInstance(2020, 7, 31));
        System.assertEquals(rule.getbySetPos(), -1);
    }
}
