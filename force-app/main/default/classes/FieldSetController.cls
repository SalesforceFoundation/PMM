public with sharing class FieldSetController {
    @TestVisible
    private static FieldSetService fieldSetService = new FieldSetService();

    /**
     * @description Gets a custom pmm fieldset for a given object in a data structure LWC can use
     * @param       String objectName
     * @param       String fieldSetName
     * @return      List<Map<String, String>> list of fields, each with apiName and label keys
     */
    @AuraEnabled(cacheable=true)
    public static List<Map<String, String>> getFieldSetForLWC(
        String objectName,
        String fieldSetName
    ) {
        try {
            return fieldSetService.getFieldSetForLWC(objectName, fieldSetName);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}
