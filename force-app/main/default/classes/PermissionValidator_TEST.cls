@IsTest
private class PermissionValidator_TEST {
    @IsTest
    private static void testHasFLSAccessInsertGoodField() {
        Boolean canAccessContactName = PermissionValidator.getInstance()
            .hasFLSAccessForFields('Contact', new List<String>{ 'LastName' }, 'insert');
        System.assert(
            canAccessContactName,
            'Has insert perms on Contact.LastName, expect true'
        );
    }

    @IsTest
    private static void testHasFLSAccessInsertBadObjectName() {
        Boolean badObjectName = PermissionValidator.getInstance()
            .hasFLSAccessForFields('TestObject', new List<String>{ 'Test' }, 'insert');
        System.assert(!badObjectName, 'Bad object name, expect false');
    }

    @IsTest
    private static void testHasFLSAccessInsertBadFieldNameStrictModeDisabled() {
        Boolean badFieldName = PermissionValidator.getInstance()
            .hasFLSAccessForFields(
                'Contact',
                new List<String>{ 'BadFieldName__123' },
                'insert',
                false
            );
        System.assert(badFieldName, 'Returns true when a field does not exist.');
    }

    @IsTest
    private static void testHasFLSAccessInsertBadFieldName() {
        Boolean badFieldName = PermissionValidator.getInstance()
            .hasFLSAccessForFields(
                'Contact',
                new List<String>{ 'BadFieldName__123' },
                'insert'
            );
        System.assert(!badFieldName, 'Bad field name, expect false');
    }

    @IsTest
    private static void testHasFLSAccessInsertNonCreatableField() {
        Boolean nonCreatableField = PermissionValidator.getInstance()
            .hasFLSAccessForFields(
                'Contact',
                new List<String>{ 'LastModifiedById' },
                'insert'
            );
        System.assert(!nonCreatableField, 'Can not modify system field, expect false');
    }

    @IsTest
    private static void testHasFLSAccessUpsertBadFieldName() {
        Boolean nonExistentField = PermissionValidator.getInstance()
            .hasFLSAccessForFields(
                'Contact',
                new List<String>{ 'BadObjectName__123' },
                'upsert'
            );
        System.assert(!nonExistentField, 'Bad field name, expect false');
    }

    @IsTest
    private static void testHasFLSAccessUpsertNonReparentable() {
        Boolean nonUpdateableField = PermissionValidator.getInstance()
            .hasFLSAccessForFields(
                Schema.SObjectType.Program__c.getName(),
                new List<String>{
                    Schema.SObjectType.Program__c.fields.LastModifiedById.getName()
                },
                'upsert'
            );
        System.assert(!nonUpdateableField, 'Non updateable system field, expect false');
    }

    @IsTest
    private static void testHasFLSAccessUpsertGoodField() {
        Boolean editableField = PermissionValidator.getInstance()
            .hasFLSAccessForFields('Contact', new List<String>{ 'FirstName' }, 'upsert');
        System.assert(editableField, 'Editable field, expect true');
    }

    @IsTest
    private static void testHasFLSAccessReadGoodField() {
        Boolean readableField = PermissionValidator.getInstance()
            .hasFLSAccessForFields('Contact', new List<String>{ 'FirstName' }, 'read');
        System.assert(readableField, 'Readable field, expect true');
    }

    @IsTest
    private static void testHasFLSAccessNoFLSField() {
        Boolean noFLSField;
        System.runAs(TestUtil.getTestUser()) {
            // test user has no custom object permissions
            noFLSField = PermissionValidator.getInstance()
                .hasFLSAccessForFields(
                    'Contact',
                    new List<String>{ 'DoNotCall' },
                    'read'
                );
        }
        System.assert(!noFLSField, 'Custom field name, expect false');
    }

    @IsTest
    private static void testGetAccessibleFields() {
        Test.startTest();
        Set<DescribeFieldResult> expected;
        Set<DescribeFieldResult> actual;
        System.runAs(TestUtil.getTestUser()) {
            expected = new Set<DescribeFieldResult>{
                Schema.SObjectType.Contact.Fields.FirstName
            };
            Set<DescribeFieldResult> fields = new Set<DescribeFieldResult>{
                Schema.SObjectType.Contact.Fields.FirstName,
                Schema.SObjectType.Contact.Fields.DoNotCall
            };
            actual = PermissionValidator.getInstance().getAccessibleFields(fields);
        }
        Test.stopTest();

        System.assertEquals(expected, actual);
    }

    @IsTest
    private static void testHasObjectAccessWithStandardObjectsAsAdmin() {
        Boolean canCreateContact = PermissionValidator.getInstance()
            .hasObjectAccess(
                Contact.SObjectType,
                PermissionValidator.CRUDAccessType.CREATEABLE
            );
        System.assert(canCreateContact, 'Has Create perms on Contact, expect true');

        Boolean canReadContact = PermissionValidator.getInstance()
            .hasObjectAccess(
                Contact.SObjectType,
                PermissionValidator.CRUDAccessType.READABLE
            );
        System.assert(canReadContact, 'Has Read perms on Contact, expect true');

        Boolean canUpdateContact = PermissionValidator.getInstance()
            .hasObjectAccess(
                Contact.SObjectType,
                PermissionValidator.CRUDAccessType.UPDATEABLE
            );
        System.assert(canUpdateContact, 'Has Update perms on Contact, expect true');

        Boolean canDeleteContact = PermissionValidator.getInstance()
            .hasObjectAccess(
                Contact.SObjectType,
                PermissionValidator.CRUDAccessType.DELETEABLE
            );
        System.assert(canDeleteContact, 'Has Delete perms on Contact, expect true');
    }

    @IsTest
    private static void testHasObjectAccessWithCustomObjectsAsReadOnlyUser() {
        System.runAs(TestUtil.getTestUser()) {
            Boolean canCreateProgram = PermissionValidator.getInstance()
                .hasObjectAccess(
                    Program__c.SObjectType,
                    PermissionValidator.CRUDAccessType.CREATEABLE
                );
            System.assert(
                !canCreateProgram,
                'Has no Create perms on Program, expect false'
            );

            Boolean canReadProgram = PermissionValidator.getInstance()
                .hasObjectAccess(
                    Program__c.SObjectType,
                    PermissionValidator.CRUDAccessType.READABLE
                );
            System.assert(!canReadProgram, 'Has no Read perms on Program, expect false');

            Boolean canUpdateProgram = PermissionValidator.getInstance()
                .hasObjectAccess(
                    Program__c.SObjectType,
                    PermissionValidator.CRUDAccessType.UPDATEABLE
                );
            System.assert(
                !canUpdateProgram,
                'Has no Update perms on Program, expect false'
            );

            Boolean canDeleteProgram = PermissionValidator.getInstance()
                .hasObjectAccess(
                    Program__c.SObjectType,
                    PermissionValidator.CRUDAccessType.DELETEABLE
                );
            System.assert(
                !canDeleteProgram,
                'Has no Delete perms on Program, expect false'
            );
        }
    }

    @IsTest
    private static void testHasObjectAccessWithNullSObjectType() {
        Boolean nullSObjectType = PermissionValidator.getInstance()
            .hasObjectAccess(null, PermissionValidator.CRUDAccessType.READABLE);
        System.assert(!nullSObjectType, 'Null SObjectType, expect false');
    }

    @IsTest
    private static void testHasObjectAccessWithNullCRUDAccessType() {
        Boolean nullCRUDAccessType = PermissionValidator.getInstance()
            .hasObjectAccess(Contact.SObjectType, null);
        System.assert(!nullCRUDAccessType, 'Null CRUDAccessType, expect false');
    }
}
