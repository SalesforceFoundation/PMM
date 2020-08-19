Set<String> sObjectNames = new Set<String>{
    Schema.SObjectType.Account.getName(),
    Schema.SObjectType.Contact.getName(),
    Schema.SObjectType.Case.getName(),
    Schema.SObjectType.Opportunity.getName()
};

for (TabDefinition tab : [SELECT SObjectName FROM TabDefinition WHERE IsCustom = TRUE]) {
    if (tab.SObjectName.endsWith('__c')) {
        sObjectNames.add(tab.SObjectName);
    }
}

// Add the Schema.DescribeSObjectResult for each tab in Case Management App
for (String sObjectName : sObjectNames) {
    try {
        Database.query(
            String.format('SELECT Id FROM {0} FOR VIEW', new List<String>{ sObjectName })
        );
    } catch (Exception e) {
        // Object must have a Tab to be queried with FOR VIEW/REFERENCE
    }
}
