public with sharing class ProgramService {
    @TestVisible
    private ProgramEngagementSelector programEngagementSelector = new ProgramEngagementSelector();

    public Map<Id, String> getProgramNamesByIdForContact(Id contactId) {
        Map<Id, String> programNamesById = new Map<Id, String>();
        for (
            ProgramEngagement__c engagement : programEngagementSelector.getProgramEngagementsByContactId(
                contactId
            )
        ) {
            programNamesById.put(engagement.Program__c, engagement.Program__r.Name);
        }
        return programNamesById;
    }
}
