public with sharing class RecurrenceService {
    private RecurrenceFactoryInterface factory = new RecurrenceFactory();
    private RecurrenceRule recurrenceRule = new RecurrenceRule();

    public List<DateTime> generate(DateTime startDate, String rRule) {
        return factory.makeIterator(rRule).iterate(startDate);
    }

    public String createRRule(String frequency, List<String> days) {
        return recurrenceRule.reset().withFrequency(frequency).withDays(days).build();
    }
}
