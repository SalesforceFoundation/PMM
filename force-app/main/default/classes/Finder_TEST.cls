@IsTest
public with sharing class Finder_TEST {
    private static QueryBuilder_Test.BuildCountQuery buildCountQueryMethod;
    private static Stub queryBuilderStub;
    private static QueryBuilder queryBuilder;

    @IsTest
    private static void shouldReturnZeroWhenNoRecordsFound() {
        setupQueryBuilderStub();
        Integer count = new Finder(queryBuilder).findCount();

        System.assertEquals(0, count, 'Expected no records to be found.');
        queryBuilderStub.assertMethodsCalled();
    }

    @IsTest
    private static void shouldReturnCountOfRecordsFound() {
        setupQueryBuilderStub();
        List<Account> accounts = new List<Account>{
            new Account(Name = 'Does not matter')
        };
        insert accounts;

        Integer count = new Finder(queryBuilder).findCount();

        System.assertEquals(accounts.size(), count, 'Expected all accounts to be found.');
        queryBuilderStub.assertMethodsCalled();
    }

    // ----------     Helper Methods     ---------- //
    private static void setupQueryBuilderStub() {
        buildCountQueryMethod = new QueryBuilder_Test.BuildCountQuery();
        buildCountQueryMethod.returnValue = 'SELECT count() FROM Account';
        queryBuilderStub = new Stub(new List<Stub.Method>{ buildCountQueryMethod });

        queryBuilder = (QueryBuilder) Test.createStub(
            QueryBuilder.class,
            queryBuilderStub
        );
    }

    // ----------     Method Stubs     ---------- //
    public class FindCount extends Stub.Method {
        public Integer returnValue;

        public FindCount() {
            super(Finder.class, Integer.class, 'findCount', new List<Stub.Parameter>{});
        }

        public override Boolean isInstanceOf(Object instance) {
            return instance instanceof Finder;
        }

        public override List<Object> getExpectedArguments() {
            return new List<Object>{};
        }

        public override Object getReturnValue() {
            return this.returnValue;
        }
    }

    public class FindRecords extends Stub.Method {
        public List<SObject> returnValue;

        public FindRecords() {
            super(
                Finder.class,
                List<SObject>.class,
                'findRecords',
                new List<Stub.Parameter>{}
            );
        }

        public override Boolean isInstanceOf(Object instance) {
            return instance instanceof Finder;
        }

        public override List<Object> getExpectedArguments() {
            return new List<Object>{};
        }

        public override Object getReturnValue() {
            return this.returnValue;
        }
    }
}
