public inherited sharing class Finder {
    private QueryBuilder queryBuilder;

    public Finder(QueryBuilder queryBuilder) {
        this.queryBuilder = queryBuilder;
    }

    public Integer findCount() {
        if (queryBuilder == null) {
            return null;
        }

        return Database.countQuery(queryBuilder.buildCountQuery());
    }

    public List<SObject> findRecords() {
        if (queryBuilder == null) {
            return null;
        }

        return Database.query(queryBuilder.buildSoqlQuery());
    }
}
