public with sharing class ProgramService {

    @TestVisible
    private ProgramSelector programSelector = new ProgramSelector();

    public Map<Id, String> getProgramNamesByIdForContact(Id contactId) {
        List<Program__c> programs = programSelector.getProgramsForContactId(contactId);
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
