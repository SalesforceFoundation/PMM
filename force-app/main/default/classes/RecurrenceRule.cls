/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class RecurrenceRule {
    // some examples
    // FREQ=DAILY;INTERVAL=3;UNTIL=20200925T000000Z
    // FREQ=WEEKLY;INTERVAL=1;BYDAY=SU,MO,TU,WE,TH,FR,SA;UNTIL=20200925T000000Z
    // FREQ=WEEKLY;INTERVAL=1;BYDAY=SU,MO,TU,WE,TH,FR,SA;COUNT=10
    // FREQ=WEEKLY;INTERVAL=2;BYDAY=MO,WE;COUNT=12

    public enum Frequency {
        DAILY,
        WEEKLY,
        MONTHLY
    }

    public enum Day {
        SU,
        MO,
        TU,
        WE,
        TH,
        FR,
        SA
    }

    @TestVisible
    private String rRule;
    private Frequency freq;
    private Integer interval = 1;
    private Date endDate;
    private Integer count;
    private List<Day> days;
    private Integer bySetPos = -1;
    private Set<Integer> byMonthDays;

    public RecurrenceRule reset() {
        rRule = null;
        freq = null;
        interval = 1;
        endDate = null;
        count = null;
        days = null;
        bySetPos = -1;
        byMonthDays = null;
        return this;
    }

    public RecurrenceRule withFrequency(Frequency freq) {
        this.freq = freq;
        return this;
    }

    public RecurrenceRule withFrequency(String freqString) {
        setFreqFromString(freqString);
        return this;
    }

    public RecurrenceRule withInterval(Integer interval) {
        if (interval != null) {
            this.interval = interval;
        }
        return this;
    }

    public RecurrenceRule withEndDate(Date endDate) {
        this.endDate = endDate;

        return this;
    }

    public RecurrenceRule withCount(Integer count) {
        this.count = count;
        return this;
    }

    public RecurrenceRule withDays(List<Day> days) {
        this.days = days;
        return this;
    }

    public RecurrenceRule withDays(List<Integer> days) {
        populateDays(days);
        return this;
    }

    public RecurrenceRule withByMonthDays(DateTime dateTimeStart) {
        if (freq != Frequency.MONTHLY) {
            return this;
        }

        Set<Integer> daysToAdd = new Set<Integer>();

        switch on dateTimeStart.day() {
            when 29 {
                daysToAdd.addAll(new Set<Integer>{ 28, 29 });
            }
            when 30 {
                daysToAdd.addAll(new Set<Integer>{ 28, 29, 30 });
            }
            when 31 {
                daysToAdd.addAll(new Set<Integer>{ 28, 29, 30, 31 });
            }
        }
        if (daysToAdd.size() != 0) {
            byMonthDays = daysToAdd;
        }

        return this;
    }

    public RecurrenceRule withRuleString(String rrString) {
        parseAndValidate(rrString);
        this.rRule = rrString;
        return this;
    }

    public Frequency getFrequency() {
        return freq;
    }

    public Integer getInterval() {
        return interval;
    }

    public Date getEndDate() {
        return endDate;
    }

    public Integer getCount() {
        return count;
    }

    public List<Day> getDays() {
        return days;
    }

    public Integer getBySetPos() {
        return -1;
    }

    public Set<Integer> getByMonthDays() {
        //This is to accomodate the Skip backward logic
        //TODO: allow customers to opt out

        return byMonthDays;
    }

    public List<Integer> getDayNums() {
        List<Integer> result = new List<Integer>();
        for (Day day : days) {
            result.add(day.ordinal());
        }
        return result;
    }

    public String build() {
        List<String> ruleParts = new List<String>();

        // FREQ (required)
        ruleParts.add('FREQ=' + freq);

        // INTERVAL
        if (interval > 1) {
            ruleParts.add('INTERVAL=' + interval);
        }

        // UNTIL
        if (endDate != null) {
            String endDateString = DateTime.newInstanceGMT(
                    endDate,
                    Time.newInstance(0, 0, 0, 0)
                )
                .formatGmt('yyyyMMdd');

            ruleParts.add('UNTIL=' + endDateString + 'T000000Z');
        }

        // COUNT
        if (count != null) {
            ruleParts.add('COUNT=' + count);
        }

        // BYDAY
        if (days != null && days.size() > 0) {
            List<String> dayStrings = new List<String>();
            for (Day day : days) {
                dayStrings.add(day.name());
            }
            ruleParts.add('BYDAY=' + String.join(dayStrings, ','));
        }

        //BYSETPOS
        if (bySetPos != null && freq == Frequency.MONTHLY) {
            ruleParts.add('BYSETPOS=' + bySetPos);
        }

        //BYMONTHDAY
        if (byMonthDays != null) {
            List<String> monthDays = new List<String>();
            for (Integer monthday : byMonthDays) {
                monthDays.add(String.valueOf(monthday));
            }

            ruleParts.add('BYMONTHDAY=' + String.join(monthDays, ','));
        }

        rRule = String.join(ruleParts, ';');

        return rRule;
    }

    private void parseAndValidate(String rRuleString) {
        List<String> ruleParts = rRuleString.split(';');

        for (String part : ruleParts) {
            List<String> thisPart = part.split('=');

            if (!thisPart.isEmpty()) {
                String thisKey = thisPart[0].toUpperCase();
                String thisValue = thisPart[1];

                switch on thisKey {
                    when 'FREQ' {
                        setFreqFromString(thisValue);
                    }
                    when 'INTERVAL' {
                        interval = Integer.valueOf(thisValue);
                    }
                    when 'UNTIL' {
                        Integer year = Integer.valueOf(thisValue.left(4));
                        Integer month = Integer.valueOf(thisValue.mid(4, 2));
                        Integer day = Integer.valueOf(thisValue.mid(6, 2));
                        endDate = Date.newInstance(year, month, day);
                    }
                    when 'COUNT' {
                        count = Integer.valueOf(thisValue);
                    }
                    when 'BYDAY' {
                        List<String> dayStrings = thisValue.split(',');
                        days = new List<Day>();
                        for (Day day : Day.values()) {
                            if (dayStrings.contains(day.name())) {
                                days.add(day);
                            }
                        }
                    }
                    when 'BYSETPOS' {
                        bySetPos = Integer.valueOf(thisValue);
                    }
                    when 'BYMONTHDAY' {
                        List<String> monthDaysString = thisValue.split(',');
                        byMonthDays = new Set<Integer>();
                        for (String monthday : monthDaysString) {
                            byMonthDays.add(Integer.valueOf(monthday));
                        }
                    }
                    when else {
                        reset();
                        throw new RecurrenceRuleException('Invalid RRule Key');
                        // TODO: distinguish between valid RRule parameters that we don't support,
                        // and invalid RRule parameters that don't exist in the spec

                        // TODO: Consider validating that at least one end condition exists: count or endDate
                    }
                }
            }
        }
    }

    private void setFreqFromString(String freqString) {
        for (Frequency frequency : Frequency.values()) {
            if (frequency.name() == freqString.toUpperCase()) {
                freq = frequency;
                break;
            }
        }
        if (freq == null) {
            throw new RecurrenceRuleException('Invalid frequency type.');
        }
    }

    private void populateDays(List<Integer> dayNums) {
        List<Day> daysToAssign = new List<Day>();
        List<Day> dayValues = Day.values();

        if (dayNums == null) {
            return;
        }

        for (Integer dayNum : dayNums) {
            if (dayNum <= dayValues.size()) {
                // Expecting the day num value to start at 1; Su-Sa => 1-7
                daysToAssign.add(Day.values()[dayNum - 1]);
            } else {
                throw new RecurrenceRuleException('Invalid day number.');
            }
        }

        days = daysToAssign;
    }

    public class RecurrenceRuleException extends Exception {
    }
}
