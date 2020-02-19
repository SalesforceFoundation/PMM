@IsTest
private class FieldSetController_TEST {
    @IsTest
    private static void whenGetFieldSetReturnsSuccessfully() {
        String objectName = 'Schema.SObjectType.ProgramEngagement__c.Name';
        String fieldSetName = 'QuickCreate';

        final FieldSetService_TEST.GetFieldSetForLWCMethod getFieldSetForLWC = new FieldSetService_TEST.GetFieldSetForLWCMethod();
        {
            getFieldSetForLWC.returnValue = new List<Map<String, String>>();
            getFieldSetForLWC.objectName = objectName;
            getFieldSetForLWC.fieldSetName = fieldSetName;
        }

        final Stub stub = new Stub(new List<Stub.Method>{ getFieldSetForLWC });

        final List<Object> expected = getFieldSetForLWC.returnValue;

        Test.startTest();

        FieldSetController.fieldSetService = (FieldSetService) Test.createStub(
            FieldSetService.class,
            stub
        );

        final List<Object> actual = FieldSetController.getFieldSetForLWC(
            objectName,
            fieldSetName
        );

        Test.stopTest();

        System.assertEquals(true, expected === actual);

        stub.assertMethodsCalled();
    }

    @IsTest
    private static void whenGetFieldSetFieldsThrowsException() {
        String objectName = 'Schema.SObjectType.ProgramEngagement__c.Name';
        String fieldSetName = 'QuickCreate';

        final String randomExceptionMessage =
            'randomExceptionMessage' + Crypto.getRandomInteger();

        final FieldSetService_TEST.GetFieldSetForLWCMethod getFieldSetForLWC = new FieldSetService_TEST.GetFieldSetForLWCMethod();
        // An exception is being thrown so the returnValue is set to null
        getFieldSetForLWC.returnValue = null;
        getFieldSetForLWC.objectName = objectName;
        getFieldSetForLWC.fieldSetName = fieldSetName;
        getFieldSetForLWC.setExceptionThrownBeforeReturningValue(randomExceptionMessage);

        final Stub stub = new Stub(new List<Stub.Method>{ getFieldSetForLWC });

        final List<Object> expected = null;

        Test.startTest();

        FieldSetController.fieldSetService = (FieldSetService) Test.createStub(
            FieldSetService.class,
            stub
        );

        Exception actualException;
        List<Object> actual;

        try {
            actual = FieldSetController.getFieldSetForLWC(objectName, fieldSetName);
        } catch (Exception e) {
            actualException = e;
        }

        Test.stopTest();

        System.assertEquals(expected, actual);
        System.assertEquals(true, actualException instanceof AuraHandledException);
        System.assertEquals(randomExceptionMessage, actualException.getMessage());

        stub.assertMethodsCalled();
    }
}
