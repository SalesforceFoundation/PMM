public with sharing class RecurrenceRule {
    // some examples
    // FREQ=DAILY;INTERVAL=3;UNTIL=20200925T000000Z
    // FREQ=WEEKLY;INTERVAL=1;BYDAY=SU,MO,TU,WE,TH,FR,SA;UNTIL=20200925T000000Z
    // FREQ=WEEKLY;INTERVAL=1;BYDAY=SU,MO,TU,WE,TH,FR,SA;COUNT=10
    // FREQ=WEEKLY;INTERVAL=2;BYDAY=MO,WE;COUNT=12

    public enum Frequency {
        DAILY
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

    public RecurrenceRule reset() {
        this.rRule = null;
        this.freq = null;
        this.interval = 1;
        this.endDate = null;
        this.count = null;
        this.days = null;
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
        this.interval = interval;
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

    public RecurrenceRule withRuleString(String rrString) {
        this.rRule = rrString;
        parse();
        return this;
    }

    public Frequency getFrequency() {
        return this.freq;
    }

    public Integer getInterval() {
        return this.interval;
    }

    public Date getEndDate() {
        return this.endDate;
    }

    public Integer getCount() {
        return this.count;
    }

    public List<Day> getDays() {
        return this.days;
    }

    public String build() {
        // TODO: build the rule string from the RecurrenceRule object
        // FREQ (required)
        String rRule = 'FREQ=' + this.freq + ';';

        // INTERVAL
        if (this.interval != 1) {
            rRule += 'INTERVAL=' + this.interval + ';';
        }

        // UNTIL
        if (this.endDate != null) {
            String year = String.valueOf(this.endDate.year());
            String month = String.valueOf(this.endDate.month());
            String day = String.valueOf(this.endDate.day());
            rRule += ';UNTIL=' + year + month + day + 'T000000Z';
        }

        // COUNT
        if (this.count != null) {
            rRule += ';COUNT=' + this.count;
        }

        // BYDAY
        if (this.days.size() > 0) {
            List<String> dayStrings = new List<String>();
            for (Day day : this.days) {
                dayStrings.add(day.name());
            }
            rRule += ';BYDAY=' + String.join(dayStrings, ',');
        }

        this.rRule = rRule;
        return this.rRule;
    }

    private void parse() {
        List<String> ruleParts = this.rRule.split(';');

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
                        this.interval = Integer.valueOf(thisValue);
                    }
                    when 'UNTIL' {
                        Integer year = Integer.valueOf(thisValue.left(4));
                        Integer month = Integer.valueOf(thisValue.mid(4, 2));
                        Integer day = Integer.valueOf(thisValue.mid(6, 2));
                        this.endDate = Date.newInstance(year, month, day);
                    }
                    when 'COUNT' {
                        this.count = Integer.valueOf(thisValue);
                    }
                    when 'BYDAY' {
                        List<Integer> dayNums = new List<Integer>();
                        for (String day : thisValue.split(',')) {
                            dayNums.add(Integer.valueOf(day));
                        }
                        populateDays(dayNums);
                    }
                    when else {
                        throw new RecurrenceRuleException('Invalid RRule Key');
                    }
                }
            }
        }
    }

    private void setFreqFromString(String freqString) {
        for (Frequency freq : Frequency.values()) {
            if (freq.name() == freqString.toUpperCase()) {
                this.freq = freq;
                break;
            }
        }
        if (this.freq == null) {
            throw new RecurrenceRuleException('Invalid frequency type.');
        }
    }

    private void populateDays(List<Integer> days) {
        this.days = new List<Day>();
        List<Day> dayValues = Day.values();

        for (Integer dayNum : days) {
            if (dayNum < dayValues.size()) {
                // Expecting the day num value to start at 1; Su-Sa => 1-7
                this.days.add(Day.values()[dayNum - 1]);
            } else {
                throw new RecurrenceRuleException('Invalid day number.');
            }
        }
    }

    public class RecurrenceRuleException extends Exception {
    }
}
