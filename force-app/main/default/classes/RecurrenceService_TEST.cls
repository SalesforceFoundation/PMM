@IsTest
public with sharing class RecurrenceService_TEST {
    private static BasicStub factoryStub = new BasicStub(
        RecurrenceFactoryInterface.class
    );
    private static BasicStub iteratorStub = new BasicStub(
        RecurrenceIteratorInterface.class
    );
    private static BasicStub ruleStub = new BasicStub(RecurrenceRule.class);
    private static RecurrenceService service = new RecurrenceService();
    private static String rRule = 'FREQ=DAILY;INTERVAL=3;UNTIL=20000101T000000Z;COUNT=5;DAYS=MO,WE';
    private static DateTime dateTimeStart = System.now();

    @IsTest
    private static void shouldGetDateTimesFromIterator() {
        String factoryMethod = 'makeIterator';
        String iteratorMethod = 'iterate';
        List<DateTime> dateTimesToReturn = new List<DateTime>();
        RecurrenceIteratorInterface iteratorToReturn = (RecurrenceIteratorInterface) iteratorStub.createMock();

        iteratorStub.withReturnValue(iteratorMethod, DateTime.class, dateTimesToReturn);
        factoryStub.withReturnValue(factoryMethod, String.class, iteratorToReturn);
        service.factory = (RecurrenceFactoryInterface) factoryStub.createMock();

        Test.startTest();
        List<DateTime> actual = service.generate(dateTimeStart, rRule);
        Test.stopTest();

        factoryStub.assertCalledWith(factoryMethod, String.class, rRule);
        iteratorStub.assertCalledWith(iteratorMethod, DateTime.class, dateTimeStart);
        System.assertEquals(
            dateTimesToReturn,
            actual,
            'Expected the list returned from the factory to be returned by the service.'
        );
    }

    @IsTest
    private static void shouldReturnRuleStringFromFreqStringDayNumsEndDateIntervalCount() {
        String frequency = 'Daily';
        Integer interval = 2;
        Date endDate = Date.newInstance(2021, 1, 1);
        Integer count = 5;
        List<Integer> days = new List<Integer>{ 1, 3 };
        String freqMethod = 'withFrequency';
        String intervalMethod = 'withInterval';
        String endDateMethod = 'withEndDate';
        String countMethod = 'withCount';
        String daysMethod = 'withDays';
        String resetMethod = 'reset';
        String buildMethod = 'build';
        ruleStub.withReturnValue(buildMethod, rRule);

        service.recurrenceRule = (RecurrenceRule) ruleStub.createMock();

        Test.startTest();
        String actual = service.createRRule(
            frequency,
            interval,
            endDate,
            count,
            days,
            dateTimeStart
        );
        Test.stopTest();

        ruleStub.assertCalled(resetMethod);
        ruleStub.assertCalledWith(freqMethod, String.class, frequency);
        ruleStub.assertCalledWith(intervalMethod, Integer.class, interval);
        ruleStub.assertCalledWith(endDateMethod, Date.class, endDate);
        ruleStub.assertCalledWith(countMethod, Integer.class, count);
        ruleStub.assertCalledWith(daysMethod, List<Integer>.class, days);
        ruleStub.assertCalled(buildMethod);

        System.assertEquals(
            rRule,
            actual,
            'Expected the service to return the rRule from the RecurrenceRule.'
        );
    }
}
