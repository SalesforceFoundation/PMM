public with sharing class DailyIterator implements RecurrenceIteratorInterface {
    private List<DateTime> result;
    private Date runningDate;
    @TestVisible
    private RecurrenceRule rRule;

    public DailyIterator(RecurrenceRule rRule) {
        this.rRule = rRule;
    }

    public List<DateTime> iterate(DateTime datetimeStart) {
        result = new List<DateTime>();
        runningDate = datetimeStart.date();
        // everything relative to local user TZ

        do {
            result.add(DateTime.newInstance(runningDate, datetimeStart.time()));
        } while (hasNext());

        return result;
    }

    private Boolean hasNext() {
        incrementRunningDate();
        Integer count = rRule.getCount();
        Date endDate = rRule.getEndDate();
        if (count != null && result.size() >= count) {
            return false;
        } else if (endDate != null && runningDate > endDate) {
            return false;
        }
        return true;
    }

    private void incrementRunningDate() {
        runningDate = runningDate.addDays(rRule.getInterval());
    }
}
