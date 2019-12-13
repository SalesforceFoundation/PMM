@isTest
public with sharing class ServiceSelector_TEST {
    @isTest
    private static void testGetServicesByProgramIds() {
        ProgramTestDataFactory.insertTestData(true);

        Program__c program1 = [
            SELECT Id, Name
            FROM Program__c
            WHERE Name = 'Program 1'
            LIMIT 1
        ][0];

        Set<Id> expectedIds = (new Map<Id, Service__c>(
                [SELECT Id FROM Service__c WHERE Program__c = :program1.Id]
            ))
            .keySet();

        Test.startTest();
        ServiceSelector selector = new ServiceSelector();
        List<Service__c> actual = selector.getServicesByProgramIds(
            new Set<Id>{ program1.Id }
        );
        Test.stopTest();

        System.assert(!expectedIds.isEmpty());
        System.assert(!actual.isEmpty());
        for (Service__c service : actual) {
            System.assert(expectedIds.contains(service.Id));
        }
    }

    public class GetServicesByProgramIdsMethod extends Stub.method {
        public Set<Id> programIds;
        public List<Service__c> returnValue;

        public GetServicesByProgramIdsMethod() {
            super(
                ServiceSelector.class,
                List<Service__c>.class,
                'getServicesByProgramIds',
                new List<Stub.Parameter>{
                    new Stub.Parameter(Set<Id>.class, 'programIds')
                }
            );
        }

        public override Boolean isInstanceOf(Object instance) {
            return instance instanceof ServiceSelector;
        }

        public override List<Object> getExpectedArguments() {
            return new List<Object>{ this.programIds };
        }

        public override Object getReturnValue() {
            return this.returnValue;
        }
    }
}
