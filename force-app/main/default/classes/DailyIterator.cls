<<<<<<< HEAD
public with sharing class DailyIterator implements RecurrenceIteratorFactory.RecurrenceIterator {
    private List<DateTime> result;
    private DateTime runningDateTime;
    private RecurrenceRule rRule;

    public List<DateTime> iterate(DateTime dtStart, RecurrenceRule rRule) {
        this.result = new List<DateTime>();
        this.runningDateTime = dtStart;
        this.rRule = rRule;

        this.result.add(runningDateTime);

        while (keepGoing()) {
            addDateTime();
        }

        return result;
    }

    private Boolean keepGoing() {
        Integer count = this.rRule.getCount();
        Date endDate = this.rRule.getEndDate();
        if (count != null && this.result.size() >= count) {
            return false;
        } else if (endDate != null && this.runningDateTime > endDate) {
            return false;
        }
        return true;
    }

    private void addDateTime() {
        DateTime nextDateTime = this.runningDateTime.addDays(this.rRule.getInterval());
        this.result.add(nextDateTime);
        this.runningDateTime = nextDateTime;
=======
public with sharing class DailyIterator implements RecurrenceIteratorInterface {
    @TestVisible
    RecurrenceRule recurrenceRule;

    public DailyIterator(RecurrenceRule recurrenceRule) {
        this.recurrenceRule = recurrenceRule;
    }

    public List<DateTime> iterate(DateTime dateTimeStart) {
        // TODO: add actual iteration
        return new List<DateTime>{ dateTimeStart };
>>>>>>> feature/Winter-21__rr-rules
    }
}
