
Set<Schema.SObjectType> sObjectTypes = new Set<Schema.SObjectType> {
    Schema.Account.SObjectType,
    Schema.Contact.SObjectType,
    Schema.Case.SObjectType
};

{
    final Map<String, SObjectType> sObjectTypesByName = Schema.getGlobalDescribe();

    for (Schema.DescribeTabSetResult tabSet : Schema.describeTabs()) {
        for (Schema.DescribeTabResult tab : tabSet.getTabs()) {
            if (tab.isCustom()) {
                sObjectTypes.add(sObjectTypesByName.get(tab.getSObjectName()));
            }
        }
    }
}

// Add the Schema.DescribeSObjectResult for each tab in Case Management App
for (Schema.SObjectType sObjectType : sObjectTypes) {
    try {
        Database.query(String.format(
            'SELECT Id FROM {0} FOR VIEW',
            new List<String> {
                sObjectType.getDescribe().getName()
            }
        ));
    } catch (Exception e) {
        // Object must have a Tab to be queried with FOR VIEW/REFERENCE
    }
}
