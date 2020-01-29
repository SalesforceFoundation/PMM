// Overwrite AccountNumber to be a unique combination of RecordType.DeveloperName, Name, unique Integer
final List<Account> allAccounts = [
    SELECT Id, Name, RecordType.DeveloperName
    FROM Account
    ORDER BY Id
];

Map<String, Map<String, List<Account>>> accountsByNameByRecordType = new Map<String, Map<String, List<Account>>>();

for (Account account : allAccounts) {
    Map<String, List<Account>> accountsByName = accountsByNameByRecordType.get(account.RecordType.DeveloperName);
    if (accountsByName == null) {
        accountsByName = new Map<String, List<Account>>();
        accountsByNameByRecordType.put(account.RecordType.DeveloperName, accountsByName);
    }

    List<Account> accounts = accountsByName.get(account.Name);
    if (accounts == null) {
        accounts = new List<Account>();
        accountsByName.put(account.Name, accounts);
    }

    accounts.add(account);
}

for (String recordType : accountsByNameByRecordType.keySet()) {
    for (String accountName : accountsByNameByRecordType.get(recordType).keySet()) {
        final List<Account> accounts = accountsByNameByRecordType.get(recordType).get(accountName);
        final Integer size = accounts.size();
        for (Integer i = 0; i < size; i ++) {
            accounts[i].Site = String.format(
                '{0}:{1}:{2}',
                new List<String> {
                    recordType,
                    accountName,
                    String.valueOf(i)
                }
            );
        }
    }
}

update allAccounts;