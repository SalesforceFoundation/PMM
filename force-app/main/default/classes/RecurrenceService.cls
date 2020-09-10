public with sharing class RecurrenceService {
    private RecurrenceRule recurrenceRule = new RecurrenceRule();
    private RecurrenceIteratorFactory factory = new RecurrenceIteratorFactory();

    public List<DateTime> generate(DateTime startDate, String rRule) {
        recurrenceRule.reset().withString(rRule);
        return factory.getIterator(recurrenceRule).iterate(startDate, recurrenceRule);
    }

    public String createRRule(String frequency, List<String> days) {
        return recurrenceRule.reset().withFrequency(frequency).withDays(days).build();
    }
}
