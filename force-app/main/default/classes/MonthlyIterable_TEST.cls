/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class MonthlyIterable_TEST {
    private static RecurrenceRule rRule = new RecurrenceRule();

    @IsTest
    private static void shouldIterateEveryMonthUntilGivenEndDate() {
        DateTime dateTimeStart = DateTime.newInstance(2020, 9, 20, 13, 0, 0);
        rRule.withRuleString('FREQ=MONTHLY;UNTIL=20201220T000000Z;');
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 9, 20, 13, 0, 0),
            DateTime.newInstance(2020, 10, 20, 13, 0, 0),
            DateTime.newInstance(2020, 11, 20, 13, 0, 0), //crosses DST
            DateTime.newInstance(2020, 12, 20, 13, 0, 0)
        };

        MonthlyIterable iterable = new MonthlyIterable(dateTimeStart.date(), rRule);

        Test.startTest();
        List<DateTime> actual = new List<DateTime>();
        while (iterable.hasNext()) {
            actual.add(DateTime.newInstance(iterable.next(), datetimeStart.time()));
        }
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterator was not as expected'
        );
    }

    @IsTest
    private static void shouldIterateEveryLastDayOfTheMonthUntilGivenEndDateOverLeapYear() {
        DateTime dateTimeStart = DateTime.newInstance(2020, 1, 31, 13, 0, 0);
        rRule.withRuleString(
            'FREQ=MONTHLY;UNTIL=20200731T000000Z;BYSETPOS=-1;BYMONTHDAY=28,29,30,31'
        );
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 1, 31, 13, 0, 0),
            DateTime.newInstance(2020, 2, 29, 13, 0, 0),
            DateTime.newInstance(2020, 3, 31, 13, 0, 0),
            DateTime.newInstance(2020, 4, 30, 13, 0, 0),
            DateTime.newInstance(2020, 5, 31, 13, 0, 0),
            DateTime.newInstance(2020, 6, 30, 13, 0, 0),
            DateTime.newInstance(2020, 7, 31, 13, 0, 0)
        };

        MonthlyIterable iterable = new MonthlyIterable(dateTimeStart.date(), rRule);

        Test.startTest();
        List<DateTime> actual = new List<DateTime>();
        while (iterable.hasNext()) {
            actual.add(DateTime.newInstance(iterable.next(), datetimeStart.time()));
        }
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterator was not as expected'
        );
    }

    @IsTest
    private static void shouldIterateEveryMonthUntilGivenEndDateOverLeapYear() {
        DateTime dateTimeStart = DateTime.newInstance(2020, 1, 30, 13, 0, 0);
        rRule.withRuleString(
            'FREQ=MONTHLY;UNTIL=20200730T000000Z;BYSETPOS=-1;BYMONTHDAY=28,29,30'
        );
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 1, 30, 13, 0, 0),
            DateTime.newInstance(2020, 2, 29, 13, 0, 0),
            DateTime.newInstance(2020, 3, 30, 13, 0, 0),
            DateTime.newInstance(2020, 4, 30, 13, 0, 0),
            DateTime.newInstance(2020, 5, 30, 13, 0, 0),
            DateTime.newInstance(2020, 6, 30, 13, 0, 0),
            DateTime.newInstance(2020, 7, 30, 13, 0, 0)
        };

        MonthlyIterable iterable = new MonthlyIterable(dateTimeStart.date(), rRule);

        Test.startTest();
        List<DateTime> actual = new List<DateTime>();
        while (iterable.hasNext()) {
            actual.add(DateTime.newInstance(iterable.next(), datetimeStart.time()));
        }
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterator was not as expected'
        );
    }

    @IsTest
    private static void shouldIterateEveryMidDayOfTheMonthUntilGivenEndDateOverLeapYear() {
        DateTime dateTimeStart = DateTime.newInstance(2020, 1, 29, 13, 0, 0);
        rRule.withRuleString(
            'FREQ=MONTHLY;UNTIL=20200731T000000Z;BYSETPOS=-1;BYMONTHDAY=28,29'
        );
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 1, 29, 13, 0, 0),
            DateTime.newInstance(2020, 2, 29, 13, 0, 0),
            DateTime.newInstance(2020, 3, 29, 13, 0, 0),
            DateTime.newInstance(2020, 4, 29, 13, 0, 0),
            DateTime.newInstance(2020, 5, 29, 13, 0, 0),
            DateTime.newInstance(2020, 6, 29, 13, 0, 0),
            DateTime.newInstance(2020, 7, 29, 13, 0, 0)
        };

        MonthlyIterable iterable = new MonthlyIterable(dateTimeStart.date(), rRule);

        Test.startTest();
        List<DateTime> actual = new List<DateTime>();
        while (iterable.hasNext()) {
            actual.add(DateTime.newInstance(iterable.next(), datetimeStart.time()));
        }
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterator was not as expected'
        );
    }

    @IsTest
    private static void shouldIterateEveryMidDayOfTheMonthUntilGivenEndDateOverNotLeapYear() {
        DateTime dateTimeStart = DateTime.newInstance(2019, 1, 29, 13, 0, 0);
        rRule.withRuleString(
            'FREQ=MONTHLY;UNTIL=20190731T000000Z;BYSETPOS=-1;BYMONTHDAY=28,29'
        );
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2019, 1, 29, 13, 0, 0),
            DateTime.newInstance(2019, 2, 28, 13, 0, 0),
            DateTime.newInstance(2019, 3, 29, 13, 0, 0),
            DateTime.newInstance(2019, 4, 29, 13, 0, 0),
            DateTime.newInstance(2019, 5, 29, 13, 0, 0),
            DateTime.newInstance(2019, 6, 29, 13, 0, 0),
            DateTime.newInstance(2019, 7, 29, 13, 0, 0)
        };

        MonthlyIterable iterable = new MonthlyIterable(dateTimeStart.date(), rRule);

        Test.startTest();
        List<DateTime> actual = new List<DateTime>();
        while (iterable.hasNext()) {
            actual.add(DateTime.newInstance(iterable.next(), datetimeStart.time()));
        }
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterator was not as expected'
        );
    }

    @IsTest
    private static void shouldIterateLastDayOfTheMonthUntilGivenEndDateOverNotLeapYear() {
        DateTime dateTimeStart = DateTime.newInstance(2019, 1, 31, 13, 0, 0);
        rRule.withRuleString(
            'FREQ=MONTHLY;UNTIL=20190731T000000Z;BYSETPOS=-1;BYMONTHDAY=28,29,30,31'
        );
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2019, 1, 31, 13, 0, 0),
            DateTime.newInstance(2019, 2, 28, 13, 0, 0),
            DateTime.newInstance(2019, 3, 31, 13, 0, 0),
            DateTime.newInstance(2019, 4, 30, 13, 0, 0),
            DateTime.newInstance(2019, 5, 31, 13, 0, 0),
            DateTime.newInstance(2019, 6, 30, 13, 0, 0),
            DateTime.newInstance(2019, 7, 31, 13, 0, 0)
        };

        MonthlyIterable iterable = new MonthlyIterable(dateTimeStart.date(), rRule);

        Test.startTest();
        List<DateTime> actual = new List<DateTime>();
        while (iterable.hasNext()) {
            actual.add(DateTime.newInstance(iterable.next(), datetimeStart.time()));
        }
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterator was not as expected'
        );
    }

    @IsTest
    private static void shouldIterateEveryLastDayOfTheMonthUntilGivenEndDateOverLeapYearWithIntervalOf2() {
        DateTime dateTimeStart = DateTime.newInstance(2020, 1, 31, 13, 0, 0);
        rRule.withRuleString(
            'FREQ=MONTHLY;UNTIL=20200731T000000Z;INTERVAL=2;BYSETPOS=-1;BYMONTHDAY=28,29,30,31'
        );
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 1, 31, 13, 0, 0),
            DateTime.newInstance(2020, 3, 31, 13, 0, 0),
            DateTime.newInstance(2020, 5, 31, 13, 0, 0),
            DateTime.newInstance(2020, 7, 31, 13, 0, 0)
        };

        MonthlyIterable iterable = new MonthlyIterable(dateTimeStart.date(), rRule);

        Test.startTest();
        List<DateTime> actual = new List<DateTime>();
        while (iterable.hasNext()) {
            actual.add(DateTime.newInstance(iterable.next(), datetimeStart.time()));
        }
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterator was not as expected'
        );
    }

    @IsTest
    private static void shouldIterateEveryLastDayOfTheMonthUntilGivenEndDateOverLeapYearWithIntervalOf3() {
        DateTime dateTimeStart = DateTime.newInstance(2020, 1, 31, 13, 0, 0);
        rRule.withRuleString(
            'FREQ=MONTHLY;UNTIL=20200731T000000Z;INTERVAL=3;BYSETPOS=-1;BYMONTHDAY=28,29,30,31'
        );
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 1, 31, 13, 0, 0),
            DateTime.newInstance(2020, 4, 30, 13, 0, 0),
            DateTime.newInstance(2020, 7, 31, 13, 0, 0)
        };

        MonthlyIterable iterable = new MonthlyIterable(dateTimeStart.date(), rRule);

        Test.startTest();
        List<DateTime> actual = new List<DateTime>();
        while (iterable.hasNext()) {
            actual.add(DateTime.newInstance(iterable.next(), datetimeStart.time()));
        }
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterator was not as expected'
        );
    }

    @IsTest
    private static void shouldStopAtEarliestGivenEndPointWhenCount() {
        DateTime dateTimeStart = DateTime.newInstance(2020, 1, 15, 13, 0, 0);
        rRule.withRuleString('FREQ=MONTHLY;UNTIL=20200715T000000Z;COUNT=3;');
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 1, 15, 13, 0, 0),
            DateTime.newInstance(2020, 2, 15, 13, 0, 0),
            DateTime.newInstance(2020, 3, 15, 13, 0, 0)
        };

        MonthlyIterable iterable = new MonthlyIterable(dateTimeStart.date(), rRule);

        Test.startTest();
        List<DateTime> actual = new List<DateTime>();
        while (iterable.hasNext()) {
            actual.add(DateTime.newInstance(iterable.next(), datetimeStart.time()));
        }
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterator was not as expected'
        );
    }

    @IsTest
    private static void shouldStopAtEarliestGivenEndPointWhenUntil() {
        DateTime dateTimeStart = DateTime.newInstance(2020, 1, 15, 13, 0, 0);
        rRule.withRuleString('FREQ=MONTHLY;UNTIL=20200715T000000Z;COUNT=10;');
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 1, 15, 13, 0, 0),
            DateTime.newInstance(2020, 2, 15, 13, 0, 0),
            DateTime.newInstance(2020, 3, 15, 13, 0, 0),
            DateTime.newInstance(2020, 4, 15, 13, 0, 0),
            DateTime.newInstance(2020, 5, 15, 13, 0, 0),
            DateTime.newInstance(2020, 6, 15, 13, 0, 0),
            DateTime.newInstance(2020, 7, 15, 13, 0, 0)
        };

        MonthlyIterable iterable = new MonthlyIterable(dateTimeStart.date(), rRule);

        Test.startTest();
        List<DateTime> actual = new List<DateTime>();
        while (iterable.hasNext()) {
            actual.add(DateTime.newInstance(iterable.next(), datetimeStart.time()));
        }
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterator was not as expected'
        );
    }

    @IsTest
    private static void shouldIterateEveryOtherMonthWithCountAndInterval() {
        DateTime dateTimeStart = DateTime.newInstance(2020, 1, 15, 13, 0, 0);
        rRule.withRuleString('FREQ=MONTHLY;UNTIL=20200715T000000Z;COUNT=3;INTERVAL=2;');
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 1, 15, 13, 0, 0),
            DateTime.newInstance(2020, 3, 15, 13, 0, 0),
            DateTime.newInstance(2020, 5, 15, 13, 0, 0)
        };

        MonthlyIterable iterable = new MonthlyIterable(dateTimeStart.date(), rRule);

        Test.startTest();
        List<DateTime> actual = new List<DateTime>();
        while (iterable.hasNext()) {
            actual.add(DateTime.newInstance(iterable.next(), datetimeStart.time()));
        }
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterator was not as expected'
        );
    }

    @IsTest
    private static void shouldIterateEveryOtherMonthUntilGivenEndDate() {
        DateTime dateTimeStart = DateTime.newInstance(2020, 1, 15, 13, 0, 0);
        rRule.withRuleString('FREQ=MONTHLY;UNTIL=20200715T000000Z;INTERVAL=2;');
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 1, 15, 13, 0, 0),
            DateTime.newInstance(2020, 3, 15, 13, 0, 0),
            DateTime.newInstance(2020, 5, 15, 13, 0, 0),
            DateTime.newInstance(2020, 7, 15, 13, 0, 0)
        };

        MonthlyIterable iterable = new MonthlyIterable(dateTimeStart.date(), rRule);

        Test.startTest();
        List<DateTime> actual = new List<DateTime>();
        while (iterable.hasNext()) {
            actual.add(DateTime.newInstance(iterable.next(), datetimeStart.time()));
        }
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterator was not as expected'
        );
    }

    @IsTest
    private static void shouldIterateEveryMonthForOverAYearUntilGivenEndDate() {
        DateTime dateTimeStart = DateTime.newInstance(2020, 1, 31, 13, 0, 0);
        rRule.withRuleString(
            'FREQ=MONTHLY;UNTIL=20210630T000000Z;INTERVAL=1;BYMONTHDAY=28,29,30,31'
        );
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 1, 31, 13, 0, 0),
            DateTime.newInstance(2020, 2, 29, 13, 0, 0),
            DateTime.newInstance(2020, 3, 31, 13, 0, 0),
            DateTime.newInstance(2020, 4, 30, 13, 0, 0),
            DateTime.newInstance(2020, 5, 31, 13, 0, 0),
            DateTime.newInstance(2020, 6, 30, 13, 0, 0),
            DateTime.newInstance(2020, 7, 31, 13, 0, 0),
            DateTime.newInstance(2020, 8, 31, 13, 0, 0),
            DateTime.newInstance(2020, 9, 30, 13, 0, 0),
            DateTime.newInstance(2020, 10, 31, 13, 0, 0),
            DateTime.newInstance(2020, 11, 30, 13, 0, 0),
            DateTime.newInstance(2020, 12, 31, 13, 0, 0),
            DateTime.newInstance(2021, 1, 31, 13, 0, 0),
            DateTime.newInstance(2021, 2, 28, 13, 0, 0),
            DateTime.newInstance(2021, 3, 31, 13, 0, 0),
            DateTime.newInstance(2021, 4, 30, 13, 0, 0),
            DateTime.newInstance(2021, 5, 31, 13, 0, 0),
            DateTime.newInstance(2021, 6, 30, 13, 0, 0)
        };

        MonthlyIterable iterable = new MonthlyIterable(dateTimeStart.date(), rRule);

        Test.startTest();
        List<DateTime> actual = new List<DateTime>();
        while (iterable.hasNext()) {
            actual.add(DateTime.newInstance(iterable.next(), datetimeStart.time()));
        }
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterator was not as expected'
        );
    }

    @IsTest
    private static void shouldIterateEvery30thForAYearUntilGivenEndDate() {
        DateTime dateTimeStart = DateTime.newInstance(2020, 1, 30, 13, 0, 0);
        rRule.withRuleString(
            'FREQ=MONTHLY;UNTIL=20210630T000000Z;INTERVAL=1;BYMONTHDAY=28,29,30'
        );
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 1, 30, 13, 0, 0),
            DateTime.newInstance(2020, 2, 29, 13, 0, 0),
            DateTime.newInstance(2020, 3, 30, 13, 0, 0),
            DateTime.newInstance(2020, 4, 30, 13, 0, 0),
            DateTime.newInstance(2020, 5, 30, 13, 0, 0),
            DateTime.newInstance(2020, 6, 30, 13, 0, 0),
            DateTime.newInstance(2020, 7, 30, 13, 0, 0),
            DateTime.newInstance(2020, 8, 30, 13, 0, 0),
            DateTime.newInstance(2020, 9, 30, 13, 0, 0),
            DateTime.newInstance(2020, 10, 30, 13, 0, 0),
            DateTime.newInstance(2020, 11, 30, 13, 0, 0),
            DateTime.newInstance(2020, 12, 30, 13, 0, 0),
            DateTime.newInstance(2021, 1, 30, 13, 0, 0),
            DateTime.newInstance(2021, 2, 28, 13, 0, 0),
            DateTime.newInstance(2021, 3, 30, 13, 0, 0),
            DateTime.newInstance(2021, 4, 30, 13, 0, 0),
            DateTime.newInstance(2021, 5, 30, 13, 0, 0),
            DateTime.newInstance(2021, 6, 30, 13, 0, 0)
        };

        MonthlyIterable iterable = new MonthlyIterable(dateTimeStart.date(), rRule);

        Test.startTest();
        List<DateTime> actual = new List<DateTime>();
        while (iterable.hasNext()) {
            actual.add(DateTime.newInstance(iterable.next(), datetimeStart.time()));
        }
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterator was not as expected. - ' +
            expected.size() +
            ' : ' +
            actual.size()
        );
    }

    @IsTest
    private static void shouldIterateEvery5thOfTheMonthUntilGivenEndDate() {
        DateTime dateTimeStart = DateTime.newInstance(2020, 6, 5, 13, 0, 0);
        rRule.withRuleString('FREQ=MONTHLY;UNTIL=20201030T000000Z;');
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 6, 5, 13, 0, 0),
            DateTime.newInstance(2020, 7, 5, 13, 0, 0),
            DateTime.newInstance(2020, 8, 5, 13, 0, 0),
            DateTime.newInstance(2020, 9, 5, 13, 0, 0),
            DateTime.newInstance(2020, 10, 5, 13, 0, 0)
        };

        MonthlyIterable iterable = new MonthlyIterable(dateTimeStart.date(), rRule);

        Test.startTest();
        List<DateTime> actual = new List<DateTime>();
        while (iterable.hasNext()) {
            actual.add(DateTime.newInstance(iterable.next(), datetimeStart.time()));
        }
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterator was not as expected'
        );
    }

    @IsTest
    private static void shouldIterateEvery25thOfTheMonthUntilGivenEndDate() {
        DateTime dateTimeStart = DateTime.newInstance(2020, 6, 25, 13, 0, 0);
        rRule.withRuleString('FREQ=MONTHLY;UNTIL=20201030T000000Z;');
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 6, 25, 13, 0, 0),
            DateTime.newInstance(2020, 7, 25, 13, 0, 0),
            DateTime.newInstance(2020, 8, 25, 13, 0, 0),
            DateTime.newInstance(2020, 9, 25, 13, 0, 0),
            DateTime.newInstance(2020, 10, 25, 13, 0, 0)
        };

        MonthlyIterable iterable = new MonthlyIterable(dateTimeStart.date(), rRule);

        Test.startTest();
        List<DateTime> actual = new List<DateTime>();
        while (iterable.hasNext()) {
            actual.add(DateTime.newInstance(iterable.next(), datetimeStart.time()));
        }
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterator was not as expected'
        );
    }

    @IsTest
    private static void shouldIterateEveryOtherMonthOverAGivenYearUntilGivenEndDate() {
        DateTime dateTimeStart = DateTime.newInstance(2020, 12, 31, 13, 0, 0);
        rRule.withRuleString(
            'FREQ=MONTHLY;UNTIL=20210930T000000Z;INTERVAL=2;BYSETPOS=-1;BYMONTHDAY=28,29,30,31'
        );
        List<DateTime> expected = new List<DateTime>{
            DateTime.newInstance(2020, 12, 31, 13, 0, 0),
            DateTime.newInstance(2021, 2, 28, 13, 0, 0),
            DateTime.newInstance(2021, 4, 30, 13, 0, 0),
            DateTime.newInstance(2021, 6, 30, 13, 0, 0),
            DateTime.newInstance(2021, 8, 31, 13, 0, 0)
        };

        MonthlyIterable iterable = new MonthlyIterable(dateTimeStart.date(), rRule);

        Test.startTest();
        List<DateTime> actual = new List<DateTime>();
        while (iterable.hasNext()) {
            actual.add(DateTime.newInstance(iterable.next(), datetimeStart.time()));
        }
        Test.stopTest();

        System.assertEquals(
            expected,
            actual,
            'List of Dates returned from the iterator was not as expected'
        );
    }
}
