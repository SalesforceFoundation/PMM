trigger ServiceScheduleTrigger on ServiceSchedule__c(
    before insert,
    before update
) {
    new ServiceScheduleTriggerHandler().execute();
}
