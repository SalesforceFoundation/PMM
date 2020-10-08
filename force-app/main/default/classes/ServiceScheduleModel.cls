/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ServiceScheduleModel {
    @TestVisible
    private FieldSetService fieldSetService = new FieldSetService();
    private static final String SCHEDULE_FIELD_SET_NAME = 'ServiceScheduleInformation';
    private static final String PROGRAM_ENGAGEMENT_FIELD_SET_NAME = 'SessionParticipantView';
    private static final Integer DEFAULT_MAX_SESSIONS = 500;
    public List<ServiceParticipant__c> serviceParticipants { get; set; }

    @AuraEnabled
    public ServiceSchedule__c serviceSchedule { get; set; }
    @AuraEnabled
    public List<ServiceSession__c> serviceSessions { get; set; }
    @AuraEnabled
    public List<ProgramEngagement__c> selectedParticipants { get; set; }
    @AuraEnabled
    public Map<String, Map<String, String>> labels = new Map<String, Map<String, String>>();
    @AuraEnabled
    public List<Map<String, Object>> scheduleInformationFields = new List<Map<String, Object>>();
    @AuraEnabled
    public Integer maxSessions { get; set; }

    @AuraEnabled
    public Map<String, Map<String, Object>> scheduleRequiredFields = new Map<String, Map<String, Object>>{
        'name' => fieldSetService.getFieldForLWC(
            Schema.ServiceSchedule__c.Name.getDescribe()
        ),
        'serviceId' => fieldSetService.getFieldForLWC(
            Schema.ServiceSchedule__c.Service__c.getDescribe()
        ),
        'autoGenerateSessions' => fieldSetService.getFieldForLWC(
            Schema.ServiceSchedule__c.CreateServiceSessionRecords__c.getDescribe()
        )
    };

    @AuraEnabled
    public Map<String, Map<String, Object>> scheduleRecurrenceDateFields = new Map<String, Map<String, Object>>{
        'start' => fieldSetService.getFieldForLWC(
            Schema.ServiceSchedule__c.FirstSessionStart__c.getDescribe()
        ),
        'end' => fieldSetService.getFieldForLWC(
            Schema.ServiceSchedule__c.FirstSessionEnd__c.getDescribe()
        ),
        'seriesEndsOn' => fieldSetService.getFieldForLWC(
            Schema.ServiceSchedule__c.ServiceScheduleEndDate__c.getDescribe()
        ),
        'numberOfSessions' => fieldSetService.getFieldForLWC(
            Schema.ServiceSchedule__c.NumberOfServiceSessions__c.getDescribe()
        )
    };

    @AuraEnabled
    public Map<String, Map<String, Object>> scheduleRecurrencePicklistFields = new Map<String, Map<String, Object>>{
        'frequency' => fieldSetService.getPicklistFieldForLWC(
            Schema.ServiceSchedule__c.Frequency__c.getDescribe()
        ),
        'daysOfWeek' => fieldSetService.getPicklistFieldForLWC(
            Schema.ServiceSchedule__c.DaysOfWeek__c.getDescribe()
        ),
        'seriesEnds' => fieldSetService.getPicklistFieldForLWC(
            Schema.ServiceSchedule__c.ServiceScheduleEnds__c.getDescribe()
        )
    };

    @AuraEnabled
    public Map<String, Map<String, Object>> sessionFields = new Map<String, Map<String, Object>>{
        'name' => fieldSetService.getFieldForLWC(
            Schema.ServiceSession__c.Name.getDescribe()
        ),
        'sessionStart' => fieldSetService.getFieldForLWC(
            Schema.ServiceSession__c.SessionStart__c.getDescribe()
        ),
        'sessionEnd' => fieldSetService.getFieldForLWC(
            Schema.ServiceSession__c.SessionEnd__c.getDescribe()
        )
    };

    @AuraEnabled
    public Map<String, Map<String, Object>> contactFields = new Map<String, Map<String, Object>>{
        'contactName' => fieldSetService.getFieldForLWC(
            Schema.Contact.Name.getDescribe()
        ),
        'contactEmail' => fieldSetService.getFieldForLWC(
            Schema.Contact.Email.getDescribe()
        )
    };

    @AuraEnabled
    public List<Map<String, Object>> engagementFields = new List<Map<String, Object>>();

    public ServiceScheduleModel() {
        serviceSchedule = new ServiceSchedule__c();
        serviceSchedule = (ServiceSchedule__c) ServiceSchedule__c.SObjectType.newSObject(
            null,
            true
        );
        serviceSessions = new List<ServiceSession__c>();
        selectedParticipants = new List<ProgramEngagement__c>();
        serviceParticipants = new List<ServiceParticipant__c>();
        maxSessions = DEFAULT_MAX_SESSIONS;

        labels.put('serviceSchedule', getServiceScheduleLabels());
        labels.put('serviceSession', getServiceSessionLabels());
        labels.put('serviceParticipant', getServiceParticipantLabels());

        scheduleInformationFields = fieldSetService.getFieldSetForLWC(
            String.valueOf(ServiceSchedule__c.SObjectType),
            SCHEDULE_FIELD_SET_NAME,
            false
        );

        engagementFields = fieldSetService.getFieldSetForLWC(
            String.valueOf(ProgramEngagement__c.SObjectType),
            PROGRAM_ENGAGEMENT_FIELD_SET_NAME,
            true
        );
    }

    private static Map<String, String> serviceScheduleLabels = new Map<String, String>{
        'newServiceSchedule' => System.Label.New_Service_Schedule,
        'scheduleInformation' => System.Label.Service_Schedule_Information,
        'dateTime' => System.Label.Service_Schedule_Date_Time,
        'addToServiceSchedule' => String.format(
            System.Label.Add_To_Record,
            new List<String>{ ServiceSchedule__c.SObjectType.getDescribe().getLabel() }
        ),
        'reviewSchedule' => String.format(
            System.Label.Review_Records,
            new List<String>{ ServiceSession__c.SObjectType.getDescribe().getLabel() }
        )
    };

    private static Map<String, String> serviceSessionLabels = new Map<String, String>{
        'addSession' => String.format(
            System.Label.Add_Record,
            new List<String>{ ServiceSession__c.SObjectType.getDescribe().getLabel() }
        ),
        'reviewSessions' => String.format(
            System.Label.Review_Records,
            new List<String>{
                ServiceSession__c.SObjectType.getDescribe().getLabelPlural()
            }
        )
    };

    private static Map<String, String> serviceParticipantLabels = new Map<String, String>{
        'addServiceParticipants' => String.format(
            System.Label.Add_Record,
            new List<String>{
                ServiceParticipant__c.SObjectType.getDescribe().getLabelPlural()
            }
        ),
        'capacityWarning' => System.Label.Participant_Capacity_Warning,
        'selectedRecords' => System.Label.Selected_Records,
        'searchThisList' => System.Label.Search_this_list,
        'none' => System.Label.None,
        'noRecordsFound' => System.Label.No_Records_Found,
        'noRecordsSelected' => System.Label.No_Records_Selected,
        'filterByCohort' => String.format(
            System.Label.Filter_By_Record,
            new List<String>{ ProgramCohort__c.SObjectType.getDescribe().getLabel() }
        )
    };

    private static Map<String, String> getServiceScheduleLabels() {
        serviceScheduleLabels.putAll(
            Util.getObjectLabels(ServiceSchedule__c.sObjectType)
        );

        return serviceScheduleLabels;
    }

    private static Map<String, String> getServiceSessionLabels() {
        serviceSessionLabels.putAll(Util.getObjectLabels(ServiceSession__c.sObjectType));

        return serviceSessionLabels;
    }

    private static Map<String, String> getServiceParticipantLabels() {
        serviceParticipantLabels.putAll(
            Util.getObjectLabels(ServiceParticipant__c.sObjectType)
        );

        return serviceParticipantLabels;
    }
}
