@isTest
public with sharing class ProgramService_TEST {
    @isTest
    private static void testGetProgramNamesByIdForContact() {
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
        engagement1.Program__r = program1;
        engagement1.Role__c = 'Client';

        ProgramEngagementSelector_TEST.GetProgramEngagementsByContactIdMethod getProgramEngagementsByContactIdMethod = new ProgramEngagementSelector_TEST.GetProgramEngagementsByContactIdMethod();
        getProgramEngagementsByContactIdMethod.contactId = contactId;
        getProgramEngagementsByContactIdMethod.returnValue = new List<ProgramEngagement__c>{
            engagement1
        };

        final List<Stub.Method> expectedMethodsCalled = new List<Stub.Method>{
            getProgramEngagementsByContactIdMethod
        };

        Test.startTest();

        final Stub stub = new Stub(expectedMethodsCalled);

        final ProgramService programService = new ProgramService();

        programService.programEngagementSelector = (ProgramEngagementSelector) Test.createStub(
            ProgramEngagementSelector.class,
            stub
        );

        final Map<Id, String> actual = programService.getProgramNamesByIdForContact(
            contactId
        );

        Test.stopTest();

        Set<Id> expectedKeySet = new Set<Id>{
            program1.Id
        };

        System.assertEquals(expectedKeySet, actual.keySet());

        List<String> expectedValues = new List<String>{
            program1.Name
        };

        for (String programName : actual.values()) {
            System.assert(expectedValues.contains(programName));
        }

        // Assert the actual methods called by Stub Provider equal the expected methods called.
        stub.assertMethodsCalled();
    }

    public class GetProgramNamesByIdForContactMethod extends Stub.method {
        public Id contactId;
        public Map<Id, String> returnValue;

        public GetProgramNamesByIdForContactMethod() {
            super(
                ProgramService.class,
                Map<Id, String>.class,
                'getProgramNamesByIdForContact',
                new List<Stub.Parameter>{ new Stub.Parameter(Id.class, 'contactId') }
            );
        }

        public override Boolean isInstanceOf(Object instance) {
            return instance instanceof ProgramService;
        }

        public override List<Object> getExpectedArguments() {
            return new List<Object>{ this.contactId };
        }

        public override Object getReturnValue() {
            return this.returnValue;
        }
    }
}
