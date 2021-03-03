@isTest
private class ContactRollups_SCHED_TEST {
    private static BasicStub featureGateSelectorStub = new BasicStub(
        FeatureGateSelector.class
    );
    private static ServiceDeliveryTriggerHandler handler = new ServiceDeliveryTriggerHandler();

    private static Contact contactRecord;
    private static Service__c service;
    private static List<ServiceSession__c> sessions;
    private static ProgramEngagement__c programEngagement;
    private static List<ServiceDelivery__c> serviceDeliveries;
    private static final String PRESENT_STATUS = 'Present';
    private static final String ABSENCE_STATUS = 'Excused Absence';

    @testSetup
    static void setup() {
        TestDataFactory.generateAttendanceData('Monthly');
    }

    @IsTest
    private static void shouldIncrementOnBatch() {
        // Stub turned off Feature Gates so we can insert Service Deliveries without triggers running
        featureGateSelectorStub.withReturnValue(
            'getAllFeatureGates',
            new List<FeatureGate__mdt>{
                new FeatureGate__mdt(
                    DeveloperName = 'ServiceDeliveriesToContact',
                    IsActive__c = false
                ),
                new FeatureGate__mdt(
                    DeveloperName = 'ServiceDeliveriesToService',
                    IsActive__c = false
                ),
                new FeatureGate__mdt(
                    DeveloperName = 'ServiceDeliveriesToServiceSession',
                    IsActive__c = false
                ),
                new FeatureGate__mdt(
                    DeveloperName = 'ServiceDeliveriesToProgramEngagement',
                    IsActive__c = false
                )
            }
        );
        handler.featureGateSelector = (FeatureGateSelector) featureGateSelectorStub.createMock();

        setupTest();
        requery();

        // The attendance records were inserted in the setupTest method, but triggers were off
        System.assertEquals(null, contactRecord.NumPresentServiceDeliveries__c);
        System.assertEquals(null, contactRecord.NumAbsentServiceDeliveries__c);
        System.assertEquals(null, contactRecord.LastServiceDate__c);
        System.assertEquals(null, contactRecord.ConsecutiveAbsences__c);

        // TODO: kick off batch, assert rollups
    }

    private static void requery() {
        contactRecord = [
            SELECT
                Id,
                NumPresentServiceDeliveries__c,
                NumAbsentServiceDeliveries__c,
                LastServiceDate__c,
                ConsecutiveAbsences__c,
                LastModifiedDate
            FROM Contact
            LIMIT 1
        ];
        service = [
            SELECT Id, NumPresentServiceDeliveries__c, NumAbsentServiceDeliveries__c
            FROM Service__c
            LIMIT 1
        ];
        sessions = [
            SELECT
                Id,
                NumPresentServiceDeliveries__c,
                NumAbsentServiceDeliveries__c,
                SessionStart__c
            FROM ServiceSession__c
            ORDER BY SessionStart__c DESC
            LIMIT 2
        ];
        programEngagement = [
            SELECT
                Id,
                NumPresentServiceDeliveries__c,
                NumAbsentServiceDeliveries__c,
                LastServiceDate__c,
                ConsecutiveAbsences__c
            FROM ProgramEngagement__c
            LIMIT 1
        ];
    }

    private static void setupTest() {
        requery();

        serviceDeliveries = new List<ServiceDelivery__c>{
            new ServiceDelivery__c(
                Name = 'test',
                Service__c = service.Id,
                Contact__c = contactRecord.Id,
                ServiceSession__c = sessions[0].Id,
                ProgramEngagement__c = programEngagement.Id,
                Quantity__c = 1,
                AttendanceStatus__c = PRESENT_STATUS,
                DeliveryDate__c = System.today() - 1
            ),
            new ServiceDelivery__c(
                Name = 'test2',
                Service__c = service.Id,
                Contact__c = contactRecord.Id,
                ServiceSession__c = sessions[1].Id,
                ProgramEngagement__c = programEngagement.Id,
                Quantity__c = 1,
                AttendanceStatus__c = ABSENCE_STATUS,
                DeliveryDate__c = System.today()
            )
        };

        insert serviceDeliveries;
    }
}
