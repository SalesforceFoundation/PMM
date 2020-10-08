/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class SelectParticipantModel {
    @TestVisible
    private FieldSetService fieldSetService = new FieldSetService();

    private Id serviceId;
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
        programEngagements = new List<ProgramEngagement__c>();
        programCohorts = new List<ProgramCohort__c>();

        populateObjectLabels();
        populateFields();
    }

    private void populateObjectLabels() {
        objectLabels = new Map<String, Map<String, String>>{
            'program' => Util.getObjectLabels(Program__c.SObjectType),
            'programCohort' => Util.getObjectLabels(ProgramCohort__c.sObjectType),
            'serviceParticipant' => Util.getObjectLabels(
                ServiceParticipant__c.sObjectType
            )
        };
    }

    private void populateFields() {
        fields = contactFields;
        fields.putAll(engagementFields);
        fields.putAll(scheduleFields);
    }
}
