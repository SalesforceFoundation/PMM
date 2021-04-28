@isTest
private class ContactRollupsBatchCalc_TEST {
    private static Set<Id> contactIds = new Set<Id>();
    @testSetup
    static void setup() {
        TestUtil.turnOffFeatureGates();
        TestDataFactory.generateAttendanceData('Monthly');
        setupAdditionalTestData();
    }

    private static void setupAdditionalTestData() {
        Account acc1 = new Account();
        acc1.Name = 'Test Account 1';
        insert acc1;

        Contact con0 = new Contact();
        con0.LastName = 'Test Con 0';
        con0.AccountId = acc1.Id;

        Contact con1 = new Contact();
        con1.LastName = 'Test Con 1';
        con1.AccountId = acc1.Id;

        Contact con2 = new Contact();
        con2.LastName = 'Test Con 2';
        con2.AccountId = acc1.Id;

        //This contact represents the case where it should be reset
        Contact con3 = new Contact();
        con3.LastName = 'Test Con 3';
        con3.AccountId = acc1.Id;
        con3.NumPresentServiceDeliveries__c = 3;
        con3.NumAbsentServiceDeliveries__c = 4;
        con3.ConsecutiveAbsences__c = 3;

        insert new List<Contact>{ con0, con1, con2, con3 };

        Service__c service1 = [
            SELECT Id, Program__c
            FROM Service__c
            WHERE Name = 'Service 1'
            LIMIT 1
        ];

        System.debug('Service 1 : ' + service1);

        Date today = Date.today();
        Date yesterday = Date.today().addDays(-1);
        Date lastWeek = Date.today().addDays(-7);
        Date lastMonth = Date.today().addDays(-31);

        List<ServiceDelivery__c> deliveries = new List<ServiceDelivery__c>();

        //Deliveries for con1
        ServiceDelivery__c del1 = generateDelivery(
            con1.Id,
            service1.Id,
            today,
            'Present',
            1
        );
        ServiceDelivery__c del2 = generateDelivery(
            con1.Id,
            service1.Id,
            yesterday,
            'Unexcused Absence',
            1
        );
        ServiceDelivery__c del3 = generateDelivery(
            con1.Id,
            service1.Id,
            lastWeek,
            'Present',
            1
        );
        ServiceDelivery__c del4 = generateDelivery(
            con1.Id,
            service1.Id,
            lastMonth,
            'Present',
            1
        );
        deliveries.addAll(new List<ServiceDelivery__c>{ del1, del2, del3, del4 });

        //Deliveries for con2
        ServiceDelivery__c del5 = generateDelivery(
            con2.Id,
            service1.Id,
            today,
            'Unexcused Absence',
            0
        );
        ServiceDelivery__c del6 = generateDelivery(
            con2.Id,
            service1.Id,
            yesterday,
            'Unexcused Absence',
            0
        );
        ServiceDelivery__c del7 = generateDelivery(
            con2.Id,
            service1.Id,
            lastWeek,
            'Unexcused Absence',
            0
        );
        ServiceDelivery__c del8 = generateDelivery(
            con2.Id,
            service1.Id,
            lastMonth,
            'Present',
            1
        );
        deliveries.addAll(new List<ServiceDelivery__c>{ del5, del6, del7, del8 });
        insert deliveries;
    }

    private static ServiceDelivery__c generateDelivery(
        Id contactId,
        Id serviceId,
        Date deliveryDate,
        String attendanceStatus,
        Integer quantity
    ) {
        ServiceDelivery__c thisDelivery = new ServiceDelivery__c();
        thisDelivery.Contact__c = contactId;
        thisDelivery.Service__c = serviceId;
        thisDelivery.DeliveryDate__c = deliveryDate;
        thisDelivery.AttendanceStatus__c = attendanceStatus;
        thisDelivery.Quantity__c = quantity;

        return thisDelivery;
    }

    //functional test
    @IsTest
    private static void functionalEndToEnd() {
        // System.debug('ContactIds : ' + contactIds);
        // Test.startTest();
        // System.debug('ContactIds : ' + contactIds);
        // Contact con0 = [
        //     SELECT
        //         Id,
        //         LastName,
        //         NumPresentServiceDeliveries__c,
        //         NumAbsentServiceDeliveries__c,
        //         ConsecutiveAbsences__c,
        //         LastServiceDate__c
        //     FROM Contact
        //     WHERE LastName = 'Test Con 0'
        //     LIMIT 1
        // ];
        // contactIds = getContactIds();
        // ContactRollupsBatchCalc batchCalc = new ContactRollupsBatchCalc(contactIds);
        // batchCalc.contactMap.put(con0.Id, con0);
        // DataBase.executeBatch(batchCalc);
        // Test.stopTest();

        // Contact con1 = new Contact();
        // Contact con2 = new Contact();
        // Contact con3 = new Contact();

        // System.debug('ContactIds : ' + contactIds);

        // for (Contact con : [
        //     SELECT
        //         Id,
        //         LastName,
        //         NumPresentServiceDeliveries__c,
        //         NumAbsentServiceDeliveries__c,
        //         ConsecutiveAbsences__c,
        //         LastServiceDate__c
        //     FROM Contact
        //     WHERE Id IN :contactIds
        // ]) {
        //     if (con.LastName == 'Test Con 1') {
        //         con1 = con;
        //     } else if (con.LastName == 'Test Con 2') {
        //         con2 = con;
        //     } else if (con.LastName == 'Test Con 3') {
        //         con3 = con;
        //     }
        //     System.debug(con);
        // }

        // System.assertNotEquals(null, con1);
        // System.assertNotEquals(null, con2);
        // System.assertNotEquals(null, con3);

        // //Con1
        // System.assertEquals(3, con1.NumPresentServiceDeliveries__c);
        // System.assertEquals(1, con1.NumAbsentServiceDeliveries__c);
        // System.assertEquals(0, con1.ConsecutiveAbsences__c);
        // System.assertEquals(Date.today(), con1.LastServiceDate__c);

        // //Con2
        // System.assertEquals(1, con2.NumPresentServiceDeliveries__c);
        // System.assertEquals(3, con2.NumAbsentServiceDeliveries__c);
        // System.assertEquals(3, con2.ConsecutiveAbsences__c);
        // System.assertEquals(Date.today().addDays(-31), con2.LastServiceDate__c);

        // //Con3
        // System.assertEquals(0, con3.NumPresentServiceDeliveries__c);
        // System.assertEquals(0, con3.NumAbsentServiceDeliveries__c);
        // System.assertEquals(0, con3.ConsecutiveAbsences__c);
        // System.assertEquals(null, con3.LastServiceDate__c);
    }

    private static Set<Id> getContactIds() {
        Set<Id> contactIds = new Set<Id>();
        Set<String> names = new Set<String>{ 'Test Con 1', 'Test Con 2', 'Test Con 3' };
        for (Contact con : [SELECT Id FROM Contact WHERE LastName IN :names]) {
            contactIds.add(con.Id);
        }
        return contactIds;
    }
}
