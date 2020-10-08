/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class RecurrenceService {
    @TestVisible
    private RecurrenceRule recurrenceRule = new RecurrenceRule();

    public List<DateTime> generate(
        DateTime dateTimeStart,
        String rRule,
        Integer maxSessions
    ) {
        recurrenceRule.reset().withRuleString(rRule);

        List<DateTime> results = new List<DateTime>();
        Iterator<Date> iterable = makeIterator(dateTimeStart);
        Boolean limitReached = false;

        while (!limitReached && iterable.hasNext()) {
            results.add(DateTime.newInstance(iterable.next(), dateTimeStart.time()));
            limitReached = maxSessions != null && results.size() >= maxSessions;
        }

        return results;
    }

    public List<DateTime> generate(DateTime dateTimeStart, String rRule) {
        return generate(dateTimeStart, rRule, null);
    }

    public String createRRule(
        String frequency,
        Integer interval,
        Date endDate,
        Integer count,
        List<Integer> days,
        DateTime dateTimeStart
    ) {
        return recurrenceRule.reset()
            .withFrequency(frequency)
            .withInterval(interval)
            .withEndDate(endDate)
            .withCount(count)
            .withDays(days)
            .withByMonthDays(dateTimeStart)
            .build();
    }

    @TestVisible
    private Iterator<Date> makeIterator(DateTime dateTimeStart) {
        switch on recurrenceRule.getFrequency() {
            when DAILY {
                return new DailyIterable(dateTimeStart.date(), recurrenceRule);
            }
            when WEEKLY {
                return new WeeklyIterable(dateTimeStart.date(), recurrenceRule);
            }
            when else {
                return new MonthlyIterable(dateTimeStart.date(), recurrenceRule);
            }
        }
    }
}
