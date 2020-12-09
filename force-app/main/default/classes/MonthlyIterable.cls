/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class MonthlyIterable extends DailyIterable {
    private List<Integer> byMonthDays;

    public MonthlyIterable(Date runningDate, RecurrenceRule rRule) {
        super(runningDate, rRule);

        if (rRule == null || rRule.getByMonthDays() == null) {
            return;
        }

        byMonthDays = new List<Integer>(rRule.getByMonthDays());
        byMonthDays.sort();
    }

    public override void calculateRunningDate() {
        if (runningCount == 0 && rRule.getByDay() == null) {
            return; // Use first running date;
        }

        Integer startDay;

        if (rRule.getBySetPos() != null && byMonthDays != null) {
            //The startDay variable will hold the max value that is returned by rRule.getByMonthDays.
            startDay = byMonthDays[byMonthDays.size() - 1];

            if (startDay == 31) {
                runningDate = runningDate.addDays(1)
                    .addMonths(rRule.getInterval())
                    .addDays(-1);
            } else {
                runningDate = runningDate.addMonths(rRule.getInterval())
                    .addDays(startDay - runningDate.day());
            }
        } else if (rRule.getByDay() != null) {
            calculateRecurrenceRunningDate();
        } else {
            //The below value is defaulted to the day of the start date and is used to add days to runningDate below.
            startDay = runningDate.day();

            runningDate = runningDate.addMonths(rRule.getInterval())
                .addDays(startDay - runningDate.day());
        }
    }

    public String getRecurrenceWeek() {
        String byDay = rRule.getByDay();
        String dayNumber = byDay.subString(1, 2); // This holds first or second

        return dayNumber;
    }

    public String getWeekDayAbbr() {
        String byDay = rRule.getByDay();
        String weekDayName = byDay.subString(2); //This holds the day name
        return weekDayName;
    }

    public Date getFirstOccurenceOfMonth() {
        Date firstWeekDayOccurence;
        // We need to see what month and get to the start of the month
        Date startOfMonth = runningDate.toStartOfMonth();

        // Check what day of the week the start of the month is i.e Tuesday, wednesday
        Integer startOfMonthDayNum = Util.getDayNum(startOfMonth);

        String recurrenceWeekDayAbbr = getWeekDayAbbr();
        Integer recurrenceWeekDayNum = rRule.getDayNum(recurrenceWeekDayAbbr) + 1;
        if (recurrenceWeekDayNum == startOfMonthDayNum) {
            firstWeekDayOccurence = startOfMonth;
        } else if (recurrenceWeekDayNum < startOfMonthDayNum) {
            firstWeekDayOccurence = startOfMonth.addDays(
                7 - (startOfMonthDayNum - recurrenceWeekDayNum)
            );
        } else {
            firstWeekDayOccurence = startOfMonth.addDays(
                recurrenceWeekDayNum - startOfMonthDayNum
            );
        }

        return firstWeekDayOccurence;
    }

    public void calculateRecurrenceRunningDate() {
        if (runningCount > 0) {
            runningDate = runningDate.toStartOfMonth().addMonths(rRule.getInterval());
        }

        Integer monthlyRecurrenceNumber = Integer.valueOf(getRecurrenceWeek());
        Date firstOccurenceOfMonth = getFirstOccurenceOfMonth();

        if (monthlyRecurrenceNumber == 1) {
            runningDate = firstOccurenceOfMonth;
        } else {
            Date tempDate = firstOccurenceOfMonth.addDays(
                (monthlyRecurrenceNumber - 1) * 7
            );

            while (
                tempDate.month() > runningDate.month() ||
                tempDate.year() > runningDate.year()
            ) {
                if (runningCount == 0) {
                    runningDate = tempDate.toStartOfMonth();
                } else if (runningCount > 0) {
                    runningDate = runningDate.addMonths(rRule.getInterval());
                }

                firstOccurenceOfMonth = getFirstOccurenceOfMonth();
                tempDate = firstOccurenceOfMonth.addDays(
                    (monthlyRecurrenceNumber - 1) * 7
                );
            }

            runningDate = tempDate;
        }
    }
}
