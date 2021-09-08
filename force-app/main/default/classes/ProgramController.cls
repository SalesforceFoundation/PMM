public with sharing class ProgramController {
    @TestVisible
    private static ProgramService service = new ProgramService();
    @TestVisible
    private static FieldSetService fieldSetService = new FieldSetService();

    private static final String ENGAGEMENT_FIELD_SET = 'CreateProgramEngagement';
    private static final String CONTACT_FIELD_SET = 'CreateContact';
    private static final String ENGAGEMENT_FIELD_SET_KEY = 'engagementFieldSet';
    private static final String CONTACT_FIELD_SET_KEY = 'contactFieldSet';

    @AuraEnabled(cacheable=true)
    public static List<ProgramCohort__c> getProgramCohortsFromProgramId(Id programId) {
        try {
            return service.getProgramCohortsFromProgramId(programId);
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }

    @AuraEnabled(cacheable=true)
    public static Map<String, Object> getFieldSetByObjectKey() {
        Map<String, Object> fieldSetByObjectKey = new Map<String, Object>();

        try {
            fieldSetByObjectKey.put(
                ENGAGEMENT_FIELD_SET_KEY,
                fieldSetService.getFieldSetForLWC(
                    String.valueOf(ProgramEngagement__c.SObjectType),
                    ENGAGEMENT_FIELD_SET,
                    false
                )
            );
            fieldSetByObjectKey.put(
                CONTACT_FIELD_SET_KEY,
                fieldSetService.getFieldSetForLWC(
                    String.valueOf(Contact.SObjectType),
                    CONTACT_FIELD_SET,
                    false
                )
            );
            return fieldSetByObjectKey;
        } catch (Exception ex) {
            throw Util.getAuraHandledException(ex);
        }
    }
}
