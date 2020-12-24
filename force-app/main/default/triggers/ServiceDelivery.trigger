trigger ServiceDelivery on ServiceDelivery__c(
    after delete,
    after insert,
    after undelete,
    after update
) {
    new ServiceDeliveryTriggerHandler().execute();
}
