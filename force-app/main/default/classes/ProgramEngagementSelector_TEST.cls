@isTest
public with sharing class ProgramEngagementSelector_TEST {
    @isTest
    private static void testGetProgramEngagementsByContactId() {
        ProgramTestDataFactory.insertTestData(true);
        Contact con = [
            SELECT Id, Name
            FROM Contact
            WHERE LastName = 'Test Contact'
            LIMIT 1
        ][0];

        Set<Id> expectedIds = (new Map<Id, ProgramEngagement__c>(
                [
                    SELECT Id, Contact__c
                    FROM ProgramEngagement__c
                    WHERE Contact__c = :con.Id
                ]
            ))
            .keySet();

        Test.startTest();
        ProgramEngagementSelector selector = new ProgramEngagementSelector();
        List<ProgramEngagement__c> actual = selector.getProgramEngagementsByContactId(
            con.Id
        );
        Test.stopTest();

        System.assert(!actual.isEmpty());
        for (ProgramEngagement__c engagement : actual) {
            System.assert(expectedIds.contains(engagement.Id));
        }
    }

    public class GetProgramEngagementsByContactIdMethod extends Stub.method {
        public Id contactId;
        public List<ProgramEngagement__c> returnValue;

        public GetProgramEngagementsByContactIdMethod() {
            super(
                ProgramEngagementSelector.class,
                List<ProgramEngagement__c>.class,
                'getProgramEngagementsByContactId',
                new List<Stub.Parameter>{ new Stub.Parameter(Id.class, 'contactId') }
            );
        }

        public override Boolean isInstanceOf(Object instance) {
            return instance instanceof ProgramEngagementSelector;
        }

        public override List<Object> getExpectedArguments() {
            return new List<Object>{ this.contactId };
        }

        public override Object getReturnValue() {
            return this.returnValue;
        }
    }
}
