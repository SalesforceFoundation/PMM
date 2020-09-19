@IsTest
public with sharing class SelectParticipantService_TEST {
    private static BasicStub programEngagementSelectorStub = new BasicStub(
        ProgramEngagementSelector.class
    );

    @IsTest
    private static void testGetSelectParticipantModel() {
        final String programEngagementsMethodName = 'getProgramEngagementsByProgramId';
        final String cohortsMethodName = 'getProgramCohortsByProgramId';

        Id serviceId = TestUtil.mockId(Service__c.SObjectType);
        List<ProgramCohort__c> programCohorts = new List<ProgramCohort__c>();
        List<ProgramEngagement__c> programEngagements = new List<ProgramEngagement__c>();

        SelectParticipantService.SelectParticipantModel expected = new SelectParticipantService.SelectParticipantModel();
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
