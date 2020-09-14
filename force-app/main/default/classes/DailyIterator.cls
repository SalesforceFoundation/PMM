public with sharing class DailyIterator implements RecurrenceIteratorInterface {
    @TestVisible
    RecurrenceRule recurrenceRule;

    public DailyIterator(RecurrenceRule recurrenceRule) {
        this.recurrenceRule = recurrenceRule;
    }

    public List<DateTime> iterate(DateTime dateTimeStart) {
        // TODO: add actual iteration
        return new List<DateTime>{ dateTimeStart };
    }
}
