public with sharing class ProgramEngagementSelector {
    public ProgramEngagementSelector() {
    }

    public List<ProgramEngagement__c> getProgramEngagementsByContactId(Id contactId) {
        System.debug('ContactID : ' + contactId);
        return [
            SELECT Id, Name, Program__c
            FROM ProgramEngagement__c
            WHERE Contact__c = :contactId
        ];
    }
}
