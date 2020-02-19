public with sharing class Util {
    /**
     * @description "Casts" e into an AuraHandledException
     * @param e
     * @return      AuraEnabledException with e's Message
     */
    public static AuraHandledException getAuraHandledException(Exception e) {
        if (e != null) {
            AuraHandledException auraHandledException = new AuraHandledException(
                e.getMessage()
            );
            auraHandledException.setMessage(e.getMessage());
            return auraHandledException;
        }
        return null;
    }
}
