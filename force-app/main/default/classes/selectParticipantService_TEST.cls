@IsTest
public with sharing class SelectParticipantService_TEST {
    private static BasicStub programEngagementSelectorStub = new BasicStub(
        ProgramEngagementSelector.class
    );

    @IsTest
    private static void testGetSelectParticipantModel() {
        final String methodName = 'getProgramEngagements';
        final String cohortsMethodName = 'getProgramCohorts';

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

        SelectParticipantService.SelectParticipantModel expected = new SelectParticipantService.SelectParticipantModel();
        expected.labels = labels;
        expected.programEngagements = programEngagements;
        expected.programCohorts = programCohorts;

        programEngagementSelectorStub.withReturnValue(
            methodName,
            Id.class,
            expected.programEngagements
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

        programEngagementSelectorStub.assertCalledWith(methodName, Id.class, serviceId);

        programEngagementSelectorStub.assertCalledWith(
            cohortsMethodName,
            Id.class,
            serviceId
        );
    }
}
