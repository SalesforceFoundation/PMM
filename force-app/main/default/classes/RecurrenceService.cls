public with sharing class RecurrenceService {
    @TestVisible
    private RecurrenceRule recurrenceRule = new RecurrenceRule();

    public List<DateTime> generate(DateTime dateTimeStart, String rRule) {
        recurrenceRule.reset().withRuleString(rRule);

        List<DateTime> results = new List<DateTime>();
        Iterator<Date> iterable = makeIterator(dateTimeStart);

        while (iterable.hasNext()) {
            results.add(DateTime.newInstance(iterable.next(), dateTimeStart.time()));
        }

        return results;
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
