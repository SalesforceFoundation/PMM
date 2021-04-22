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
    private static FieldSetService fieldSetService = new FieldSetService();

    @TestVisible
    private ServiceSelector serviceSelector = new ServiceSelector();

    @TestVisible
    private ProgramEngagementSelector engagementSelector = new ProgramEngagementSelector();

    public Map<String, List<Object>> getServicesEngagementsByContactId(Id contactId) {
        Set<Id> programIds = new Set<Id>();
        String serviceProgram = Schema.SObjectType.Service__c.Fields.Program__c.getName();
        String engageProgram = Schema.SObjectType.ProgramEngagement__c.Fields.Program__c.getName();

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
            result.get('services').add(convertObjectToOption(service, serviceProgram));
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

    public Map<String, Object> getFieldSetsByName(String objectName) {
        Integer indexToInsertServiceField;
        Boolean fieldSetContainsServiceField = true;
        Map<String, Object> serviceField = new Map<String, Object>();

        Map<String, Object> fieldSets = fieldSetService.getFieldSetsByName(objectName);

        for (String key : fieldSets.keySet()) {
            indexToInsertServiceField = 0;
            List<Map<String, Object>> fieldSetValues = (List<Map<String, Object>>) fieldSets.get(
                key
            );

            for (Map<String, Object> field : fieldSetValues) {
                String fieldApiName = (String) field.get('apiName');

                if (fieldApiName == 'Contact__c') {
                    indexToInsertServiceField = fieldSetValues.indexOf(field) + 1;
                }
                if (fieldApiName == 'ProgramEngagement__c') {
                    indexToInsertServiceField = fieldSetValues.indexOf(field) + 1;
                }

                if (fieldApiName != 'Service__c') {
                    fieldSetContainsServiceField = false;
                }
            }

            if (!fieldSetContainsServiceField) {
                DescribeFieldResult serviceFieldDescribe = ServiceDelivery__c.Service__c.getDescribe();
                serviceField = fieldSetService.getFieldForLWC(serviceFieldDescribe);
                fieldSetValues.add(indexToInsertServiceField, serviceField);
            }
        }

        return fieldSets;
    }
}
