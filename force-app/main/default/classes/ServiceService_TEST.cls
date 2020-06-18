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
    private static BasicStub engagementSelectorStub = new BasicStub(
        ProgramEngagementSelector.class
    );
    private static BasicStub serviceSelectorStub = new BasicStub(ServiceSelector.class);

    @IsTest
    private static void testGetServicesEngagementsByContactId() {
        Id contactId = TestUtil.mockId(Contact.SObjectType);

        Program__c program1 = new Program__c();
        program1.Id = TestUtil.mockId(Program__c.SObjectType);
        program1.Name = 'Program 1';
        program1.Status__c = 'Active';
        program1.StartDate__c = Date.today();
        program1.EndDate__c = Date.today().addDays(30);

        ProgramEngagement__c engagement1 = new ProgramEngagement__c();
        engagement1.Name = 'Engagement 1';
        engagement1.Stage__c = 'Enrolled';
        engagement1.Contact__c = contactId;
        engagement1.Program__c = program1.Id;
        engagement1.Role__c = 'Client';

        Service__c service1 = new Service__c();
        service1.Id = TestUtil.mockId(Service__c.SObjectType);
        service1.Name = 'Service 1';
        service1.Program__c = program1.Id;
        service1.Status__c = 'Active';
        service1.UnitOfMeasurement__c = 'Hours';

        List<ProgramEngagement__c> engagements = new List<ProgramEngagement__c>{
            engagement1
        };
        List<Service__c> services = new List<Service__c>{ service1 };
        engagementSelectorStub.withReturnValue(
            'getProgramEngagementsByContactId',
            Id.class,
            engagements
        );
        serviceSelectorStub.withReturnValue(
            'getServicesByProgramIds',
            Set<Id>.class,
            services
        );

        Test.startTest();

        final ServiceService service = new ServiceService();
        service.serviceSelector = (ServiceSelector) serviceSelectorStub.createMock();
        service.engagementSelector = (ProgramEngagementSelector) engagementSelectorStub.createMock();

        final Map<String, List<Object>> actual = service.getServicesEngagementsByContactId(
            contactId
        );

        Test.stopTest();

        Set<String> expectedKeySet = new Set<String>{ 'engagements', 'services' };

        System.assertEquals(expectedKeySet, actual.keySet());

        for (List<Object> objList : actual.values()) {
            System.assert(!objList.isEmpty());
        }

        serviceSelectorStub.assertCalledWith(
            'getServicesByProgramIds',
            Set<Id>.class,
            new Set<Id>{ program1.Id }
        );
        engagementSelectorStub.assertCalledWith(
            'getProgramEngagementsByContactId',
            Id.class,
            contactId
        );
    }

    @IsTest
    private static void testGetServicesByProgramEngagementId() {
        Id programEngagementId = TestUtil.mockId(ProgramEngagement__c.SObjectType);

        Program__c program1 = new Program__c();
        program1.Id = TestUtil.mockId(Program__c.SObjectType);
        program1.Name = 'Program 1';
        program1.Status__c = 'Active';
        program1.StartDate__c = Date.today();
        program1.EndDate__c = Date.today().addDays(30);

        ProgramEngagement__c engagement1 = new ProgramEngagement__c();
        engagement1.Name = 'Engagement 1';
        engagement1.Stage__c = 'Enrolled';
        engagement1.Program__c = program1.Id;
        engagement1.Role__c = 'Client';

        Service__c service1 = new Service__c();
        service1.Id = TestUtil.mockId(Service__c.SObjectType);
        service1.Name = 'Service 1';
        service1.Program__c = program1.Id;
        service1.Status__c = 'Active';
        service1.UnitOfMeasurement__c = 'Hours';

        List<Service__c> services = new List<Service__c>{ service1 };
        Map<String, String> expectedValues = new Map<String, String>();
        expectedValues.put('label', Service1.Name);
        expectedValues.put('program', program1.Id);
        expectedValues.put('value', service1.Id);

        final List<object> expected = new List<Object>{ expectedValues };

        serviceSelectorStub.withReturnValue(
            'getServicesByProgramEngagementId',
            Id.class,
            services
        );

        Test.startTest();

        final ServiceService service = new ServiceService();
        service.serviceSelector = (ServiceSelector) serviceSelectorStub.createMock();

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

        serviceSelectorStub.assertCalledWith(
            'getServicesByProgramEngagementId',
            Id.class,
            programEngagementId
        );
    }
}
