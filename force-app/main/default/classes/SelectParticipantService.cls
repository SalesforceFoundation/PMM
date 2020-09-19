public with sharing class SelectParticipantService {
    @TestVisible
    private ProgramEngagementSelector programEngagementSelector = new ProgramEngagementSelector();
    @TestVisible
    private FieldSetService fieldSetService = new FieldSetService();

    private Map<String, Map<String, Object>> contactFields = new Map<String, Map<String, Object>>{
        'contactName' => fieldSetService.getFieldForLWC(
            Schema.Contact.Name.getDescribe()
        ),
        'contactEmail' => fieldSetService.getFieldForLWC(
            Schema.Contact.Email.getDescribe()
        )
    };

    private Map<String, Map<String, Object>> engagementFields = new Map<String, Map<String, Object>>{
        'engagementStage' => fieldSetService.getFieldForLWC(
            Schema.ProgramEngagement__c.Stage__c.getDescribe()
        ),
        'contact' => fieldSetService.getFieldForLWC(
            Schema.ProgramEngagement__c.Contact__c.getDescribe()
        )
    };

    private Map<String, Map<String, Object>> scheduleFields = new Map<String, Map<String, Object>>{
        'capacity' => fieldSetService.getFieldForLWC(
            Schema.ServiceSchedule__c.ParticipantCapacity__c.getDescribe()
        ),
        'name' => fieldSetService.getFieldForLWC(
            Schema.ServiceSchedule__c.Name.getDescribe()
        )
    };

    public SelectParticipantModel getSelectParticipantModel(Id serviceId) {
        SelectParticipantModel participantModel = new SelectParticipantModel();
        participantModel.objectLabels = new Map<String, Map<String, String>>{
            'program' => Util.getObjectLabels(Program__c.SObjectType),
            'programCohort' => Util.getObjectLabels(ProgramCohort__c.sObjectType),
            'serviceParticipant' => Util.getObjectLabels(
                ServiceParticipant__c.sObjectType
            )
        };
        participantModel.fields = contactFields;
        participantModel.fields.putAll(engagementFields);
        participantModel.fields.putAll(scheduleFields);

        participantModel.program = programEngagementSelector.getProgramByServiceId(
            serviceId
        );
        if (participantModel.program == null) {
            return participantModel;
        }

        participantModel.programEngagements = programEngagementSelector.getProgramEngagementsByProgramId(
            participantModel.program.Id
        );
        participantModel.programCohorts = programEngagementSelector.getProgramCohortsByProgramId(
            participantModel.program.Id
        );

        return participantModel;
    }

    public class SelectParticipantModel {
        @AuraEnabled
        public List<ProgramEngagement__c> programEngagements;
        @AuraEnabled
        public List<ProgramCohort__c> programCohorts;
        @AuraEnabled
        public Map<String, Map<String, String>> objectLabels;
        @AuraEnabled
        public Map<String, Map<String, Object>> fields;
        @AuraEnabled
        public Program__c program;

        public SelectParticipantModel() {
            this.programEngagements = new List<ProgramEngagement__c>();
            this.programCohorts = new List<ProgramCohort__c>();
        }
    }
}
