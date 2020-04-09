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
    @isTest
    private static void testGetBulkFields() {
        ServiceService service = new ServiceService();

        Map<String, Schema.SObjectField> expectedFields = Schema.SObjectType.ServiceDelivery__c.fields.getMap();

        Test.startTest();
        List<Object> fields = service.getBulkFields();
        Test.stopTest();

        System.assert(!fields.isEmpty(), 'A result must be returned for getBulkFields');

        for (Object obj : fields) {
            Map<String, Object> thisObj = (Map<String, Object>) obj;
            String apiName = (String) thisObj.get('apiName');
            System.assert(
                expectedFields.containsKey(apiName),
                'Field in fieldSet not found on object'
            );
        }
    }

    public class GetBulkFieldsMethod extends Stub.Method {
        public List<Object> returnValue;

        public GetBulkFieldsMethod() {
            super(
                ServiceService.class,
                List<Object>.class,
                'getBulkFields',
                new List<Stub.Parameter>()
            );
        }

        public override Boolean isInstanceOf(Object instance) {
            return instance instanceof ServiceService;
        }

        public override List<Object> getExpectedArguments() {
            return new List<Object>();
        }

        public override Object getReturnValue() {
            return this.returnValue;
        }
    }

    @isTest
    private static void testGetServicesEngagementsByContactId() {
        Id contactId = Stub.generateFakeId(Schema.SObjectType.Contact);

        Program__c program1 = new Program__c();
        program1.Id = Stub.generateFakeId(Schema.SObjectType.Program__c);
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
        service1.Id = Stub.generateFakeId(Schema.SObjectType.Service__c);
        service1.Name = 'Service 1';
        service1.Program__c = program1.Id;
        service1.Status__c = 'Active';
        service1.UnitOfMeasurement__c = 'Hours';

        ProgramEngagementSelector_TEST.GetProgramEngagementsByContactIdMethod getProgramEngagementsByContactIdMethod = new ProgramEngagementSelector_TEST.GetProgramEngagementsByContactIdMethod();
        getProgramEngagementsByContactIdMethod.contactId = contactId;
        getProgramEngagementsByContactIdMethod.returnValue = new List<ProgramEngagement__c>{
            engagement1
        };

        ServiceSelector_TEST.GetServicesByProgramIdsMethod getServicesByProgramIdsMethod = new ServiceSelector_TEST.GetServicesByProgramIdsMethod();
        getServicesByProgramIdsMethod.programIds = new Set<Id>{ program1.Id };
        getServicesByProgramIdsMethod.returnValue = new List<Service__c>{ service1 };

        final List<Stub.Method> expectedMethodsCalled = new List<Stub.Method>{
            getProgramEngagementsByContactIdMethod,
            getServicesByProgramIdsMethod
        };

        Test.startTest();

        final Stub stub = new Stub(expectedMethodsCalled);

        final ServiceService service = new ServiceService();

        service.serviceSelector = (ServiceSelector) Test.createStub(
            ServiceSelector.class,
            stub
        );

        service.engagementSelector = (ProgramEngagementSelector) Test.createStub(
            ProgramEngagementSelector.class,
            stub
        );

        final Map<String, List<Object>> actual = service.getServicesEngagementsByContactId(
            contactId
        );

        Test.stopTest();

        Set<String> expectedKeySet = new Set<String>{ 'engagements', 'services' };

        System.assertEquals(expectedKeySet, actual.keySet());

        for (List<Object> objList : actual.values()) {
            System.assert(!objList.isEmpty());
        }

        // Assert the actual methods called by Stub Provider equal the expected methods called.
        stub.assertMethodsCalled();
    }

    public class GetServicesEngagementsByContactIdMethod extends Stub.Method {
        public Id contactId;
        public Map<String, List<Object>> returnValue;

        public GetServicesEngagementsByContactIdMethod() {
            super(
                ServiceService.class,
                Map<String, List<Object>>.class,
                'getServicesEngagementsByContactId',
                new List<Stub.Parameter>{ new Stub.Parameter(Id.class, 'contactId') }
            );
        }

        public override Boolean isInstanceOf(Object instance) {
            return instance instanceof ServiceService;
        }

        public override List<Object> getExpectedArguments() {
            return new List<Object>{ this.contactId };
        }

        public override Object getReturnValue() {
            return this.returnValue;
        }
    }
}
