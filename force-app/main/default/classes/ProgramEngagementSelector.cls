public with sharing class ProgramEngagementSelector {
    public ProgramEngagementSelector() {
    }

    public List<ProgramEngagement__c> getProgramEngagementsByContactId(Id contactId) {
        List<ProgramEngagement__c> engagements = new List<ProgramEngagement__c>();
        if (!Schema.SObjectType.ProgramEngagement__c.isAccessible()) {
            return engagements;
        }
        List<ProgramEngagement__c> queriedEngagements = [
            SELECT Id, Name, Program__c, Program__r.Name
            FROM ProgramEngagement__c
            WHERE Contact__c = :contactId
        ];

        return Security.stripInaccessible(AccessType.READABLE, queriedEngagements)
            .getRecords();
    }
}
