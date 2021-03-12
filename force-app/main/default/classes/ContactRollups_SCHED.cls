public class ContactRollups_SCHED implements Database.Batchable<SObject>, Schedulable {
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

    /*******************************************************************************************************
     * @description Schedulable execute method executes this batch job
     ********************************************************************************************************/
    public void execute(SchedulableContext context) {
        Database.executeBatch(new ContactRollups_SCHED(), batchSize);
    }

    /*******************************************************************************************************
     * @description start Method for the Database.Batchable interface
     * @param bc the BatchableContext
     * @return database.Querylocator
     ********************************************************************************************************/
    public Database.Querylocator start(Database.BatchableContext bc) {
        List<SObjectField> rollupIntegerFields = new List<SObjectField>{
            Contact.ConsecutiveAbsences__c,
            Contact.NumAbsentServiceDeliveries__c,
            Contact.NumPresentServiceDeliveries__c
        };

        List<String> attendanceStatuses = new AttendanceService().attendanceStatuses;

        String soql = 'SELECT Id, ';

        // Contact with any delivery records with attendance
        // Contact with any delivery records with delivery date and qty
        soql +=
            '(SELECT Contact, AttendanceStatus__c, DeliveryDate__c, Quantity__c ' +
            'FROM ServiceDelivery__c ' +
            'WHERE AttendanceStatus__c IN :attendanceStatuses OR (DeliveryDate__c <= TODAY AND Quantity__c > 0) ';

        soql += 'FROM Contact';

        // Contact with any of our rollup fields populated
        // Can't filter for this since we need to use subquery above since ORs aren't allowed in joins

        return Database.getQueryLocator(soql);
    }

    /*******************************************************************************************************
     * @description execute Method for the Database.Batchable interface
     * @param bc the BatchableContext
     * @param scope the list of Account objects to process
     * @return void
     ********************************************************************************************************/
    public void execute(Database.BatchableContext bc, List<Contact> scope) {
        new AttendanceService().doBatchRollups(scope);
    }

    /*******************************************************************************************************
     * @description finish Method for the Database.Batchable interface
     * @param bc the BatchableContext
     * @return void
     ********************************************************************************************************/
    public void finish(Database.BatchableContext bc) {
    }
}
