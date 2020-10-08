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
        if (runningCount == 0) {
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
        } else {
            //The below value is defaulted to the day of the start date and is used to add days to runningDate below.
            startDay = runningDate.day();

            runningDate = runningDate.addMonths(rRule.getInterval())
                .addDays(startDay - runningDate.day());
        }
    }
}
