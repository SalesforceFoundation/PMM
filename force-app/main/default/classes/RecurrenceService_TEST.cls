/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class RecurrenceService_TEST {
    private static BasicStub ruleStub = new BasicStub(RecurrenceRule.class);
    private static RecurrenceService service = new RecurrenceService();
    private static String rRule = 'FREQ=DAILY;INTERVAL=3;UNTIL=20000101T000000Z;COUNT=5;DAYS=MO,WE';
    private static DateTime dateTimeStart = System.now();

    @IsTest
    private static void shouldGenerateDailySchedule() {
        rRule = 'FREQ=DAILY;INTERVAL=3;COUNT=5';
        List<DateTime> expectedDateTimes = new List<DateTime>{
            dateTimeStart,
            dateTimeStart.addDays(3),
            dateTimeStart.addDays(6),
            dateTimeStart.addDays(9),
            dateTimeStart.addDays(12)
        };

        Test.startTest();
        List<DateTime> actualDateTimes = service.generate(dateTimeStart, rRule);
        Test.stopTest();

        System.assertEquals(
            expectedDateTimes,
            actualDateTimes,
            'Expected every 3rd day starting with today to be returned.'
        );
    }

    @IsTest
    private static void shouldGenerateLimitedDailySchedule() {
        rRule = 'FREQ=DAILY;INTERVAL=3;COUNT=5';
        List<DateTime> expectedDateTimes = new List<DateTime>{
            dateTimeStart,
            dateTimeStart.addDays(3),
            dateTimeStart.addDays(6),
            dateTimeStart.addDays(9)
        };

        Test.startTest();
        List<DateTime> actualDateTimes = service.generate(dateTimeStart, rRule, 4);
        Test.stopTest();

        System.assertEquals(
            expectedDateTimes,
            actualDateTimes,
            'Expected every 3rd day starting with today and limited to max number of sessions provided.'
        );
    }

    @IsTest
    private static void shouldGenerateWeeklySchedule() {
        DateTime sunday = DateTime.newInstance(2012, 1, 1);
        rRule = 'FREQ=Weekly;INTERVAL=3;COUNT=5;BYDAY=SU';
        // TODO: Discuss results with team
        List<DateTime> expectedDateTimes = new List<DateTime>{
            sunday,
            DateTime.newInstance(sunday.addDays(3 * 7).date(), sunday.time()),
            DateTime.newInstance(sunday.addDays(6 * 7).date(), sunday.time()),
            DateTime.newInstance(sunday.addDays(9 * 7).date(), sunday.time()),
            DateTime.newInstance(sunday.addDays(12 * 7).date(), sunday.time())
        };

        Test.startTest();
        List<DateTime> actualDateTimes = service.generate(sunday, rRule);
        Test.stopTest();

        System.assertEquals(
            expectedDateTimes,
            actualDateTimes,
            'Expected every 3rd Sunday starting with the sunday provided.'
        );
    }

    @IsTest
    private static void shouldGenerateMonthlySchedule() {
        rRule = 'FREQ=Monthly;INTERVAL=3;COUNT=5';
        DateTime startOfMonth = dateTimeStart.addDays(-dateTimeStart.day()).addDays(1);

        List<DateTime> expectedDateTimes = new List<DateTime>{
            startOfMonth,
            DateTime.newInstance(startOfMonth.addMonths(3).date(), startOfMonth.time()),
            DateTime.newInstance(startOfMonth.addMonths(6).date(), startOfMonth.time()),
            DateTime.newInstance(startOfMonth.addMonths(9).date(), startOfMonth.time()),
            DateTime.newInstance(startOfMonth.addMonths(12).date(), startOfMonth.time())
        };

        Test.startTest();
        List<DateTime> actualDateTimes = service.generate(startOfMonth, rRule);
        Test.stopTest();

        System.assertEquals(
            expectedDateTimes,
            actualDateTimes,
            'Expected every 3rd Month to be returned starting with the current month.'
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
