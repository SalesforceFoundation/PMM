public with sharing class RecurrenceRule {
    public enum Frequency {
        DAILY
    }
    private String rRule;
    private Frequency freq;
    private List<String> days;

    public RecurrenceRule reset() {
        this.rRule = null;
        this.freq = null;
        this.days = null;

        return this;
    }

    public RecurrenceRule withFrequency(Frequency freq) {
        this.freq = freq;

        return this;
    }

    public RecurrenceRule withFrequency(String freq) {
        this.freq = Frequency.valueOf(freq.toLowerCase());

        return this;
    }

    public RecurrenceRule withDays(List<String> days) {
        this.days = days;

        return this;
    }

    public RecurrenceRule withString(String rRule) {
        this.rRule = rRule;
        // parse();

        return this;
    }

    public Frequency getFrequency() {
        return this.freq;
    }

    public String build() {
        // TODO: build rRule FREQ=this.freq...
        return rRule;
    }
}
