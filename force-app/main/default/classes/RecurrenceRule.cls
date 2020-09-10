public with sharing class RecurrenceRule {
    public enum Frequency {
        DAILY
    }
    private String rrString;
    private Frequency freq;
    private List<String> days;

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

    public RecurrenceRule withString(String rrString) {
        this.rrString = rrString;
        // parse();

        return this;
    }

    public Frequency getFrequency() {
        return this.freq;
    }

    public String buildString() {
        // TODO: build rrString FREQ=this.freq...
        return rrString;
    }
}
