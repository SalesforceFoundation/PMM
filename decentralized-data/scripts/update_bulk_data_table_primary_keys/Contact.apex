
// Create emails for all Contacts with blank Email
{
    final List<Contact> contacts = [
        SELECT FirstName, LastName
        FROM Contact
        WHERE Email = null
    ];
    for (Contact contact : contacts) {
        contact.Email = String.format(
            '{0}{1}@example.com',
            new List<String> {
                String.isBlank(contact.FirstName) ? '' : contact.FirstName.toLowerCase() + '.',
                contact.LastName.toLowerCase()
            }
        );
    }
    update contacts;
}

// Make Emails unique
final List<Contact> allContacts = [
    SELECT Id, Email
    FROM Contact
    ORDER BY Id
];

Map<String, List<Contact>> contactsByEmail = new Map<String, List<Contact>>();

for (Contact contact : allContacts) {

    List<Contact> contacts = contactsByEmail.get(contact.Email);
    if (contacts == null) {
        contacts = new List<Contact>();
        contactsByEmail.put(contact.Email, contacts);
    }

    contacts.add(contact);
}

final List<Contact> contactsToUpdate = new List<Contact>();
for (String email : contactsByEmail.keyset()) {
    final List<Contact> contacts = contactsByEmail.get(email);
    final Integer size = contacts.size();
    
    if (1 < size) {
        final List<String> emails = email.split('@');

        for (Integer i = 0; i < size; i ++) {
            contacts[i].Email = String.format(
                '{0}+{1}@{2}',
                new List<String> {
                    emails[0],
                    String.valueOf(i),
                    emails[1]
                }
            );

            contactsToUpdate.add(contacts[i]);
        }
    }
}

update contactsToUpdate;