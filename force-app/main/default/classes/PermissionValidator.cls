public with sharing class PermissionValidator {
    @TestVisible
    private static PermissionValidator instance;

    //This is a wrapper class around SObject access checks for stubbing purposes.
    public static PermissionValidator getInstance() {
        if (instance == null) {
            instance = new PermissionValidator();
        }
        return instance;
    }

    public enum CRUDAccessType {
        CREATEABLE,
        READABLE,
        UPDATEABLE,
        DELETEABLE
    }

    public Boolean hasFLSAccessForFields(
        String objectName,
        List<String> fields,
        String operation
    ) {
        try {
            Schema.DescribeSobjectResult[] results = Schema.describeSObjects(
                new List<String>{ objectName }
            );
            Map<String, Schema.SObjectField> fieldsMap = results[0].fields.getMap();

            if (operation == 'insert') {
                for (String fieldName : fields) {
                    if (
                        fieldsMap.containsKey(fieldName) &&
                        !fieldsMap.get(fieldName).getDescribe().isCreateable()
                    ) {
                        return false;
                    }
                }
            }
            if (operation == 'upsert') {
                for (String fieldName : fields) {
                    if (
                        fieldsMap.containsKey(fieldName) &&
                        (!fieldsMap.get(fieldName).getDescribe().isCreateable() ||
                        !fieldsMap.get(fieldName).getDescribe().isUpdateable())
                    ) {
                        return false;
                    }
                }
            }
            if (operation == 'read') {
                for (String fieldName : fields) {
                    if (
                        fieldsMap.containsKey(fieldName) &&
                        !hasFieldReadAccess(fieldsMap.get(fieldName).getDescribe())
                    ) {
                        return false;
                    }
                }
            }
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public Boolean hasFieldReadAccess(DescribeFieldResult field) {
        return field.isAccessible();
    }

    public Set<DescribeFieldResult> getAccessibleFields(Set<DescribeFieldResult> fields) {
        for (DescribeFieldResult field : fields) {
            if (!hasFieldReadAccess(field)) {
                fields.remove(field);
            }
        }

        return fields;
    }

    public Boolean hasObjectAccess(SObjectType sObjectType, CRUDAccessType accessType) {
        if (sObjectType == null) {
            return false;
        }

        switch on accessType {
            when CREATEABLE {
                return sObjectType.getDescribe().isCreateable();
            }
            when READABLE {
                return sObjectType.getDescribe().isAccessible();
            }
            when UPDATEABLE {
                return sObjectType.getDescribe().isUpdateable();
            }
            when DELETEABLE {
                return sObjectType.getDescribe().isDeletable();
            }
            when else {
                return false;
            }
        }
    }
}
