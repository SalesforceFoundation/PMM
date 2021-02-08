@IsTest
public with sharing class ServiceDeliveryTriggerHandler_TEST {
    @TestSetup
    private static void makeData() {
        TestDataFactory.generateServiceData();
    }

    private ServiceDelivery__c getServiceDelivery() {
        Service__c service = [SELECT Id FROM Service__c LIMIT 1];
        return new ServiceDelivery__c(Name = 'test', Service__c = service.Id);
    }

    @IsTest
    private static void testExecuteFromNonTrigger() {
        new ServiceDeliveryTriggerHandler().execute();
    }

    @IsTest
    private static void testDML() {
        // Note: strictly line coverage here since nothing is happening yet to Assert
        ServiceDelivery__c sd = getServiceDelivery();
        insert sd;
        update sd;
        delete sd;
        undelete sd;
    }
}
