@isTest
public with sharing class ProgramSelector_TEST {
    @isTest
    private static void testGetProgramsByContactId() {
        ProgramTestDataFactory.insertTestData(true);
        Contact con = [
            SELECT Id, Name
            FROM Contact
            WHERE LastName = 'Test Contact'
            LIMIT 1
        ][0];

        Set<Id> expectedProgramIds = new Set<Id>();

        List<ProgramEngagement__c> programEngagements = [SELECT Id, Program__c
            FROM ProgramEngagement__c
            WHERE Contact__c = :con.Id
        ];
        for (ProgramEngagement__c pe : programEngagements) {
            expectedProgramIds.add(pe.Program__c);
        }

        Test.startTest();
        ProgramSelector foo = new ProgramSelector();
        List<Program__c> actual = foo.getProgramsFromProgramEngagements(programEngagements);
        Test.stopTest();

        System.assert(!actual.isEmpty());
        for (Program__c program : actual) {
            System.assert(expectedProgramIds.contains(program.Id));
        }
    }

    public class GetProgramsByContactIdMethod extends Stub.method {
        public Id contactId;
        public List<Program__c> returnValue;

        public GetProgramsByContactIdMethod() {
            super(
                ProgramSelector.class,
                List<Program__c>.class,
                'getProgramsByContactId',
                new List<Stub.Parameter>{ new Stub.Parameter(Id.class, 'contactId') }
            );
        }

        public override Boolean isInstanceOf(Object instance) {
            return instance instanceof ProgramSelector;
        }

        public override List<Object> getExpectedArguments() {
            return new List<Object>{ this.contactId };
        }

        public override Object getReturnValue() {
            return this.returnValue;
        }
    }
}
