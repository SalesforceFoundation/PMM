@IsTest
public with sharing class RecurrenceFactory_TEST {
    private static BasicStub ruleStub = new BasicStub(RecurrenceRule.class);

    @IsTest
    private static void shouldMakeDailyIterator() {
        String testRule = 'abc';
        String getFrequencyMethod = 'getFrequency';
        RecurrenceRule.Frequency expectedFrequency = RecurrenceRule.Frequency.DAILY;

        ruleStub.withReturnValue(getFrequencyMethod, expectedFrequency);
        RecurrenceFactory factory = new RecurrenceFactory();
        factory.recurrenceRule = (RecurrenceRule) ruleStub.createMock();
        Test.startTest();
        RecurrenceIteratorInterface result = factory.makeIterator(testRule);
        Test.stopTest();
        System.assert(result instanceof DailyIterator);
    }

    @IsTest
    private static void shouldMakeWeeklyIterator() {
        String testRule = 'abc';
        String getFrequencyMethod = 'getFrequency';
        RecurrenceRule.Frequency expectedFrequency = RecurrenceRule.Frequency.WEEKLY;

        ruleStub.withReturnValue(getFrequencyMethod, expectedFrequency);
        RecurrenceFactory factory = new RecurrenceFactory();
        factory.recurrenceRule = (RecurrenceRule) ruleStub.createMock();
        Test.startTest();
        RecurrenceIteratorInterface result = factory.makeIterator(testRule);
        Test.stopTest();
        System.assert(result instanceof WeeklyIterator);
    }

    @IsTest
    private static void shouldMakeMonthlyIterator() {
        String testRule = 'abc';
        String getFrequencyMethod = 'getFrequency';
        RecurrenceRule.Frequency expectedFrequency = RecurrenceRule.Frequency.MONTHLY;

        ruleStub.withReturnValue(getFrequencyMethod, expectedFrequency);
        RecurrenceFactory factory = new RecurrenceFactory();
        factory.recurrenceRule = (RecurrenceRule) ruleStub.createMock();
        Test.startTest();
        RecurrenceIteratorInterface result = factory.makeIterator(testRule);
        Test.stopTest();
        System.assert(result instanceof MonthlyIterator);
    }

    @IsTest
    private static void shouldReturnNullWithNullFrequency() {
        String testRule = 'abc';
        String getFrequencyMethod = 'getFrequency';
        RecurrenceRule.Frequency expectedFrequency = null;

        ruleStub.withReturnValue(getFrequencyMethod, expectedFrequency);
        RecurrenceFactory factory = new RecurrenceFactory();
        factory.recurrenceRule = (RecurrenceRule) ruleStub.createMock();
        Test.startTest();
        RecurrenceIteratorInterface result = factory.makeIterator(testRule);
        Test.stopTest();
        System.assertEquals(null, result);
    }
}
