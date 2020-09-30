public with sharing class WeeklyIterable extends DailyIterable {
    private Integer runningDayIndex;
    private List<Integer> dayNums;

    public WeeklyIterable(Date runningDate, RecurrenceRule rRule) {
        super(runningDate, rRule);
        this.runningDayIndex = 0;

        // Default WKST=MO;
        dayNums = rRule.getDayNums();
        dayNums.sort();
        if (dayNums[0] == 0) {
            dayNums.remove(0);
            dayNums.add(7);
        }
    }

    public override void calculateRunningDate() {
        Integer runningDateDayNum = getDayIndex(runningDate);
        Integer runningDayNum = dayNums[runningDayIndex];

        if (runningCount == 0 && dayNums.contains(runningDateDayNum)) {
            runningDayIndex = dayNums.indexOf(runningDateDayNum);
            runningDate = runningDate;
        } else if (runningDateDayNum < runningDayNum) {
            runningDate = runningDate.addDays(runningDayNum - runningDateDayNum);
        } else {
            runningDate = runningDate.addDays(
                (7 - runningDateDayNum + runningDayNum) + (rRule.getInterval() * 7 - 7)
            );
        }

        runningDayIndex = runningDayIndex == dayNums.size() - 1 ? 0 : runningDayIndex + 1;
    }

    private Integer getDayIndex(Date inputDate) {
        Date sunday = Date.newInstance(2012, 1, 1);
        Integer dayIndex = Math.mod(sunday.daysBetween(inputDate), 7);

        // Default WKST=MO;
        dayIndex += dayIndex == 0 ? 7 : 0;
        return dayIndex;
    }
}
