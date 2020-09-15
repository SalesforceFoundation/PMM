@IsTest
public with sharing class SelectParticipantService_TEST {
    private static BasicStub programEngagementSelectorStub = new BasicStub(
        ProgramEngagementSelector.class
    );

    @IsTest
    private static void testGetSelectParticipantModel() {
        final String programEngagementsMethodName = 'getProgramEngagementsByServiceId';
        final String cohortsMethodName = 'getProgramCohortsByServiceId';

        Id serviceId = TestUtil.mockId(Service__c.SObjectType);
        List<ProgramCohort__c> programCohorts = new List<ProgramCohort__c>();
        List<ProgramEngagement__c> programEngagements = new List<ProgramEngagement__c>();

        Map<String, String> labels = new Map<String, String>{
            Schema.SObjectType.Program__c.getName() => Schema.SObjectType.Program__c.getLabel(),
            Schema.SObjectType.ProgramCohort__c.getName() => Schema.SObjectType.ProgramCohort__c.getLabel(),
            Schema.SObjectType.ServiceParticipant__c.getName() => Schema.SObjectType.ServiceParticipant__c.getLabel(),
            Schema.SObjectType.Contact.Fields.Name.getName() => Schema.SObjectType.Contact.Fields.Name.getLabel(),
            Schema.SObjectType.Contact.Fields.Email.getName() => Schema.SObjectType.Contact.Fields.Email.getLabel(),
            Schema.SObjectType.ProgramEngagement__c.Fields.Stage__c.getName() => Schema.SObjectType.ProgramEngagement__c.Fields.Stage__c.getLabel()
        };

        SelectParticipantService.SelectParticipantModel expected = new SelectParticipantService.SelectParticipantModel();
        expected.labels = labels;
        expected.programEngagements = programEngagements;
        expected.programCohorts = programCohorts;

        programEngagementSelectorStub.withReturnValue(
            programEngagementsMethodName,
            Id.class,
            expected.programEngagements
        );

        programEngagementSelectorStub.withReturnValue(
            cohortsMethodName,
            Id.class,
            expected.programCohorts
        );

        Test.startTest();
        final SelectParticipantService service = new SelectParticipantService();
        service.ProgramEngagementSelector = (ProgramEngagementSelector) programEngagementSelectorStub.createMock();
        final SelectParticipantService.SelectParticipantModel actual = service.getSelectParticipantModel(
            serviceId
        );
        Test.stopTest();

        System.assertNotEquals(
            null,
            actual,
            'Expected that the actual value is not null'
        );

        System.assertEquals(
            String.valueOf(expected),
            String.valueOf(actual),
            'The model returned was not as expected'
        );

        programEngagementSelectorStub.assertCalledWith(
            programEngagementsMethodName,
            Id.class,
            serviceId
        );

        programEngagementSelectorStub.assertCalledWith(
            cohortsMethodName,
            Id.class,
            serviceId
        );
    }
}
