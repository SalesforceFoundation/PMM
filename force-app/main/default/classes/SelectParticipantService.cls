public with sharing class SelectParticipantService {
    @TestVisible
    private SelectParticipantSelector selectParticipantSelector = new SelectParticipantSelector();

    public Map<String, String> getObjectData() {
        Map<String, String> objectFieldLabels = new Map<String, String>{
            Schema.SObjectType.Program__c.getName() => Schema.SObjectType.Program__c.getLabel(),
            Schema.SObjectType.ProgramCohort__c.getName() => Schema.SObjectType.ProgramCohort__c.getLabel(),
            Schema.SObjectType.ServiceParticipant__c.getName() => Schema.SObjectType.ServiceParticipant__c.getLabel(),
            Schema.SObjectType.Contact.Fields.Name.getName() => Schema.SObjectType.Contact.Fields.Name.getLabel(),
            Schema.SObjectType.Contact.Fields.Email.getName() => Schema.SObjectType.Contact.Fields.Email.getLabel(),
            Schema.SObjectType.ProgramEngagement__c.Fields.Stage__c.getName() => Schema.SObjectType.ProgramEngagement__c.Fields.Stage__c.getLabel()
        };

        return objectFieldLabels;
    }

    public InitialDataAndSetup getInitialDataSetup(Id serviceId) {
        InitialDataAndSetup dataSetup = new InitialDataAndSetup();
        List<Object> programEngagements = new List<Object>();
        List<Object> programCohorts = new List<Object>();

        dataSetup.programEngagements = selectParticipantSelector.getProgramEngagements(
            serviceId
        );
        dataSetup.programCohorts = selectParticipantSelector.getProgramCohorts(serviceId);
        dataSetup.labels = getObjectData();
        return dataSetup;
    }

    public class InitialDataAndSetup {
        @AuraEnabled
        public List<Object> programEngagements;
        @AuraEnabled
        public List<Object> programCohorts;
        @AuraEnabled
        public Map<String, String> labels;

        public InitialDataAndSetup() {
            this.programEngagements = new List<Object>();
            this.programCohorts = new List<Object>();
            this.Labels = new Map<String, String>();
        }
    }
}
