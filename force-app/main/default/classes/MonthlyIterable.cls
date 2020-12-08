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
        System.debug('rRule.getByDay()' + rRule.getByDay());
        System.debug('runningCount' + runningCount);
        if (runningCount == 0 && rRule.getByDay() == null) {
            return; // Use first running date;
        }

        Integer startDay;

        if (rRule.getBySetPos() != null && byMonthDays != null) {
            //The startDay variable will hold the max value that is returned by rRule.getByMonthDays.
            startDay = byMonthDays[byMonthDays.size() - 1];

            //Here we are adding days after adding months. So the number of days we are adding will
            //be the difference of startDay and runningDate.day().
            //Eg : if startdate is 1/31/2020 and we are creating occurences until 04/30/2020. The start date is added
            //to the result and when we get here it adds 1 month to it and then adds 0 days since the dateTimeStartDay
            //is 31 and runningdate.day is 31 and the new date will be 02/29/2020
            //In the next iteration it adds 31 - 29 which is 2 days and the new date will be 03/31/2020 and in the next iteration
            //it adds 0 days and the end date is 04/30/2020 etc...
            if (startDay == 31) {
                runningDate = runningDate.addDays(1)
                    .addMonths(rRule.getInterval())
                    .addDays(-1);
            } else {
                runningDate = runningDate.addMonths(rRule.getInterval())
                    .addDays(startDay - runningDate.day());
            }
        } else if (rRule.getByDay() != null && runningCount == 0) {
            Integer monthlyRecurrenceNumber = Integer.valueOf(getRecurrenceWeek());
            // now compare that to the start date
            Date firstOccurenceOfMonth = getFirstOccurenceOfMonth();
            System.debug('firstOccurenceOfMonth : ' + firstOccurenceOfMonth);

            // if start date < new date then we can keep this as first date
            if (monthlyRecurrenceNumber == 1) {
                runningDate = firstOccurenceOfMonth;
            } else {
                Date tempDate = firstOccurenceOfMonth.addDays(
                    (monthlyRecurrenceNumber - 1) * 7
                );

                while (tempDate.month() > runningDate.month()) {
                    runningDate = tempDate.toStartOfMonth();
                    firstOccurenceOfMonth = getFirstOccurenceOfMonth();
                    tempDate = firstOccurenceOfMonth.addDays(
                        (monthlyRecurrenceNumber - 1) * 7
                    );
                }

                runningDate = tempDate;
            }
        } else if (rRule.getByDay() != null && runningCount > 0) {
            System.debug('inside else running');
            runningDate = runningDate.toStartOfMonth().addMonths(rRule.getInterval());
            Integer monthlyRecurrenceNumber = Integer.valueOf(getRecurrenceWeek());
            // now compare that to the start date
            Date firstOccurenceOfMonth = getFirstOccurenceOfMonth();
            System.debug('firstOccurenceOfMonth : ' + firstOccurenceOfMonth);
            // if start date < new date then we can keep this as first date
            if (monthlyRecurrenceNumber == 1) {
                runningDate = firstOccurenceOfMonth;
            } else {
                Date tempDate = firstOccurenceOfMonth.addDays(
                    (monthlyRecurrenceNumber - 1) * 7
                );
                Integer counter = 0;

                while (tempDate.month() > runningDate.month()) {
                    runningDate = runningDate.addMonths(rRule.getInterval());
                    firstOccurenceOfMonth = getFirstOccurenceOfMonth();
                    tempDate = firstOccurenceOfMonth.addDays(
                        (monthlyRecurrenceNumber - 1) * 7
                    );
                }
                runningDate = tempDate;
            }

            System.debug('runningDate : ' + runningDate);
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
        // Get the first occurance to the day
        // since we are doing tpStartOfmonth that will give us the first occurence of the day
        // get the occurence they are looking for that month

        String recurrenceWeekDayAbbr = getWeekDayAbbr();
        Integer recurrenceWeekDayNum = rRule.getDayNum(recurrenceWeekDayAbbr) + 1;
        System.debug('recurrenceWeekDayNum' + recurrenceWeekDayNum);
        System.debug('startOfMonthDayNum' + startOfMonthDayNum);
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
        System.debug('firstWeekDayOccurence' + firstWeekDayOccurence);
        return firstWeekDayOccurence;
    }
}
