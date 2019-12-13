public with sharing class ProgramEngagementSelector {
    public ProgramEngagementSelector() {
    }

    public List<ProgramEngagement__c> getProgramEngagementsByContactId(Id contactId) {
        return [
            SELECT Id, Name, Program__c
            FROM ProgramEngagement__c
            WHERE Contact__c = :contactId
        ];
    }
}
