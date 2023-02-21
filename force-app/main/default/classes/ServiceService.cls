/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ServiceService {
    public ServiceService() {
    }
    @TestVisible
    private FieldBucketSelector bucketSelector = new FieldBucketSelector();

    @TestVisible
    private FieldSetService fieldSetService = new FieldSetService();

    @TestVisible
    private ServiceSelector serviceSelector = new ServiceSelector();

    @TestVisible
    private ProgramEngagementSelector engagementSelector = new ProgramEngagementSelector();

    @TestVisible
    private Set<String> activeStatuses {
        get {
            if (activeStatuses == null) {
                activeStatuses = getactiveStatuses();
            }
            return activeStatuses;
        }
        set;
    }

    private Set<String> getActiveStatuses() {
        List<String> bucketNames = new List<String>{ 'ServiceStatusActive' };
        Set<String> activeStatuses = new Set<String>();

        Schema.SObjectType serviceSObjType = Service__c.SObjectType;
        Schema.SObjectField statusField = Service__c.Status__c;

        for (
            Bucket__mdt bucket : bucketSelector.getBuckets(
                bucketNames,
                serviceSObjType,
                statusField
            )
        ) {
            for (BucketedValue__mdt value : bucket.BucketedValues__r) {
                activeStatuses.add(value.Value__c);
            }
        }

        return activeStatuses;
    }

    public Map<String, List<Object>> getServicesEngagementsByContactId(Id contactId) {
        Set<Id> programIds = new Set<Id>();
        String serviceProgram = Schema.SObjectType.Service__c.Fields.Program__c.getName();
        String engageProgram = Schema.SObjectType.ProgramEngagement__c.Fields.Program__c.getName();
        Set<String> activeServiceStatuses = activeStatuses;

        Map<String, List<Object>> result = new Map<String, List<Object>>();
        result.put('engagements', new List<Object>());
        result.put('services', new List<Object>());

        for (
            ProgramEngagement__c engagement : engagementSelector.getProgramEngagementsByContactId(
                contactId
            )
        ) {
            programIds.add(engagement.Program__c);
            result.get('engagements')
                .add(convertObjectToOption(engagement, engageProgram));
        }

        for (Service__c service : serviceSelector.getServicesByProgramIds(programIds)) {
            if (activeServiceStatuses.contains(service.Status__c)) {
                result.get('services')
                    .add(convertObjectToOption(service, serviceProgram));
            }
        }

        return result;
    }

    private Map<String, String> convertObjectToOption(sObject obj, String programField) {
        Map<String, String> result = new Map<String, String>();
        result.put('label', (String) obj.get('Name'));
        result.put('value', (String) obj.get('Id'));
        result.put('program', (String) obj.get(programField));
        return result;
    }

    public List<Object> getServicesByProgramEngagementId(Id programEngagamentId) {
        String serviceProgram = Schema.SObjectType.Service__c.Fields.Program__c.getName();
        List<Object> allServices = new List<Object>();

        for (
            Service__c service : serviceSelector.getServicesByProgramEngagementId(
                programEngagamentId
            )
        ) {
            allServices.add(convertObjectToOption(service, serviceProgram));
        }
        return allServices;
    }

    public Map<String, Object> getServiceDeliveryFieldSets() {
        Map<String, Object> fieldSets = fieldSetService.getFieldSetsByName(
            Schema.SObjectType.ServiceDelivery__c.getName()
        );
        Map<String, Object> serviceField = fieldSetService.getFieldForLWC(
            ServiceDelivery__c.Service__c.getDescribe()
        );
        Map<String, Object> contactField = fieldSetService.getFieldForLWC(
            ServiceDelivery__c.Contact__c.getDescribe()
        );
        Map<String, Object> engagementField = fieldSetService.getFieldForLWC(
            ServiceDelivery__c.ProgramEngagement__c.getDescribe()
        );

        for (String key : fieldSets.keySet()) {
            List<Map<String, Object>> fieldSetValues = (List<Map<String, Object>>) fieldSets.get(
                key
            );

            Boolean fieldSetContainsServiceField = fieldSetValues.contains(serviceField);
            if (fieldSetContainsServiceField) {
                continue;
            }

            Integer indexToInsertServiceField =
                fieldSetValues.indexOf(engagementField) + 1;
            indexToInsertServiceField = indexToInsertServiceField > 0
                ? indexToInsertServiceField
                : fieldSetValues.indexOf(contactField) + 1;

            if (fieldSetValues.size() <= indexToInsertServiceField) {
                fieldSetValues.add(serviceField);
            } else {
                fieldSetValues.add(indexToInsertServiceField, serviceField);
            }
        }

        return fieldSets;
    }
}
