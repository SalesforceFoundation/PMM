@IsTest
public with sharing class RecurrenceRule_TEST {
    @IsTest
    private static void shouldSetAndGetFrequencyFromEnum() {
        RecurrenceRule.Frequency freq = RecurrenceRule.Frequency.DAILY;

        Test.startTest();
        RecurrenceRule rule = new RecurrenceRule().withFrequency(freq);
        Test.stopTest();

        System.assertEquals(
            freq,
            rule.getFrequency(),
            'The actual frequency returned is not the same as expected frequency.'
        );
    }

    @IsTest
    private static void shouldSetAndGetFrequencyFromString() {
        String freq = 'DAILY';

        Test.startTest();
        RecurrenceRule rule = new RecurrenceRule().withFrequency(freq);
        Test.stopTest();

        System.assertEquals(
            RecurrenceRule.Frequency.DAILY,
            rule.getFrequency(),
            'The actual frequency returned is not the same as expected frequency.'
        );
    }

    @IsTest
    private static void shouldSetAndGetInterval() {
        Integer interval = 3;

        Test.startTest();
        RecurrenceRule rule = new RecurrenceRule().withInterval(interval);
        Test.stopTest();

        System.assertEquals(
            interval,
            rule.getInterval(),
            'The actual interval returned is not the same as expected interval.'
        );
    }

    @IsTest
    private static void shouldSetAndGetEndDate() {
        Date endDate = System.today();

        Test.startTest();
        RecurrenceRule rule = new RecurrenceRule().withEndDate(endDate);
        Test.stopTest();

        System.assertEquals(
            endDate,
            rule.getEndDate(),
            'The actual End Date returned is not the same as expected End Date.'
        );
    }

    @IsTest
    private static void shouldSetAndGetCount() {
        Integer count = 5;

        Test.startTest();
        RecurrenceRule rule = new RecurrenceRule().withCount(count);
        Test.stopTest();

        System.assertEquals(
            count,
            rule.getCount(),
            'The actual count returned is not the same as expected count.'
        );
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

        System.assertEquals(
            days,
            rule.getDays(),
            'The actual days returned is not the same as expected days.'
        );
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

        System.assertEquals(
            days,
            rule.getDays(),
            'The actual days returned is not the same as expected days.'
        );
    }

    @IsTest
    private static void shouldDefaultAndGetBySetPos() {
        Integer defaultBySetPos = -1;

        Test.startTest();
        RecurrenceRule rule = new RecurrenceRule();
        Test.stopTest();

        System.assertEquals(
            defaultBySetPos,
            rule.getbySetPos(),
            'The actual value is not the same as the defaulted value.'
        );
    }

    @IsTest
    private static void shouldSetAndGetByMonthDayFor29thOfTheMonth() {
        DateTime dateTimeStart = DateTime.newInstance(2020, 1, 29, 13, 0, 0);
        Set<Integer> monthDays = new Set<Integer>{ 28, 29 };
        Test.startTest();
        RecurrenceRule rule = new RecurrenceRule()
            .withFrequency('MONTHLY')
            .withByMonthDays(dateTimeStart);
        Test.stopTest();

        System.assertEquals(
            monthDays,
            rule.getByMonthDays(),
            'The actual byMonthDays returned is not the same as expected byMonthDays.'
        );
    }

    @IsTest
    private static void shouldSetAndGetByMonthDayFor30thOfTheMonth() {
        DateTime dateTimeStart = DateTime.newInstance(2020, 1, 30, 13, 0, 0);
        Set<Integer> monthDays = new Set<Integer>{ 28, 29, 30 };
        Test.startTest();
        RecurrenceRule rule = new RecurrenceRule()
            .withFrequency('MONTHLY')
            .withByMonthDays(dateTimeStart);
        Test.stopTest();

        System.assertEquals(
            monthDays,
            rule.getByMonthDays(),
            'The actual byMonthDays returned is not the same as expected byMonthDays.'
        );
    }

    @IsTest
    private static void shouldSetAndGetByMonthDayFor31stOfTheMonth() {
        DateTime dateTimeStart = DateTime.newInstance(2020, 12, 31, 13, 0, 0);
        Set<Integer> monthDays = new Set<Integer>{ 28, 29, 30, 31 };
        Test.startTest();
        RecurrenceRule rule = new RecurrenceRule()
            .withFrequency('MONTHLY')
            .withByMonthDays(dateTimeStart);
        Test.stopTest();

        System.assertEquals(
            monthDays,
            rule.getByMonthDays(),
            'The actual byMonthDays returned is not the same as expected byMonthDays.'
        );
    }

    @IsTest
    private static void shouldNotSetByMonthDaysWhenNotMonthly() {
        DateTime dateTimeStart = DateTime.newInstance(2020, 12, 31, 13, 0, 0);
        Test.startTest();
        RecurrenceRule rule = new RecurrenceRule()
            .withFrequency('DAILY')
            .withByMonthDays(dateTimeStart);
        Test.stopTest();

        System.assertEquals(
            null,
            rule.getByMonthDays(),
            'The actual byMonthDays returned is not the same as expected byMonthDays.'
        );
    }

    @IsTest
    private static void shouldNotSetDaysWhenDaysIsNull() {
        DateTime dateTimeStart = DateTime.newInstance(2020, 12, 31, 13, 0, 0);
        Test.startTest();
        List<Integer> days;
        RecurrenceRule rule = new RecurrenceRule().withDays(days);
        Test.stopTest();

        System.assertEquals(
            null,
            rule.getDays(),
            'The actual days returned is not the same as expected days.'
        );
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

        System.assertEquals(
            null,
            rule.getFrequency(),
            'The frequency returned is not null.'
        );
        System.assertNotEquals(null, actualException, 'The actualExcpetion is null.');
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

        System.assertNotEquals(null, rule.getFrequency(), 'Frequency returned is null');
        System.assertNotEquals(
            1,
            rule.getInterval(),
            'Interval returned is not the same as expected interval'
        );
        System.assertNotEquals(null, rule.getEndDate(), 'EndDate returned is null');
        System.assertNotEquals(null, rule.getCount(), 'Count returned is null');
        System.assertNotEquals(null, rule.getDays(), 'Days returned is null');

        Test.startTest();
        rule = rule.reset();
        Test.stopTest();

        System.assertEquals(null, rule.getFrequency(), 'Frequency returned is not null');
        System.assertEquals(
            1,
            rule.getInterval(),
            'Interval returned is not the same as expected interval'
        );
        System.assertEquals(null, rule.getEndDate(), 'EndDate returned is not null');
        System.assertEquals(null, rule.getCount(), 'Count returned is not null');
        System.assertEquals(null, rule.getDays(), 'Days returned is not null');
    }

    @IsTest
    private static void shouldSetRuleStringAndParse() {
        String rrString = 'FREQ=DAILY;INTERVAL=3;UNTIL=20200301T000000Z;COUNT=50;BYDAY=SU,MO,TU,WE,TH,FR,SA';

        Test.startTest();
        RecurrenceRule rule = new RecurrenceRule().withRuleString(rrString);
        Test.stopTest();

        System.assertEquals(
            rrString,
            rule.rRule,
            'Actual rRule returned is not the same as expected'
        );
        System.assertEquals(
            rule.getFrequency(),
            RecurrenceRule.Frequency.DAILY,
            'Actual frequency returned is not the same as expected'
        );
        System.assertEquals(
            rule.getInterval(),
            3,
            'Actual interval returned is not the same as expected'
        );
        System.assertEquals(
            rule.getEndDate(),
            Date.newInstance(2020, 3, 1),
            'Actual EndDate returned is not the same as expected'
        );
        System.assertEquals(
            rule.getCount(),
            50,
            'Actual count returned is not the same as expected'
        );
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
            },
            'Actual days returned is not the same as expected'
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

        System.assertEquals(null, rule.rRule, 'Actual rRule returned is not null');
        System.assertNotEquals(null, actualException, 'Actual Exception is null');
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

        System.assertEquals(
            expected,
            actual,
            'Actual rRule string is not the same as expected'
        );
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

        System.assertEquals(
            expected,
            actual,
            'Actual rRule string is not the same as expected'
        );
    }

    @IsTest
    private static void shouldSetMonthlyRuleStringAndParse() {
        String rrString = 'FREQ=MONTHLY;UNTIL=20200731T000000Z;BYSETPOS=-1;BYMONTHDAY=28,29,30,31';

        Test.startTest();
        RecurrenceRule rule = new RecurrenceRule().withRuleString(rrString);
        Test.stopTest();

        System.assertEquals(
            rrString,
            rule.rRule,
            'Actual rRule string is not the same as expected'
        );
        System.assertEquals(
            rule.getFrequency(),
            RecurrenceRule.Frequency.MONTHLY,
            'Actual Frequency string is not the same as expected'
        );
        System.assertEquals(
            rule.getEndDate(),
            Date.newInstance(2020, 7, 31),
            'Actual EndDate string is not the same as expected'
        );
        System.assertEquals(
            rule.getbySetPos(),
            -1,
            'Actual bySetPos string is not the same as expected'
        );
    }
}
