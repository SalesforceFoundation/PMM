@IsTest
/**
 * Utility methods for test classes
 */
public with sharing class TestUtil {
    public static Integer counter {
        get {
            if (counter == null) {
                counter = 0;
            }
            counter++;

            return counter;
        }
        set;
    }

    public static Id mockId(SObjectType sObjType) {
        return mockIds(sObjType, 1)[0];
    }

    public static List<Id> mockIds(SObjectType sObjectType, Integer size) {
        String keyPrefix = sObjectType.getDescribe().getKeyPrefix();
        List<Id> ids = new List<Id>();

        for (Integer i = 0; i < size; i++) {
            Integer uniqueCounter = counter;
            ids.add(
                keyPrefix +
                '0'.repeat(12 - String.valueOf(uniqueCounter).length()) +
                uniqueCounter
            );
        }

        return ids;
    }
}
