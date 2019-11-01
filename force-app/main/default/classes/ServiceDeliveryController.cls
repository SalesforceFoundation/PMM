public with sharing class ServiceDeliveryController {

    @AuraEnabled (cacheable=true)
    public static List<Object> getFieldSet() {
        try {
            return getBulkFields();
        } catch (DmlException e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    //Coming soon, to a service near you
    public static List<Object> getBulkFields() {

        List<Object> fields = new List<Object>();

        for (Schema.FieldSetMember field : Schema.SObjectType.ServiceDelivery__C.FieldSets.Default.getFields()) {

            String label;
            label = field.getLabel();

            fields.add(new Map<String, Object>{
                'apiName' => field.getFieldPath(),
                'label' => label
            });
        }

        return fields;
    }
}
