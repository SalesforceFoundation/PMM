trigger ServiceDeliveryTrigger on SOBJECT(
    after insert,
    after update,
    after delete,
    after undelete
) {
    new ServiceDeliveryTriggerHandler().execute();
}
