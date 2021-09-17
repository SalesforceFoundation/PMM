trigger ProgramCohortTrigger on ProgramCohort__c(
    before insert,
    after insert
//    after update,
//    after delete,
//    after undelete
) {
    new ProgramCohortTriggerHandler().execute();
}
