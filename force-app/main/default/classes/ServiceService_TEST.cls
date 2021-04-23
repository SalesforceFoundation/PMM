/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@isTest
public with sharing class ServiceService_TEST {
    @IsTest
    private static void testGetServicesEngagementsByContactId() {
        Id contactId = TestUtil.mockId(Contact.SObjectType);

        Program__c program1 = new Program__c(
            Id = TestUtil.mockId(Program__c.SObjectType),
            Name = 'Program 1',
            Status__c = 'Active',
            StartDate__c = Date.today(),
            EndDate__c = Date.today().addDays(30)
        );

        ProgramEngagement__c engagement1 = new ProgramEngagement__c(
            Name = 'Engagement 1',
            Stage__c = 'Enrolled',
            Contact__c = contactId,
            Program__c = program1.Id,
            Role__c = 'Client'
        );

        Service__c service1 = new Service__c(
            Id = TestUtil.mockId(Service__c.SObjectType),
            Name = 'Service 1',
            Program__c = program1.Id,
            Status__c = 'Active',
            UnitOfMeasurement__c = 'Hours'
        );

        List<ProgramEngagement__c> engagements = new List<ProgramEngagement__c>{
            engagement1
        };
        List<Service__c> services = new List<Service__c>{ service1 };
        Stub engagementSelectorStub = new StubBuilder(ProgramEngagementSelector.class)
            .when('getProgramEngagementsByContactId', Id.class)
            .calledWith(contactId)
            .thenReturn(engagements)
            .build();
        Stub serviceSelectorStub = new StubBuilder(ServiceSelector.class)
            .when('getServicesByProgramIds', Set<Id>.class)
            .calledWith(new Set<Id>{ program1.Id })
            .thenReturn(services)
            .build();

        ServiceService service = new ServiceService();
        service.serviceSelector = (ServiceSelector) serviceSelectorStub.create();
        service.engagementSelector = (ProgramEngagementSelector) engagementSelectorStub.create();

        Test.startTest();
        Map<String, List<Object>> actual = service.getServicesEngagementsByContactId(
            contactId
        );
        Test.stopTest();

        Set<String> expectedKeySet = new Set<String>{ 'engagements', 'services' };
        System.assertEquals(
            expectedKeySet,
            actual.keySet(),
            'Expected both keys to be returned.'
        );

        for (List<Object> objList : actual.values()) {
            System.assert(!objList.isEmpty());
        }

        engagementSelectorStub.assertMethodsCalled();
        serviceSelectorStub.assertMethodsCalled();
    }

    @IsTest
    private static void testGetServicesByProgramEngagementId() {
        Id programEngagementId = TestUtil.mockId(ProgramEngagement__c.SObjectType);

        Program__c program1 = new Program__c(
            Id = TestUtil.mockId(Program__c.SObjectType),
            Name = 'Program 1',
            Status__c = 'Active',
            StartDate__c = Date.today(),
            EndDate__c = Date.today().addDays(30)
        );

        ProgramEngagement__c engagement1 = new ProgramEngagement__c(
            Name = 'Engagement 1',
            Stage__c = 'Enrolled',
            Program__c = program1.Id,
            Role__c = 'Client'
        );

        Service__c service1 = new Service__c(
            Id = TestUtil.mockId(Service__c.SObjectType),
            Name = 'Service 1',
            Program__c = program1.Id,
            Status__c = 'Active',
            UnitOfMeasurement__c = 'Hours'
        );

        List<Service__c> services = new List<Service__c>{ service1 };
        Map<String, String> expectedValues = new Map<String, String>();
        expectedValues.put('label', Service1.Name);
        expectedValues.put('program', program1.Id);
        expectedValues.put('value', service1.Id);

        final List<object> expected = new List<Object>{ expectedValues };

        Stub serviceSelectorStub = new StubBuilder(ServiceSelector.class)
            .when('getServicesByProgramEngagementId', Id.class)
            .calledWith(programEngagementId)
            .thenReturn(services)
            .build();

        Test.startTest();

        final ServiceService service = new ServiceService();
        service.serviceSelector = (ServiceSelector) serviceSelectorStub.create();

        final List<Object> actual = service.getServicesByProgramEngagementId(
            programEngagementId
        );

        Test.stopTest();
        System.assertEquals(
            expected,
            actual,
            'Expected that both expected and actual have the same values'
        );

        System.assertEquals(
            expected.size(),
            actual.size(),
            'Expected the size of both expected and actual are the same'
        );

        serviceSelectorStub.assertMethodsCalled();
    }

    //Removing the service field from the fieldset
    @IsTest
    private static void testGetServiceDeliveryFieldSetsWithoutService() {
        Map<String, Object> removedServiceField;
        FieldSetService fieldSetService = new FieldSetService();
        Integer serviceFieldIndex;

        Map<String, Object> fieldSetsToReturn = fieldSetService.getFieldSetsByName(
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

        //Remove the service field from the fieldset that we got back
        for (String key : fieldSetsToReturn.keySet()) {
            List<Map<String, Object>> fieldSetValues = (List<Map<String, Object>>) fieldSetsToReturn.get(
                key
            );

            if (fieldSetValues.indexOf(serviceField) > 0) {
                removedServiceField = fieldSetValues.remove(
                    fieldSetValues.indexOf(serviceField)
                );

                System.assertEquals(
                    removedServiceField,
                    serviceField,
                    'Service field was not removed from the fieldset as expected'
                );
                System.assertEquals(
                    false,
                    fieldSetValues.contains(serviceField),
                    'Service field was not removed from the fieldset'
                );
            }
        }

        Stub fieldSetServiceStub = new StubBuilder(fieldSetService.class)
            .when('getFieldSetsByName', String.class)
            .calledWith(Schema.SObjectType.ServiceDelivery__c.getName())
            .thenReturn(fieldSetsToReturn)
            .when('getFieldForLWC', DescribeFieldResult.class)
            .calledWith(ServiceDelivery__c.Service__c.getDescribe())
            .thenReturn(serviceField)
            .when('getFieldForLWC', DescribeFieldResult.class)
            .calledWith(ServiceDelivery__c.Contact__c.getDescribe())
            .thenReturn(contactField)
            .when('getFieldForLWC', DescribeFieldResult.class)
            .calledWith(ServiceDelivery__c.ProgramEngagement__c.getDescribe())
            .thenReturn(engagementField)
            .build();

        ServiceService service = new ServiceService();
        service.fieldSetService = (FieldSetService) fieldSetServiceStub.create();

        Test.startTest();
        Map<String, Object> actualFieldSets = service.getServiceDeliveryFieldSets();
        Test.stopTest();

        for (String key : actualFieldSets.keySet()) {
            List<Map<String, Object>> fieldSetValues = (List<Map<String, Object>>) actualFieldSets.get(
                key
            );

            serviceFieldIndex = fieldSetValues.indexOf(serviceField);

            System.assert(
                serviceFieldIndex > 0,
                'Expected the service field to be after the contact or the program engagement field.'
            );
        }

        fieldSetServiceStub.assertMethodsCalled();
    }

    //Do not remove any fields from the fieldset
    @IsTest
    private static void testGetServiceDeliveryFieldSetsWithAllFields() {
        Map<String, Object> removedServiceField;
        FieldSetService fieldSetService = new FieldSetService();
        Integer serviceFieldIndex;

        Map<String, Object> fieldSetsToReturn = fieldSetService.getFieldSetsByName(
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

        Stub fieldSetServiceStub = new StubBuilder(fieldSetService.class)
            .when('getFieldSetsByName', String.class)
            .calledWith(Schema.SObjectType.ServiceDelivery__c.getName())
            .thenReturn(fieldSetsToReturn)
            .when('getFieldForLWC', DescribeFieldResult.class)
            .calledWith(ServiceDelivery__c.Service__c.getDescribe())
            .thenReturn(serviceField)
            .when('getFieldForLWC', DescribeFieldResult.class)
            .calledWith(ServiceDelivery__c.Contact__c.getDescribe())
            .thenReturn(contactField)
            .when('getFieldForLWC', DescribeFieldResult.class)
            .calledWith(ServiceDelivery__c.ProgramEngagement__c.getDescribe())
            .thenReturn(engagementField)
            .build();

        ServiceService service = new ServiceService();
        service.fieldSetService = (FieldSetService) fieldSetServiceStub.create();

        Test.startTest();
        Map<String, Object> actualFieldSets = service.getServiceDeliveryFieldSets();
        Test.stopTest();

        for (String key : actualFieldSets.keySet()) {
            List<Map<String, Object>> fieldSetValues = (List<Map<String, Object>>) actualFieldSets.get(
                key
            );

            serviceFieldIndex = fieldSetValues.indexOf(serviceField);

            System.assert(
                serviceFieldIndex > 0,
                'Expected the service field to be after the contact or the program engagement field.'
            );
        }

        fieldSetServiceStub.assertMethodsCalled();
    }

    //Removing the contact and service field from the fieldset
    @IsTest
    private static void testGetServiceDeliveryFieldSetsWithoutContactAndService() {
        Map<String, Object> removedServiceField;
        Map<String, Object> removedContactField;
        FieldSetService fieldSetService = new FieldSetService();
        Integer serviceFieldIndex;

        Map<String, Object> fieldSetsToReturn = fieldSetService.getFieldSetsByName(
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

        //Remove the contact and service field from the fieldset that we got back
        for (String key : fieldSetsToReturn.keySet()) {
            List<Map<String, Object>> fieldSetValues = (List<Map<String, Object>>) fieldSetsToReturn.get(
                key
            );

            if (fieldSetValues.indexOf(serviceField) > 0) {
                removedServiceField = fieldSetValues.remove(
                    fieldSetValues.indexOf(serviceField)
                );

                System.assertEquals(
                    removedServiceField,
                    serviceField,
                    'Service field was not removed from the fieldset as expected'
                );

                System.assertEquals(
                    false,
                    fieldSetValues.contains(serviceField),
                    'Service field was not removed from the fieldset'
                );
            }

            if (fieldSetValues.indexOf(contactField) > 0) {
                removedContactField = fieldSetValues.remove(
                    fieldSetValues.indexOf(contactField)
                );

                System.assertEquals(
                    removedContactField,
                    contactField,
                    'Contact field was not removed from the fieldset as expected'
                );

                System.assertEquals(
                    false,
                    fieldSetValues.contains(contactField),
                    'Contact field was not removed from the fieldset'
                );
            }
        }

        Stub fieldSetServiceStub = new StubBuilder(fieldSetService.class)
            .when('getFieldSetsByName', String.class)
            .calledWith(Schema.SObjectType.ServiceDelivery__c.getName())
            .thenReturn(fieldSetsToReturn)
            .when('getFieldForLWC', DescribeFieldResult.class)
            .calledWith(ServiceDelivery__c.Service__c.getDescribe())
            .thenReturn(serviceField)
            .when('getFieldForLWC', DescribeFieldResult.class)
            .calledWith(ServiceDelivery__c.Contact__c.getDescribe())
            .thenReturn(contactField)
            .when('getFieldForLWC', DescribeFieldResult.class)
            .calledWith(ServiceDelivery__c.ProgramEngagement__c.getDescribe())
            .thenReturn(engagementField)
            .build();

        ServiceService service = new ServiceService();
        service.fieldSetService = (FieldSetService) fieldSetServiceStub.create();

        Test.startTest();
        Map<String, Object> actualFieldSets = service.getServiceDeliveryFieldSets();
        Test.stopTest();

        for (String key : actualFieldSets.keySet()) {
            List<Map<String, Object>> fieldSetValues = (List<Map<String, Object>>) actualFieldSets.get(
                key
            );

            serviceFieldIndex = fieldSetValues.indexOf(serviceField);

            System.assert(
                serviceFieldIndex > 0,
                'Expected the service field to be after the program engagement field.'
            );
        }

        fieldSetServiceStub.assertMethodsCalled();
    }

    // TODO: Write more tests for the following scenarios :
    // 1. Remove the program engagement and contact field the fieldset
    // 2. Remove the program engagement field from the fieldset
    // 3. Test List index scenario when fieldset size is less than the index of where the service field needs to be added
}
