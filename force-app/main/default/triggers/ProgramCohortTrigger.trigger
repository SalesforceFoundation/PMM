trigger ProgramCohortTrigger on ProgramCohort__c(
    before insert,
    before update
//    after update,
//    after delete,
//    after undelete
) {
    new ProgramCohortTriggerHandler().execute();
}
