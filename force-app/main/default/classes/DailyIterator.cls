public with sharing class DailyIterator implements RecurrenceIteratorInterface {
    private List<DateTime> result;
    private DateTime runningDateTime;
    @TestVisible
    private RecurrenceRule rRule;

    public DailyIterator(RecurrenceRule rRule) {
        this.rRule = rRule;
    }

    public List<DateTime> iterate(DateTime datetimeStart) {
        result = new List<DateTime>();
        runningDateTime = datetimeStart;

        do {
            result.add(runningDateTime);
        } while (hasNext());

        return result;
    }

    private Boolean hasNext() {
        incrementRunningDateTime();
        Integer count = rRule.getCount();
        Date endDate = rRule.getEndDate();
        if (count != null && result.size() >= count) {
            return false;
        } else if (endDate != null && runningDateTime.date() > endDate) {
            // everything relative to local user TZ
            return false;
        }
        return true;
    }

    private void incrementRunningDateTime() {
        runningDateTime = runningDateTime.addDays(rRule.getInterval());
    }
}
