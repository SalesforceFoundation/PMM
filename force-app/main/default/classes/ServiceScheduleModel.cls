public with sharing class ServiceScheduleModel {
    @AuraEnabled
    public ServiceSchedule__c serviceSchedule = new ServiceSchedule__c();
    @AuraEnabled
    public List<ServiceSession__c> serviceSessions = new List<ServiceSession__c>();
    @AuraEnabled
    public List<ServiceParticipant__c> serviceParticipants = new List<ServiceParticipant__c>();
    @AuraEnabled
    public Map<String, Map<String, String>> labels = new Map<String, Map<String, String>>();

    public ServiceScheduleModel() {
        this.labels.put('serviceSchedule', getServiceScheduleLabels());
        this.labels.put('serviceSession', getServiceSessionLabels());
        this.labels.put('serviceParticipant', getServiceParticipantLabels());
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
        )
    };

    private static Map<String, String> getServiceScheduleLabels() {
        serviceScheduleLabels.putAll(getObjectLabels(ServiceSchedule__c.sObjectType));

        return serviceScheduleLabels;
    }

    private static Map<String, String> getServiceSessionLabels() {
        serviceSessionLabels.putAll(getObjectLabels(ServiceSession__c.sObjectType));

        return serviceSessionLabels;
    }

    private static Map<String, String> getServiceParticipantLabels() {
        serviceParticipantLabels.putAll(
            getObjectLabels(ServiceParticipant__c.sObjectType)
        );

        return serviceParticipantLabels;
    }

    private static Map<String, String> getObjectLabels(SObjectType sObjectType) {
        return new Map<String, String>{
            'objectPluralLabel' => sObjectType.getDescribe().getLabelPlural(),
            'objectLabel' => sObjectType.getDescribe().getLabel(),
            'objectApiName' => sObjectType.getDescribe().getName()
        };
    }
}
