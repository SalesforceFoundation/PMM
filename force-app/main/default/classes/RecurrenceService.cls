public with sharing class RecurrenceService {
    private RecurrenceRule recurrenceRule = new RecurrenceRule();
    private RecurrenceIteratorFactory factory = new RecurrenceIteratorFactory();

    public List<DateTime> generate(DateTime dtStart, String rRule) {
        recurrenceRule.reset().withRuleString(rRule);
        return factory.getIterator(recurrenceRule).iterate(dtStart, recurrenceRule);
    }

    public String createRRule(String frequency, List<RecurrenceRule.Day> days) {
        return recurrenceRule.reset().withFrequency(frequency).withDays(days).build();
    }
}
