trigger ServiceParticipantTrigger on ServiceParticipant__c(
    after insert,
    after update,
    after delete,
    after undelete
) {
    new ServiceParticipantTriggerHandler().execute();
}
