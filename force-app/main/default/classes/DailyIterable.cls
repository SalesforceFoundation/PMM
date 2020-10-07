/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing virtual class DailyIterable implements Iterator<Date> {
    public RecurrenceRule rRule;
    public Date runningDate;
    public Integer runningCount;

    public DailyIterable(Date runningDate, RecurrenceRule rRule) {
        this.runningDate = runningDate;
        this.rRule = rRule;
        this.runningCount = 0;
    }

    public Boolean hasNext() {
        if (rRule == null || runningDate == null) {
            return false;
        }

        Integer count = rRule.getCount();
        Date endDate = rRule.getEndDate();
        calculateRunningDate();

        if (count == null && endDate == null) {
            // If not present, and the COUNT rule part is also not present,
            // the "RRULE" is considered to repeat forever. See: RFC5545
            return true;
        }

        Boolean hasReachedCount = count != null && runningCount >= count;
        Boolean hasReachedEndDate = endDate != null && runningDate > endDate;

        return !(hasReachedCount || hasReachedEndDate);
    }

    public virtual void calculateRunningDate() {
        runningDate = runningCount == 0
            ? runningDate
            : runningDate.addDays(rRule.getInterval());
    }

    public Date next() {
        runningCount++;

        return runningDate;
    }
}
