public with sharing class MonthlyIterator implements RecurrenceIteratorInterface {
    private List<DateTime> result;
    private Date runningDate;
    @TestVisible
    private RecurrenceRule rRule;

    public MonthlyIterator(RecurrenceRule rRule) {
        this.rRule = rRule;
    }

    public List<DateTime> iterate(DateTime dateTimeStart) {
        result = new List<DateTime>();
        runningDate = dateTimeStart.date();
        Integer startDay;

        do {
            if (rRule.getBySetPos() != null && rRule.getByMonthDays() != null) {
                //The startDay variable will hold the max value that is returned by rRule.getByMonthDays.
                startDay = getMaxByMonthDays(rRule.getByMonthDays());
                result.add(DateTime.newInstance(runningDate, dateTimeStart.time()));

                //Here we are adding days after adding months. So the number of days we are adding will
                //be the difference of startDay and runningDate.day().

                //Eg : if startdate is 1/31/2020 and we are creating occurences until 04/30/2020. The start date is added
                //to the result and when we get here it adds 1 month to it and then adds 0 days since the dateTimeStartDay
                //is 31 and runningdate.day is 31 and the new date will be 02/29/2020
                //In the next iteration it adds 31 - 29 which is 2 days and the new date will be 03/31/2020 and in the next iteration
                //it adds 0 days and the end date is 04/30/2020 etc...

                runningDate = runningDate.addMonths(rRule.getInterval())
                    .addDays(startDay - runningDate.day());
            } else {
                //The below value is defaulted to the day of the start date and is used to add days to runningDate below.

                startDay = dateTimeStart.date().day();

                result.add(DateTime.newInstance(runningDate, dateTimeStart.time()));

                runningDate = runningDate.addMonths(rRule.getInterval())
                    .addDays(startDay - runningDate.day());
            }
        } while (hasNext());

        return result;
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

    public Integer getMaxByMonthDays(Set<Integer> byMonthDays) {
        Integer maxValue = 0;

        for (Integer day : byMonthDays) {
            maxValue = Math.max(maxValue, day);
        }
        return maxValue;
    }
}
