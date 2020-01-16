public with sharing class ProgramSelector {
    public ProgramSelector() {
    }

    @TestVisible
    private ProgramEngagementSelector programEngagementSelector = new ProgramEngagementSelector();

    public List<Program__c> getProgramsForContactId(Id contactId) {
        List<Id> programIds = new List<Id>();
        for (
            ProgramEngagement__c pe : programEngagementSelector.getProgramEngagementsByContactId(
                contactId
            )
        ) {
            programIds.add(pe.Program__c);
        }

        List<Program__c> programs = [
            SELECT Id, Name
            FROM Program__c
            WHERE Id IN :programIds
        ];
        return programs;
    }
}
