public with sharing class RecurrenceService {
    private RecurrenceRule rule = new RecurrenceRule();
    private RecurrenceIterator recurrenceIterator {
        get {
            if (recurrenceIterator == null) {
                recurrenceIterator = getIterator();
            }

            return recurrenceIterator;
        }
        set;
    }

    public RecurrenceService(String rrString) {
        rule.withString(rrString);
    }

    public RecurrenceService(RecurrenceRule rRule) {
        this.rule = rRule;
    }

    public List<DateTime> generate(DateTime startDate) {
        return recurrenceIterator.iterate(startDate, rule);
    }

    private RecurrenceIterator getIterator() {
        switch on rule.getFrequency() {
            when DAILY {
                return new DailyIterator();
            }
            when else {
                return null;
            }
        }
    }

    public interface RecurrenceIterator {
        List<DateTime> iterate(DateTime startDate, RecurrenceRule rRule);
    }
}
