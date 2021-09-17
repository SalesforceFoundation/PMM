trigger ProgramEngagementTrigger on ProgramEngagement__c(
    after insert,
    after update,
    after delete,
    after undelete
) {
    new ProgramEngagementTriggerHandler().execute();
}
