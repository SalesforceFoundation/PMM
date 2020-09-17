public with sharing class RecurrenceService {
    @TestVisible
    private RecurrenceFactoryInterface factory = new RecurrenceFactory();
    @TestVisible
    private RecurrenceRule recurrenceRule = new RecurrenceRule();

    public List<DateTime> generate(DateTime dateTimeStart, String rRule) {
        return factory.makeIterator(rRule).iterate(dateTimeStart);
    }

    public String createRRule(
        String frequency,
        Integer interval,
        Date endDate,
        Integer count,
        List<Integer> days
    ) {
        return recurrenceRule.reset()
            .withFrequency(frequency)
            .withInterval(interval)
            .withEndDate(endDate)
            .withCount(count)
            .withDays(days)
            .build();
    }
}
