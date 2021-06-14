List<%%%NAMESPACE%%%Service__c> servicesToUpdate = new List<%%%NAMESPACE%%%Service__c>();

for (%%%NAMESPACE%%%Service__c service : [SELECT Name, %%%NAMESPACE%%%ServiceDeliveryFieldSet__c FROM %%%NAMESPACE%%%Service__c WHERE Name = '12 Step Recovery Program']){
    service.%%%NAMESPACE%%%ServiceDeliveryFieldSet__c = 'Alternate';
    servicesToUpdate.add(service);
}
for (%%%NAMESPACE%%%Service__c service : [SELECT Name, %%%NAMESPACE%%%ServiceDeliveryFieldSet__c FROM %%%NAMESPACE%%%Service__c WHERE Name = 'Subsidized Lunch']){
    service.%%%NAMESPACE%%%ServiceDeliveryFieldSet__c = 'Alternate_no_service';
    servicesToUpdate.add(service);
}

update servicesToUpdate;