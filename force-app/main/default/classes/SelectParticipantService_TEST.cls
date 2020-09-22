@IsTest
public with sharing class SelectParticipantService_TEST {
    private static BasicStub programEngagementSelectorStub = new BasicStub(
        ProgramEngagementSelector.class
    );

    @IsTest
    private static void testGetSelectParticipantModel() {
        final String programEngagementsMethodName = 'getProgramEngagementsByProgramId';
        final String cohortsMethodName = 'getProgramCohortsByProgramId';
        final String programMethodName = 'getProgramByServiceId';

        Id serviceId = TestUtil.mockId(Service__c.SObjectType);
        Id programId = TestUtil.mockId(Program__c.SObjectType);
        Program__c programToReturn = new Program__c(Id = programId);
        List<ProgramCohort__c> programCohortsToReturn = new List<ProgramCohort__c>();
        List<ProgramEngagement__c> programEngagementsToReturn = new List<ProgramEngagement__c>();

        programEngagementSelectorStub.withReturnValue(
            programMethodName,
            Id.class,
            programToReturn
        );

        programEngagementSelectorStub.withReturnValue(
            programEngagementsMethodName,
            Id.class,
            programEngagementsToReturn
        );

        programEngagementSelectorStub.withReturnValue(
            cohortsMethodName,
            Id.class,
            programCohortsToReturn
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
            programToReturn,
            actual.program,
            'Expected the model to return the program returned by the selector.'
        );

        System.assertEquals(
            programEngagementsToReturn,
            actual.programEngagements,
            'Expected the model to return the program engagements returned by the selector.'
        );

        System.assertEquals(
            programCohortsToReturn,
            actual.programCohorts,
            'Expected the model to return the program cohorts returned by the selector.'
        );

        System.assert(
            actual.objectLabels.containsKey('program'),
            'Expected the program object labels to be returned.'
        );
        System.assert(
            actual.objectLabels.containsKey('programCohort'),
            'Expected the program cohort object labels to be returned.'
        );
        System.assert(
            actual.objectLabels.containsKey('serviceParticipant'),
            'Expected the service participant object labels to be returned.'
        );

        programEngagementSelectorStub.assertCalledWith(
            programMethodName,
            Id.class,
            serviceId
        );

        programEngagementSelectorStub.assertCalledWith(
            programEngagementsMethodName,
            Id.class,
            programId
        );

        programEngagementSelectorStub.assertCalledWith(
            cohortsMethodName,
            Id.class,
            programId
        );
    }

    @IsTest
    private static void shouldReturnNullProgramWhenProgramNotFound() {
        Test.startTest();
        SelectParticipantService service = new SelectParticipantService();
        SelectParticipantService.SelectParticipantModel actualModel = service.getSelectParticipantModel(
            TestUtil.mockId(Service__c.SObjectType)
        );
        Test.stopTest();

        System.assertEquals(
            null,
            actualModel.program,
            'Expected a program not to be found'
        );
        System.assertEquals(
            0,
            actualModel.programEngagements.size(),
            'Expected an empty list of program engagements when no program found.'
        );
        System.assertEquals(
            0,
            actualModel.programCohorts.size(),
            'Expected an empty list of program cohorts when no program found.'
        );
    }
}
