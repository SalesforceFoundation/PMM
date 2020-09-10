public with sharing class RecurrenceIteratorFactory {
    public RecurrenceIterator getIterator(RecurrenceRule recurrenceRule) {
        switch on recurrenceRule.getFrequency() {
            when DAILY {
                return new DailyIterator();
            }
            when else {
                return null;
            }
        }
    }

    public interface RecurrenceIterator {
        List<DateTime> iterate(DateTime startDate, RecurrenceRule recurrenceRule);
    }
}
