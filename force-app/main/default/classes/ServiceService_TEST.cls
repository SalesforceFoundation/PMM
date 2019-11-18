@isTest
public with sharing class ServiceService_TEST {

    @isTest
    private static void testGetBulkFields() {
        ServiceService service = new ServiceService();
        
        Map<String, Schema.SObjectField> expectedFields = Schema.SObjectType.ServiceDelivery__c.fields.getMap();
        
        Test.startTest();
            List<Object> fields = service.getBulkFields();
        Test.stopTest();

        System.assert(!fields.isEmpty(), 'A result must be returned for getBulkFields');
        
        for(Object obj : fields) {
            Map<String, Object> thisObj = (Map<String, Object>) obj;
            String apiName = (String)thisObj.get('apiName');
            System.assert(expectedFields.containsKey(apiName), 'Field in fieldSet not found on object');
        }
    }

    public class GetBulkFieldsMethod extends Stub.Method {

        public List<Object> returnValue;

        public GetBulkFieldsMethod() {
            super(
                ServiceService.class,
                List<Object>.class,
                'getBulkFields',
                new List<Stub.Parameter>()
            );
        }

        public override Boolean isInstanceOf(Object instance) {
            return instance instanceof ServiceService;
        }

        public override List<Object> getExpectedArguments() {
            return new List<Object>();
        }

        public override Object getReturnValue() {
            return this.returnValue;
        }

    }
}
