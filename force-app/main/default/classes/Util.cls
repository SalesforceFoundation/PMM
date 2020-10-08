public with sharing class Util {
    public static AuraHandledException getAuraHandledException(Exception ex) {
        String message = ex.getMessage();

        AuraHandledException auraEx = new AuraHandledException(message);
        auraEx.setMessage(message);

        return auraEx;
    }

    public static Map<String, String> getObjectLabels(SObjectType sObjectType) {
        return new Map<String, String>{
            'objectPluralLabel' => sObjectType.getDescribe().getLabelPlural(),
            'objectLabel' => sObjectType.getDescribe().getLabel(),
            'objectApiName' => sObjectType.getDescribe().getName()
        };
    }
}
