@IsTest
public with sharing class RecentServiceSessionController_TEST {
    private static BasicStub serviceStub = new BasicStub(ServiceSessionService.class);

    @IsTest
    private static void testGetServiceSessionsByStartDate() {
        final String methodName = 'getServiceSessionsByStartDate';
        final String dateLiteral = 'THIS_WEEK';

        Map<String, List<ServiceSession__c>> expected = new Map<String, List<ServiceSession__c>>();

        expected.put(System.now().format('EEEE, dd MMMM'), new List<ServiceSession__c>());

        serviceStub.withReturnValue(methodName, String.class, expected);

        Test.startTest();
        RecentServiceSessionController.serviceSessionService = (ServiceSessionService) serviceStub.createMock();

        final Map<String, List<ServiceSession__c>> actual = RecentServiceSessionController.getServiceSessionsByStartDate(
            dateLiteral
        );

        Test.stopTest();

        System.assertEquals(
            expected.keySet(),
            actual.keySet(),
            'Actual key returned is not the same as expected key'
        );

        serviceStub.assertCalledWith(methodName, String.class, dateLiteral);
    }

    @IsTest
    private static void testGetServiceSessionsByStartDateWithException() {
        final String methodName = 'getServiceSessionsByStartDate';
        final String dateLiteral = 'THIS_WEEK';

        serviceStub.withThrowException(methodName, String.class);

        Test.startTest();
        RecentServiceSessionController.serviceSessionService = (ServiceSessionService) serviceStub.createMock();

        final Map<String, List<ServiceSession__c>> actual;
        Exception actualException;

        try {
            actual = RecentServiceSessionController.getServiceSessionsByStartDate(
                dateLiteral
            );
        } catch (Exception e) {
            actualException = e;
        }

        Test.stopTest();

        System.assertEquals(
            serviceStub.testExceptionMessage,
            actualException.getMessage(),
            'Expected the controller to rethrow the exception from the service.'
        );

        serviceStub.assertCalledWith(methodName, String.class, dateLiteral);
    }
}
