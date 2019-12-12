/**
    Hard deletes sample Accounts and Contacts:
        - Contacts whose Name is "Sample Contact" and Account is "Contact Household"
        - Accounts whose Name is "Contact Household" or "Sample Organization"
 */

{
    List<Contact> contacts = [
        SELECT Id
        FROM Contact
        WHERE Name = 'Sample Contact'
        AND Account.Name = 'Contact Household'
    ];
    if (!contacts.isEmpty()) {
        Database.delete(contacts);
        Database.emptyRecycleBin(contacts);
    }
}

{
    List<Account> records = [
        SELECT Id
        FROM Account
        WHERE Name IN ('Contact Household', 'Sample Organization')
    ];
    if (!records.isEmpty()) {
        Database.delete(records);
        Database.emptyRecycleBin(records);
    }
}
