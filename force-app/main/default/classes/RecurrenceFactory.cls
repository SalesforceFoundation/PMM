public with sharing class RecurrenceFactory implements RecurrenceFactoryInterface {
    @TestVisible
    private RecurrenceRule recurrenceRule = new RecurrenceRule();

    public RecurrenceIteratorInterface makeIterator(String rRule) {
        recurrenceRule.reset().withRuleString(rRule);

        switch on recurrenceRule.getFrequency() {
            when DAILY {
                return new DailyIterator(recurrenceRule);
            }
            when WEEKLY {
                return new WeeklyIterator(recurrenceRule);
            }
            when else {
                return null;
            }
        }
    }
}
