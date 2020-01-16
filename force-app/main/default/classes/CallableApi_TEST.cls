@IsTest
private class CallableApi_TEST {

    @IsTest
    static void testGetProgramsForContact() {

        // Given
        String extensionClass = 'CallableApi';
        Decimal decimalTestValue = 10;

        // When
        Callable extension =
            (Callable) Type.forName(extensionClass).newInstance();
        Decimal result = (Decimal)
            extension.call('multiplyNumbers', new Map<String, Object> {
                'decimalValue' => decimalTestValue
            });

        // Then
        System.assertEquals(100, result);



/*
        ******************************
*/
        final Map<Id, String> expected = new Map<Id, String>();

/*
        ServiceService_TEST.GetBulkFieldsMethod getBulkFieldsMethod = new ServiceService_Test.GetBulkFieldsMethod();
        getBulkFieldsMethod.returnValue = expected;

        final List<Stub.Method> expectedMethodsCalled = new List<Stub.Method>{
            getBulkFieldsMethod
        };

        Test.startTest();

        final Stub stub = new Stub(expectedMethodsCalled);

        ServiceDeliveryController.service = (ServiceService) Test.createStub(
            ServiceService.class,
            stub
        );

        final List<Object> actual = ServiceDeliveryController.getFieldSet();

        Test.stopTest();

        System.assertEquals(true, expected == actual);

        stub.assertMethodsCalled();

*/
    }
}