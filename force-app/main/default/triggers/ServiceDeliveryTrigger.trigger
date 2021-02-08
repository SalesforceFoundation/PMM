trigger ServiceDeliveryTrigger on ServiceDelivery__c(
    after insert,
    after update,
    after delete,
    after undelete
) {
    new ServiceDeliveryTriggerHandler().execute();
}
