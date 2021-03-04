public class ContactRollups_SCHED implements Database.Batchable<SObject>, Schedulable {
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
        Database.executeBatch(new ContactRollups_SCHED(), batchSize);
    }

    public Database.Querylocator start(Database.BatchableContext bc) {
        List<String> attendanceStatuses = attendanceService.getAttendanceStatuses();

        String soql = 'SELECT Id, ';

        // Contact with any delivery records with attendance
        // Contact with any delivery records with delivery date and qty
        soql +=
            '(SELECT Contact__c, AttendanceStatus__c, DeliveryDate__c, Quantity__c ' +
            'FROM Service_Deliveries__r ' +
            'WHERE AttendanceStatus__c IN :attendanceStatuses OR (DeliveryDate__c <= TODAY AND Quantity__c > 0)) ';

        soql += 'FROM Contact';

        // TODO: refactor this to use querybuilder and just send in the where as one giant clause

        // Contact with any of our rollup fields populated
        // Note: Can't filter for this since we need to use subquery above since ORs aren't allowed in joins

        return Database.getQueryLocator(soql);
    }

    public void execute(Database.BatchableContext bc, List<Contact> scope) {
        attendanceService.doRollups(scope);
    }

    public void finish(Database.BatchableContext bc) {
    }
}
