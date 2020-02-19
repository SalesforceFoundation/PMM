@IsTest
public with sharing class FieldSetService_TEST {
    @IsTest
    private static void testGetFieldSetForLWC() {
        Test.startTest();

        FieldSetService fieldSetService = new FieldSetService();

        Schema.FieldSet fieldSet = Schema.SObjectType.ProgramEngagement__c.FieldSets.QuickCreate;

        List<Map<String, String>> fieldsResult = fieldSetService.getFieldSetForLWC(
            Schema.SObjectType.ProgramEngagement__c.Name,
            'QuickCreate'
        );

        Test.stopTest();

        Map<String, Map<String, String>> fieldsResultByApiName = new Map<String, Map<String, String>>();

        for (Map<String, String> fieldMap : fieldsResult) {
            fieldsResultByApiName.put(fieldMap.get('apiName'), fieldMap);
        }

        System.debug(JSON.serializePretty(fieldsResultByApiName));

        for (Schema.FieldSetMember fieldSetMember : fieldSet.getFields()) {
            String expectedLabel = fieldSetMember.label;

            System.assertEquals(
                expectedLabel,
                fieldsResultByApiName.get(fieldSetMember.getFieldPath()).get('label')
            );

            System.assertEquals(
                fieldSetMember.getFieldPath(),
                fieldsResultByApiName.get(fieldSetMember.getFieldPath()).get('apiName')
            );
        }

        System.assertEquals(fieldSet.getFields().size(), fieldsResult.size());
    }

    /**
     * @description This is a stub method for the getFieldSet method in the FieldSetController Class
     */
    public class GetFieldSetForLWCMethod extends Stub.Method {
        public String objectName;
        public String fieldSetName;
        public List<Map<String, String>> returnValue;

        public GetFieldSetForLWCMethod() {
            super(
                Util.class,
                List<Map<String, String>>.class,
                'getFieldSetForLWC',
                new List<Stub.Parameter>{
                    new Stub.Parameter(String.class, 'objectName'),
                    new Stub.Parameter(String.class, 'fieldSetName')
                }
            );
        }

        public override Boolean isInstanceOf(Object instance) {
            return instance instanceof FieldSetService;
        }

        public override List<Object> getExpectedArguments() {
            return new List<Object>{ this.objectName, this.fieldSetName };
        }

        public override Object getReturnValue() {
            return this.returnValue;
        }
    }
}
