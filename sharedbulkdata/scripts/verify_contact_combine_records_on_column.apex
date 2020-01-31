
// Verify Emails are unique
class DuplicateEmailException extends Exception {
}

final List<String> duplicates = new List<String>();
for (Schema.AggregateResult result : [
    SELECT COUNT(Id) records, Email
    FROM Contact
    WHERE Email != null
    GROUP BY Email HAVING Count(Id) > 1
]) {
    duplicates.add(
        String.format(
            '"{0}" used {1} times',
            new List<String>{
                String.valueOf(result.get('Email')),
                String.valueOf(result.get('records'))
            }
        )
    );
}
if (!duplicates.isEmpty()) {
    throw new DuplicateEmailException(
        String.format(
            'Storytelling data combines Contact records on "Email".  The following Emails are used more than once: {0}',
            new List<String>{ String.join(duplicates, '; ') }
        )
    );
}
