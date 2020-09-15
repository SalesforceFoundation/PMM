public with sharing class WeeklyIterator implements RecurrenceIteratorInterface {
    private List<Datetime> result;
    private Datetime runningDatetime;
    @TestVisible
    private RecurrenceRule rRule;

    public WeeklyIterator(RecurrenceRule rRule) {
        this.rRule = rRule;
    }

    public List<Datetime> iterate(Datetime datetimeStart) {
        this.result = new List<Datetime>();
        this.runningDatetime = datetimeStart;

        this.result.add(this.runningDatetime);

        return result;
    }
}
