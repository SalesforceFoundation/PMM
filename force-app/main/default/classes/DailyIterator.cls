public with sharing class DailyIterator implements RecurrenceIteratorInterface {
    RecurrenceRule recurrenceRule;

    public DailyIterator(RecurrenceRule recurrenceRule) {
        this.recurrenceRule = recurrenceRule;
    }

    public List<DateTime> iterate(DateTime dateTimeStart) {
        // Comment
        return new List<DateTime>();
    }
}
