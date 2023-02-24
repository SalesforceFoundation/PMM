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

    private static final String SERVICE_STATUS_ACTIVE = 'ServiceStatusActive';
    private static final String ENGAGEMENTS = 'engagements';
    private static final String SERVICES = 'services';
    private static final String LABEL = 'label';
    private static final String VALUE = 'value';
    private static final String NAME = 'Name';
    private static final String Id = 'Id';
    private static final String PROGRAM = 'program';
    private static final String BSDT_ACTIVE_FILTER = 'BSDTActiveFilter';

    @TestVisible
    private FieldBucketSelector bucketSelector = new FieldBucketSelector();

    @TestVisible
    private FieldSetService fieldSetService = new FieldSetService();

    @TestVisible
    private ServiceSelector serviceSelector = new ServiceSelector();

    @TestVisible
    private ProgramEngagementService engagementService = new ProgramEngagementService();

    @TestVisible
    private ProgramEngagementSelector engagementSelector = new ProgramEngagementSelector();

    @TestVisible
    private Set<String> activeStatuses {
        get {
            if (activeStatuses == null) {
                activeStatuses = getActiveStatuses();
            }
            return activeStatuses;
        }
        set;
    }

    private Set<String> getActiveStatuses() {
        List<String> bucketNames = new List<String>{ SERVICE_STATUS_ACTIVE };
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

    private Boolean isBsdtActiveFilterActive() {
        List<FeatureGate__mdt> features = CustomMetadataSelector.getInstance()
            .getAllFeatureGates();

        for (FeatureGate__mdt feature : features) {
            if (feature.IsActive__c && BSDT_ACTIVE_FILTER == feature.DeveloperName) {
                return feature.IsActive__c;
            }
        }

        return false;
    }

    public Map<String, List<Object>> getServicesEngagementsByContactId(Id contactId) {
        Set<Id> programIds = new Set<Id>();
        String serviceProgram = Schema.SObjectType.Service__c.Fields.Program__c.getName();
        String engageProgram = Schema.SObjectType.ProgramEngagement__c.Fields.Program__c.getName();
        Set<String> activeServiceStatuses = activeStatuses;
        Set<String> activeProgramEngagementStages = engagementService.getActiveStages();
        Boolean bsdtFilterIsActive = isBsdtActiveFilterActive();

        Map<String, List<Object>> result = new Map<String, List<Object>>();
        result.put(ENGAGEMENTS, new List<Object>());
        result.put(SERVICES, new List<Object>());

        for (
            ProgramEngagement__c engagement : engagementSelector.getProgramEngagementsByContactId(
                contactId
            )
        ) {
            if (
                !bsdtFilterIsActive ||
                (activeProgramEngagementStages.isEmpty() ||
                activeProgramEngagementStages.contains(engagement.Stage__c))
            ) {
                programIds.add(engagement.Program__c);
                result.get(ENGAGEMENTS)
                    .add(convertObjectToOption(engagement, engageProgram));
            }
        }

        for (Service__c service : serviceSelector.getServicesByProgramIds(programIds)) {
            if (
                !bsdtFilterIsActive ||
                (activeServiceStatuses.isEmpty() ||
                activeServiceStatuses.contains(service.Status__c))
            ) {
                result.get(SERVICES).add(convertObjectToOption(service, serviceProgram));
            }
        }

        return result;
    }

    private Map<String, String> convertObjectToOption(sObject obj, String programField) {
        Map<String, String> result = new Map<String, String>();
        result.put(LABEL, (String) obj.get(NAME));
        result.put(VALUE, (String) obj.get(ID));
        result.put(PROGRAM, (String) obj.get(programField));
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
