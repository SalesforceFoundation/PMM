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
    private static String rRule = 'FREQ=DAILY;INTERVAL=3;UNTIL=20200925T000000Z';
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
    private static void shouldReturnRuleStringFromFreqAndListOfDayNums() {
        String resetMethod = 'reset';
        String freqMethod = 'withFrequency';
        String daysMethod = 'withDays';
        String buildMethod = 'build';
        String frequency = 'Daily';
        List<Integer> days = new List<Integer>{ 1, 3 };
        ruleStub.withReturnValue(buildMethod, rRule);

        service.recurrenceRule = (RecurrenceRule) ruleStub.createMock();

        Test.startTest();
        String actual = service.createRRule(frequency, days);
        Test.stopTest();

        ruleStub.assertCalled(resetMethod);
        ruleStub.assertCalledWith(freqMethod, String.class, frequency);
        ruleStub.assertCalledWith(daysMethod, List<Integer>.class, days);
        ruleStub.assertCalled(buildMethod);

        System.assertEquals(
            rRule,
            actual,
            'Expected the service to return the rRule from the RecurrenceRule.'
        );
    }
}
