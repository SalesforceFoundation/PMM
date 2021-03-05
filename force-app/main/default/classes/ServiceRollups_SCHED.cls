public class ServiceRollups_SCHED implements Database.Batchable<SObject>, Schedulable {
    @TestVisible
    private static AttendanceService attendanceService = new AttendanceService();

    @TestVisible
    private final static Integer DEFAULT_BATCH_SIZE = 10;

    @TestVisible
    private Integer batchSize {
        get {
            // Allowing for future customization of batch size.
            return DEFAULT_BATCH_SIZE;
        }
        set;
    }

    public void execute(SchedulableContext context) {
        Database.executeBatch(new ServiceRollups_SCHED(), batchSize);
    }

    public Database.Querylocator start(Database.BatchableContext bc) {
        List<String> attendanceStatuses = attendanceService.getAttendanceStatuses();

        QueryBuilder query = new QueryBuilder();
        query.withSObjectType(Service__c.SObjectType);
        query.withSelectFields(
            new List<String>{
                String.valueOf(Service__c.NumPresentServiceDeliveries__c),
                String.valueOf(Service__c.NumAbsentServiceDeliveries__c)
            }
        );

        QueryBuilder subQuery = new QueryBuilder();
        subQuery.withChildRelationshipName('ServiceDeliveries__r');
        subquery.withSelectFields(
            new List<String>{
                String.valueOf(ServiceDelivery__c.Service__c),
                String.valueOf(ServiceDelivery__c.AttendanceStatus__c),
                String.valueOf(ServiceDelivery__c.DeliveryDate__c),
                String.valueOf(ServiceDelivery__c.Quantity__c)
            }
        );
        // Service__c with any delivery records with attendance
        // Service__c with any delivery records with delivery date and qty
        subQuery.addCondition(
            String.valueOf(ServiceDelivery__c.AttendanceStatus__c) +
            ' IN :attendanceStatuses OR (' +
            String.valueOf(ServiceDelivery__c.DeliveryDate__c) +
            ' <= TODAY AND ' +
            String.valueOf(ServiceDelivery__c.Quantity__c) +
            ' > 0) '
        );

        query.addSubQuery(subQuery);

        // Service__c with any of our rollup fields populated
        // Note: Can't filter for this since we need to use subquery above since ORs aren't allowed in joins

        return Database.getQueryLocator(query.buildSoqlQuery());
    }

    public void execute(Database.BatchableContext bc, List<Service__c> scope) {
        attendanceService.doRollups(scope);
    }

    public void finish(Database.BatchableContext bc) {
    }
}
