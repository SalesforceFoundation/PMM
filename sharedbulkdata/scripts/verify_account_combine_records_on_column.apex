
// Update Accounts without AccountNumber
{
    List<Account> records = [SELECT Id, Name FROM Account WHERE AccountNumber = null];

    final Integer length = Schema.SObjectType.Account.fields.AccountNumber.getLength();

    for (Account account : records) {
        account.AccountNumber = account.Name.left(length);
    }

    update records;
}

// Verify AccountNumbers are unique
class DuplicateAccountNumberException extends Exception {
}
{
    final List<String> duplicates = new List<String>();
    for (Schema.AggregateResult result : [
        SELECT COUNT(Id) records, AccountNumber
        FROM Account
        WHERE AccountNumber != null
        GROUP BY AccountNumber HAVING Count(Id) > 1
    ]) {
        duplicates.add(
            String.format(
                '"{0}" used {1} times',
                new List<String>{
                    String.valueOf(result.get('AccountNumber')),
                    String.valueOf(result.get('records'))
                }
            )
        );
    }
    if (!duplicates.isEmpty()) {
        throw new DuplicateAccountNumberException(
            String.format(
                'Storytelling data combines Account records on "AccountNumber".  The following AccountNumbers are used more than once: {0}',
                new List<String>{ String.join(duplicates, '; ') }
            )
        );
    }
}
