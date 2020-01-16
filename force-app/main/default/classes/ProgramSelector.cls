public with sharing class ProgramSelector {
    public ProgramSelector() {
    }

    public List<Program__c> getProgramsFromProgramEngagements(
        List<ProgramEngagement__c> programEngagements
    ) {
        List<Id> programIds = new List<Id>();
        for (ProgramEngagement__c pe : programEngagements) {
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
