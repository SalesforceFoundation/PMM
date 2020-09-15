public with sharing class DailyIterator implements RecurrenceIteratorInterface {
    private List<Datetime> result;
    private Datetime runningDatetime;
    @TestVisible
    private RecurrenceRule rRule;

    public DailyIterator(RecurrenceRule rRule) {
        this.rRule = rRule;
    }

    public List<Datetime> iterate(Datetime datetimeStart) {
        this.result = new List<Datetime>();
        this.runningDatetime = datetimeStart;

        this.result.add(this.runningDatetime);

        while (keepGoing()) {
            this.result.add(this.runningDatetime);
        }

        return result;
    }

    private Boolean keepGoing() {
        incrementRunningDatetime();
        Integer count = this.rRule.getCount();
        Date endDate = this.rRule.getEndDate();
        if (count != null && this.result.size() >= count) {
            return false;
        } else if (endDate != null && this.runningDatetime.date() > endDate) {
            // everything relative to local user TZ
            return false;
        }
        return true;
    }

    private void incrementRunningDatetime() {
        this.runningDatetime = this.runningDatetime.addDays(this.rRule.getInterval());
    }
}
