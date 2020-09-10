public with sharing class DailyIterator implements RecurrenceIteratorInterface {
    RecurrenceRule recurrenceRule;

    public DailyIterator(RecurrenceRule recurrenceRule) {
        this.recurrenceRule = recurrenceRule;
    }

    public List<DateTime> iterate(DateTime startDate) {
        // Comment
        return new List<DateTime>();
    }
}
