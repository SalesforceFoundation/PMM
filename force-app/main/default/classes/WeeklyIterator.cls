public with sharing class WeeklyIterator implements RecurrenceIteratorInterface {
    private List<DateTime> result;
    private Date runningDate;
    private Date startDate;
    @TestVisible
    private RecurrenceRule rRule;
    private List<Date> firstWeekInstances;
    // NOTE: firstWeekInstances goes back to WKST=MO, regardless of start date,
    // so these may not all be in the final result
    private List<Integer> dayNums;

    public WeeklyIterator(RecurrenceRule rRule) {
        this.rRule = rRule;
    }

    public List<DateTime> iterate(DateTime dateTimeStart) {
        result = new List<DateTime>();
        firstWeekInstances = new List<Date>();
        dayNums = rRule.getDayNums();
        startDate = datetimeStart.date();
        // everything relative to local user TZ

        setFirstWeekInstances();

        Integer counter = 0;
        do {
            for (Date instance : firstWeekInstances) {
                runningDate = instance.addDays(7 * rRule.getInterval() * counter);

                if (!hasNext()) {
                    return result;
                }

                if (runningDate >= startDate) {
                    result.add(DateTime.newInstance(runningDate, dateTimeStart.time()));
                }
            }
            counter++;
        } while (hasNext());

        return result;
    }

    private void setFirstWeekInstances() {
        // Get the Monday of startDate's week to ensure default of WKST=MO
        Date runningDate = startDate.toStartOfWeek();
        if (getDayIndex(runningDate) == 0) {
            runningDate = runningDate.addDays(1);
        }

        for (Integer i = 0; i < 7; i++) {
            if (dayNums.contains(getDayIndex(runningDate))) {
                firstWeekInstances.add(runningDate);
            }
            runningDate = runningDate.addDays(1);
        }
    }

    private Boolean hasNext() {
        Integer count = rRule.getCount();
        Date endDate = rRule.getEndDate();
        if (count != null && result.size() >= count) {
            return false;
        } else if (endDate != null && endDate < runningDate) {
            return false;
        }
        return true;
    }

    private Integer getDayIndex(Date inputDate) {
        Date sunday = Date.newInstance(2012, 1, 1);
        return Math.mod(sunday.daysBetween(inputDate), 7);
    }
}
