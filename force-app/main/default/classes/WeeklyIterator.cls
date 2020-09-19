public with sharing class WeeklyIterator implements RecurrenceIteratorInterface {
    private List<DateTime> result;
    private Date runningDate;
    private Date startDate;
    @TestVisible
    private RecurrenceRule rRule;

    public WeeklyIterator(RecurrenceRule rRule) {
        this.rRule = rRule;
    }

    public List<DateTime> iterate(DateTime dateTimeStart) {
        result = new List<DateTime>();

        // everything relative to local user TZ
        startDate = dateTimeStart.date();

        // NOTE: firstWeekInstances goes back to WKST=MO, regardless of start date,
        // so these may not all be in the final result
        List<Date> firstWeekInstances = getFirstWeekInstances();

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

    private List<Date> getFirstWeekInstances() {
        List<Date> result = new List<Date>();
        List<Integer> dayNums = rRule.getDayNums();

        // Get the Monday of startDate's week to ensure default of WKST=MO
        Date firstWeekRunningDate = startDate.toStartOfWeek();
        if (getDayIndex(startDate) == 0) {
            // startDate is a Sunday; back up 6 days to the previous Monday
            firstWeekRunningDate = firstWeekRunningDate.addDays(-6);
        } else if (getDayIndex(firstWeekRunningDate) == 0) {
            // otherwise, if firstWeekRunningDate returns a Sunday, bump to the Monday 1 day later
            firstWeekRunningDate = firstWeekRunningDate.addDays(1);
        }

        for (Integer i = 0; i < 7; i++) {
            if (dayNums.contains(getDayIndex(firstWeekRunningDate))) {
                result.add(firstWeekRunningDate);
            }
            firstWeekRunningDate = firstWeekRunningDate.addDays(1);
        }
        return result;
    }

    private Boolean hasNext() {
        Integer count = rRule.getCount();
        Date endDate = rRule.getEndDate();
        if (count != null && result.size() >= count) {
            return false;
        } else if (endDate != null && endDate < runningDate) {
            return false;
        } else if (count == null && endDate == null) {
            return false; // functionally a count of 0 when nothing is specified
        }
        return true;
    }

    private Integer getDayIndex(Date inputDate) {
        Date sunday = Date.newInstance(2012, 1, 1);
        return Math.mod(sunday.daysBetween(inputDate), 7);
    }
}
