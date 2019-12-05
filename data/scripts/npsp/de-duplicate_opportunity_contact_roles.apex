
class Helper {

    public String getHash(OpportunityContactRole a) {
        if (a == null) {
            return null;
        }
        return String.join(
            new List<Object> {
                a.Role,
                a.IsPrimary,
                a.ContactId,
                a.OpportunityId
            },
            '|'
        );   
    }

}

final Helper helper = new Helper();

List<Id> idsToDelete = new List<Id>();

for (Opportunity opportunity : [
    SELECT
        Id,
        (
            SELECT
                Id,
                Role,
                IsPrimary,
                ContactId,
                OpportunityId
            FROM OpportunityContactRoles
        )
    FROM Opportunity
]) {
    Map<String, Id> idsByHash = new Map<String, Id>();
    for (OpportunityContactRole role : opportunity.OpportunityContactRoles) {
        final String hash = helper.getHash(role);
        if (idsByHash.get(hash) == null) {
            idsByHash.put(hash, role.Id);
        }
        else {
            idsToDelete.add(role.Id);
        }
    }
}

if (!idsToDelete.isEmpty()) {
    Database.delete(idsToDelete);
    Database.emptyRecycleBin(idsToDelete);
}
