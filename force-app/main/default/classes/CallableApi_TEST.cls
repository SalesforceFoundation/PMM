@IsTest
private class CallableApi_TEST {
    @IsTest
    static void testGetProgramsForContact() {
        Id contactId = Stub.generateFakeId(Schema.SObjectType.Contact);

        final Map<Id, String> expected = new Map<Id, String>();

        ProgramService_TEST.GetProgramNamesByIdForContactMethod getProgramNamesByIdForContactMethod = new ProgramService_TEST.GetProgramNamesByIdForContactMethod();
        getProgramNamesByIdForContactMethod.contactId = contactId;
        getProgramNamesByIdForContactMethod.returnValue = expected;

        final List<Stub.Method> expectedMethodsCalled = new List<Stub.Method>{
            getProgramNamesByIdForContactMethod
        };

        Test.startTest();

        final Stub stub = new Stub(expectedMethodsCalled);

        ProgramService programService = (ProgramService) Test.createStub(
            ProgramService.class,
            stub
        );

        System.Callable callableClass = (System.Callable) Type.forName('CallableApi')
            .newInstance();

        final Map<Id, String> actual = (Map<Id, String>) callableClass.call(
            'getProgramsForContact',
            new Map<String, Object>{
                'contactId' => contactId,
                'programService' => programService
            }
        );

        Test.stopTest();

        System.assertEquals(true, expected === actual);
        stub.assertMethodsCalled();
    }

    @isTest
    private static void testCallableApiUnsupportedMethodException() {
        System.Callable callableClass = (System.Callable) Type.forName('CallableApi')
            .newInstance();

        try {
            callableClass.call(
                'testMethod',
                new Map<String, Object>{ 'testParameter' => 'test' }
            );
        } catch (Exception actualException) {
            System.debug(actualException.getMessage());
            System.assertEquals(
                true,
                actualException instanceof CallableApi.ExtensionMalformedCallException
            );
            System.assertEquals('Method not implemented', actualException.getMessage());
        }
    }
}
