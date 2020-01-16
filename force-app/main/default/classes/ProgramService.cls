public with sharing class ProgramService {
    @TestVisible
    private ProgramEngagementSelector programEngagementSelector = new ProgramEngagementSelector();

    @TestVisible
    private ProgramSelector programSelector = new ProgramSelector();

    public Map<Id, String> getProgramNamesByIdForContact(Id contactId) {
        List<ProgramEngagement__c> programEngagements = programEngagementSelector.getProgramEngagementsByContactId(contactId);
        List<Program__c> programs = programSelector.getProgramsFromProgramEngagements(programEngagements);
        return mapProgramNamesById(programs);
    }

    public Map<Id, String> mapProgramNamesById(List<Program__c> programs) {
        Map<Id, String> programNamesById = new Map<Id, String>();
        for (Program__c program : programs) {
            programNamesById.put(program.Id, program.Name);
        }
        return programNamesById;
    }

}
