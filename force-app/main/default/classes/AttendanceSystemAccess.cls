public without sharing class AttendanceSystemAccess {
    private QueryBuilder queryBuilder = new QueryBuilder();

    public List<ServiceDelivery__c> getAttendanceRecords(
        SObjectField field,
        Set<Id> recordIds,
        List<String> statuses
    ) {
        queryBuilder
            .reset()
            .withSelectFields(
                new List<String>{
                    String.valueOf(field),
                    String.valueOf(ServiceDelivery__c.AttendanceStatus__c)
                }
            )
            .withSObjectType(ServiceDelivery__c.SObjectType)
            .addCondition(String.valueOf(field) + ' IN :recordIds')
            .addCondition(
                String.valueOf(ServiceDelivery__c.AttendanceStatus__c) + ' IN :statuses'
            )
            .withOrderBy(String.valueOf(field));

        return Database.query(queryBuilder.buildSoqlQuery());
    }

    public void updateRecords(List<SObject> sObjects) {
        update sObjects;
    }
}
