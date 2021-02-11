@IsTest
public with sharing class AttendanceSystemAccess_TEST {
    private static AttendanceSystemAccess systemAccess = new AttendanceSystemAccess();
    private static Service__c serviceRecord;
    private static final String PRESENT_STATUS = 'Present';

    @TestSetup
    private static void setupServiceSessionData() {
        TestDataFactory.generateAttendanceData('Monthly');

        serviceRecord = [SELECT Id FROM Service__c LIMIT 1];

        insert new ServiceDelivery__c(
            Name = 'test',
            Service__c = serviceRecord.Id,
            AttendanceStatus__c = PRESENT_STATUS
        );
    }

    @IsTest
    private static void shouldGetAllRecordsForStandardUser() {
        serviceRecord = [SELECT Id FROM Service__c LIMIT 1];

        User standardUser = TestUtil.getTestUser();
        List<ServiceDelivery__c> recordsWithAccess;

        System.runAs(standardUser) {
            recordsWithAccess = systemAccess.getAttendanceRecords(
                ServiceDelivery__c.Service__c,
                new Set<Id>{ serviceRecord.Id },
                new List<String>{ PRESENT_STATUS }
            );
        }

        System.assertEquals(
            1,
            recordsWithAccess.size(),
            'Expected the user to be able to bypass sharing.'
        );
    }

    @IsTest
    private static void shouldUpdateUnsharedRecordByStandardUser() {
        String updatedName = 'Services R Us';
        serviceRecord = [SELECT Id, Name FROM Service__c LIMIT 1];
        System.assertNotEquals(
            updatedName,
            serviceRecord.Name,
            'The service record name was not as expected.'
        );
        serviceRecord.Name = updatedName;

        User standardUser = TestUtil.getTestUser();

        System.runAs(standardUser) {
            systemAccess.updateRecords(new List<SObject>{ serviceRecord });
        }

        serviceRecord = [SELECT Id, Name FROM Service__c LIMIT 1];
        System.assertEquals(
            updatedName,
            serviceRecord.Name,
            'The service record name was not as expected.'
        );
    }
}
