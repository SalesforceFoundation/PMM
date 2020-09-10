public with sharing class RecurrenceFactory implements RecurrenceFactoryInterface {
    private RecurrenceRule recurrenceRule = new RecurrenceRule();

    public RecurrenceIteratorInterface makeIterator(String rRule) {
        recurrenceRule.reset().withString(rRule);

        switch on recurrenceRule.getFrequency() {
            when DAILY {
                return new DailyIterator(recurrenceRule);
            }
            when else {
                return null;
            }
        }
    }
}
