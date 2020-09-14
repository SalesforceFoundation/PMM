public with sharing class RecurrenceService {
    private RecurrenceFactoryInterface factory = new RecurrenceFactory();
    private RecurrenceRule recurrenceRule = new RecurrenceRule();

    public List<DateTime> generate(DateTime dateTimeStart, String rRule) {
        return factory.makeIterator(rRule).iterate(dateTimeStart);
    }

    public String createRRule(String frequency, List<RecurrenceRule.Day> days) {
        return recurrenceRule.reset().withFrequency(frequency).withDays(days).build();
    }
}
