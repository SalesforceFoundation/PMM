@IsTest
public with sharing class selectParticipantService_TEST {
    private static BasicStub selectParticipantSelectorStub = new BasicStub(
        SelectParticipantSelector.class
    );

    @IsTest
    private static void testGetInitialDataSetup() {
        Id serviceId = TestUtil.mockId(Service__c.SObjectType);
        List<Object> programCohorts;
        List<Object> programEngagements;
        Map<String, String> labels = new Map<String, String>{
            Schema.SObjectType.Program__c.getName() => Schema.SObjectType.Program__c.getLabel(),
            Schema.SObjectType.ProgramCohort__c.getName() => Schema.SObjectType.ProgramCohort__c.getLabel(),
            Schema.SObjectType.ServiceParticipant__c.getName() => Schema.SObjectType.ServiceParticipant__c.getLabel(),
            Schema.SObjectType.Contact.Fields.Name.getName() => Schema.SObjectType.Contact.Fields.Name.getLabel(),
            Schema.SObjectType.Contact.Fields.Email.getName() => Schema.SObjectType.Contact.Fields.Email.getLabel(),
            Schema.SObjectType.ProgramEngagement__c.Fields.Stage__c.getName() => Schema.SObjectType.ProgramEngagement__c.Fields.Stage__c.getLabel()
        };

        SelectParticipantService.InitialDataAndSetup expected = new SelectParticipantService.InitialDataAndSetup();
        expected.labels = labels;
        expected.programEngagements = programEngagements;
        expected.programCohorts = programCohorts;

        selectParticipantSelectorStub.withReturnValue(
            'getInitialDataSetup',
            Id.class,
            expected
        );

        Test.startTest();
        final SelectParticipantService service = new SelectParticipantService();
        service.selectParticipantSelector = (SelectParticipantSelector) selectParticipantSelectorStub.createMock();
        final SelectParticipantService.InitialDataAndSetup actual = service.getInitialDataSetup(
            serviceId
        );
        Test.stopTest();

        System.assertNotEquals(
            null,
            actual,
            'Expected that the actual value is not null'
        );

        System.assertEquals(
            expected.labels,
            actual.labels,
            'The labels map within both expected and actual are the same'
        );

        System.assertEquals(
            expected.programCohorts,
            actual.programCohorts,
            'The programCohorts within both expected and actual are the same'
        );

        System.assertEquals(
            expected.programEngagements,
            actual.programEngagements,
            'The programEngagements  within both expected and actual are the same'
        );

        selectParticipantSelectorStub.assertCalledWith(
            'getProgramEngagements',
            Id.class,
            serviceId
        );

        selectParticipantSelectorStub.assertCalledWith(
            'getProgramCohorts',
            Id.class,
            serviceId
        );
    }
}
