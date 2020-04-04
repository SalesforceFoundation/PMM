@IsTest
public with sharing class Finder_TEST {
    private static QueryBuilder_Test.BuildCountQuery buildCountQueryMethod;
    private static QueryBuilder_Test.BuildSoqlQuery buildSoqlQueryMethod;
    private static Stub queryBuilderStub;
    private static QueryBuilder queryBuilder;

    @IsTest
    private static void shouldReturnZeroWhenNoRecordsFound() {
        setupQueryBuilderCountStub();

        Test.startTest();
        Integer count = new Finder(queryBuilder).findCount();
        Test.stopTest();

        System.assertEquals(0, count, 'Expected no records to be found.');
        queryBuilderStub.assertMethodsCalled();
    }

    @IsTest
    private static void shouldReturnCountOfRecordsFound() {
        setupQueryBuilderCountStub();
        List<Account> accounts = new List<Account>{ new Account(Name = 'Find Count') };
        insert accounts;

        Test.startTest();
        Integer count = new Finder(queryBuilder).findCount();
        Test.stopTest();

        System.assertEquals(accounts.size(), count, 'Expected all accounts to be found.');
        queryBuilderStub.assertMethodsCalled();
    }

    @IsTest
    private static void shouldReturnAnEmptyListWhenNoRecordsAreFound() {
        setupQueryBuilderSoqlStub();

        Test.startTest();
        List<SObject> records = new Finder(queryBuilder).findRecords();
        Test.stopTest();

        System.assertEquals(
            0,
            records.size(),
            'Did not expect any records to be returned.'
        );
        queryBuilderStub.assertMethodsCalled();
    }

    @IsTest
    private static void shouldReturnFoundRecords() {
        setupQueryBuilderSoqlStub();
        List<Account> accounts = new List<Account>{ new Account(Name = 'Find Records') };
        insert accounts;

        Test.startTest();
        List<SObject> records = new Finder(queryBuilder).findRecords();
        Test.stopTest();

        System.assertEquals(
            accounts.size(),
            records.size(),
            'Expected all accounts to be returned.'
        );
        queryBuilderStub.assertMethodsCalled();
    }

    @IsTest
    private static void shouldReturnNullCountWhenQueryBuilderIsNotProvided() {
        Test.startTest();
        Finder finder = new Finder(null);
        Test.stopTest();

        System.assertEquals(
            null,
            finder.findCount(),
            'Expected find count to return null without a Query Builder'
        );
    }

    @IsTest
    private static void shouldReturnNullRecordsWhenQueryBuilderIsNotProvided() {
        Test.startTest();
        Finder finder = new Finder(null);
        Test.stopTest();

        System.assertEquals(
            null,
            finder.findRecords(),
            'Expected find records to return null without a Query Builder'
        );
    }

    // ----------     Helper Methods     ---------- //
    private static void setupQueryBuilderCountStub() {
        buildCountQueryMethod = new QueryBuilder_Test.BuildCountQuery();
        buildCountQueryMethod.returnValue = 'SELECT count() FROM Account';
        queryBuilderStub = new Stub(new List<Stub.Method>{ buildCountQueryMethod });

        queryBuilder = (QueryBuilder) Test.createStub(
            QueryBuilder.class,
            queryBuilderStub
        );
    }

    private static void setupQueryBuilderSoqlStub() {
        buildSoqlQueryMethod = new QueryBuilder_Test.BuildSoqlQuery();
        buildSoqlQueryMethod.returnValue = 'SELECT Id FROM Account';
        queryBuilderStub = new Stub(new List<Stub.Method>{ buildSoqlQueryMethod });

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
