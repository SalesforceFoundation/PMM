/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class Finder_TEST {
    private static BasicStub queryBuilderStub = new BasicStub(QueryBuilder.class)
        .withReturnValue('buildCountQuery', 'SELECT count() FROM Account')
        .withReturnValue('buildSoqlQuery', 'SELECT Id, Name FROM Account');
    private static QueryBuilder queryBuilder = (QueryBuilder) queryBuilderStub.createMock();

    @IsTest
    private static void shouldReturnZeroWhenNoRecordsFound() {
        Test.startTest();
        Integer count = new Finder(queryBuilder).findCount();
        Test.stopTest();

        System.assertEquals(0, count, 'Expected no records to be found.');
        queryBuilderStub.assertCalled('buildCountQuery');
        queryBuilderStub.assertNotCalled('buildSoqlQuery');
    }

    @IsTest
    private static void shouldReturnCountOfRecordsFound() {
        List<Account> accounts = new List<Account>{ new Account(Name = 'Find Count') };
        insert accounts;

        Test.startTest();
        Integer count = new Finder(queryBuilder).findCount();
        Test.stopTest();

        System.assertEquals(accounts.size(), count, 'Expected all accounts to be found.');
        queryBuilderStub.assertCalled('buildCountQuery');
        queryBuilderStub.assertNotCalled('buildSoqlQuery');
    }

    @IsTest
    private static void shouldReturnAnEmptyListWhenNoRecordsAreFound() {
        Test.startTest();
        List<SObject> records = new Finder(queryBuilder).findRecords();
        Test.stopTest();

        System.assertEquals(
            0,
            records.size(),
            'Did not expect any records to be returned.'
        );

        queryBuilderStub.assertCalled('buildSoqlQuery');
        queryBuilderStub.assertNotCalled('buildCountQuery');
    }

    @IsTest
    private static void shouldReturnFoundRecords() {
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

        queryBuilderStub.assertCalled('buildSoqlQuery');
        queryBuilderStub.assertNotCalled('buildCountQuery');
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
}
