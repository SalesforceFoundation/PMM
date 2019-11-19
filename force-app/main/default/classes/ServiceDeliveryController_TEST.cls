@isTest
public with sharing class ServiceDeliveryController_TEST {

    @isTest
    private static void testGetFieldSet() {
        final List<Object> expected = new List<Object>();

        ServiceService_TEST.GetBulkFieldsMethod getBulkFieldsMethod = new ServiceService_Test.GetBulkFieldsMethod();
        getBulkFieldsMethod.returnValue = expected;

        final List<Stub.Method> expectedMethodsCalled = new List<Stub.Method> {
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

        System.assertEquals(
            true,
            expected == actual
        );

        stub.assertMethodsCalled();
    }

    @isTest
    private static void testGetFieldSetWithException() {
        final List<Object> expected = new List<Object>();
        final String expectedExceptionMessage = 'Script-thrown exception';

        ServiceService_TEST.GetBulkFieldsMethod getBulkFieldsMethod = new ServiceService_Test.GetBulkFieldsMethod();
        getBulkFieldsMethod.returnValue = expected;
        getBulkFieldsMethod.setExceptionThrownBeforeReturningValue(expectedExceptionMessage);
        

        final List<Stub.Method> expectedMethodsCalled = new List<Stub.Method> {
            getBulkFieldsMethod
        };

        Test.startTest();

        final Stub stub = new Stub(expectedMethodsCalled);

        ServiceDeliveryController.service = (ServiceService) Test.createStub(
            ServiceService.class,
            stub
        );
        final List<Object> actual;
        Exception actualException;

        try{
            actual = ServiceDeliveryController.getFieldSet();
        }
        catch(Exception e) {
            actualException = e;
        }

        Test.stopTest();

        System.assertEquals(
            expectedExceptionMessage,
            actualException.getMessage()
        );

        stub.assertMethodsCalled();
    }
}
