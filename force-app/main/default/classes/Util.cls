public with sharing class Util {
    public static AuraHandledException getAuraHandledException(Exception ex) {
        String message = ex.getMessage();

        AuraHandledException auraEx = new AuraHandledException(message);
        auraEx.setMessage(message);

        return auraEx;
    }
}
