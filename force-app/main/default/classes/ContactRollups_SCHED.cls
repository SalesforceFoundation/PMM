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
        List<SObjectField> rollupFields = new List<SObjectField>{
            Contact.LastServiceDate__c,
            Contact.ConsecutiveAbsences__c,
            Contact.NumAbsentServiceDeliveries__c,
            Contact.NumPresentServiceDeliveries__c
        };

        String soql = 'SELECT Id FROM Contact WHERE ';

        // Contact with any of our rollup fields populated
        for (SobjectField field : rollupFields) {
            soql += (String.valueOf(field) + ' != null OR ');
        }

        Set<Id> parentIds = new Set<Id>();
        List<ServiceDelivery__c> relevantServiceDeliveries = [
            SELECT Contact__c
            FROM ServiceDelivery__c
            WHERE
                AttendanceStatus__c != NULL
                OR (DeliveryDate__c != NULL
                AND Quantity__c != NULL)
        ];
        for (ServiceDelivery__c child : relevantServiceDeliveries) {
            parentIds.add(child.Contact__c);
        }

        // Contact with any delivery records with attendance
        // Contact with any delivery record with delivery date and qty
        soql += ' Id IN :parentIds';

        return Database.getQueryLocator(soql);
    }

    /*******************************************************************************************************
     * @description execute Method for the Database.Batchable interface
     * @param bc the BatchableContext
     * @param scope the list of Account objects to process
     * @return void
     ********************************************************************************************************/
    public void execute(Database.BatchableContext bc, List<Account> scope) {
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
