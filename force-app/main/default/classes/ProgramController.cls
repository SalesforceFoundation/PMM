public with sharing class ProgramController {
    @TestVisible
    private static ProgramService service = new ProgramService();
    @TestVisible
    private static FieldSetService fieldSetService = new FieldSetService();
    private static final String ENGAGEMENT_FIELD_SET = 'CreateProgramEngagement';
    private static final String CONTACT_FIELD_SET = 'CreateContact';
    private static final String PROGRAM_COHORTS_KEY = 'programCohorts';
    private static final String ENGAGEMENT_FIELD_SET_KEY = 'engagementFieldSet';
    private static final String CONTACT_FIELD_SET_KEY = 'contactFieldSet';

    @AuraEnabled(cacheable=true)
    public static Map<String, Object> getNewEngagementSetup(Id programId) {
        Map<String, Object> newEngagementSetup = new Map<String, Object>();

        try {
            newEngagementSetup.put(
                PROGRAM_COHORTS_KEY,
                service.getProgramCohortsFromProgramId(programId)
            );
            newEngagementSetup.put(
                ENGAGEMENT_FIELD_SET_KEY,
                fieldSetService.getFieldSetForLWC(
                    String.valueOf(ProgramEngagement__c.SObjectType),
                    ENGAGEMENT_FIELD_SET,
                    false
                )
            );
            newEngagementSetup.put(
                CONTACT_FIELD_SET_KEY,
                fieldSetService.getFieldSetForLWC(
                    String.valueOf(Contact.SObjectType),
                    CONTACT_FIELD_SET,
                    false
                )
            );
            return newEngagementSetup;
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }
}
