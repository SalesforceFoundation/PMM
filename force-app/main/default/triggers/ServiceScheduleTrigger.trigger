trigger ServiceScheduleTrigger on ServiceSchedule__c(
    after insert,
    after update,
    after delete,
    after undelete
) {
    new ServiceScheduleTriggerHandler().execute();
}
