/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class QueryBuilder_TEST {
    @IsTest
    private static void shouldBuildCountQuery() {
        final String expectedCountQuery = 'SELECT count() FROM Account';
        final String actualCountQuery = new QueryBuilder()
            .withSObjectType(Account.SObjectType)
            .buildCountQuery();

        System.assertEquals(
            expectedCountQuery,
            actualCountQuery,
            'The count query string was not as expected.'
        );
    }

    @IsTest
    private static void shouldBuildCountQueryWithWhereClause() {
        final String condition = 'Name = \'Test Account\'';
        final String expectedCountQuery =
            'SELECT count() FROM Account WHERE ' + condition;
        final String actualCountQuery = new QueryBuilder()
            .withSObjectType(Account.SObjectType)
            .addCondition(condition)
            .buildCountQuery();

        System.assertEquals(
            expectedCountQuery,
            actualCountQuery,
            'The count query string with a where clause was not as expected.'
        );
    }

    @IsTest
    private static void shouldBuildSoqlQueryWithFields() {
        final List<String> fields = new List<String>{
            String.valueOf(Account.Id),
            String.valueOf(Account.Name)
        };
        final String expectedSoqlQuery = 'SELECT id, name FROM Account';
        final String actualSoqlQuery = new QueryBuilder()
            .withSObjectType(Account.SObjectType)
            .withSelectFields(fields)
            .buildSoqlQuery();

        System.assertEquals(
            expectedSoqlQuery,
            actualSoqlQuery,
            'The soql query string was not as expected.'
        );
    }

    @IsTest
    private static void shouldBuildSoqlQueryWithIdWhenWithoutFields() {
        final List<String> fields = new List<String>{ String.valueOf(Account.Id) };
        final String expectedSoqlQuery = 'SELECT id FROM Account';
        final String actualSoqlQuery = new QueryBuilder()
            .withSObjectType(Account.SObjectType)
            .buildSoqlQuery();

        System.assertEquals(
            expectedSoqlQuery,
            actualSoqlQuery,
            'The soql query string without fields was not as expected.'
        );
    }

    @IsTest
    private static void shouldBuildSoqlQueryWithWhereClause() {
        final List<String> fields = new List<String>{
            String.valueOf(Account.Id),
            String.valueOf(Account.Name)
        };
        final String condition = 'Name = \'Test Account\'';
        final String expectedSoqlQuery =
            'SELECT id, name FROM Account WHERE ' + condition;
        final String actualSoqlQuery = new QueryBuilder()
            .withSObjectType(Account.SObjectType)
            .withSelectFields(fields)
            .addCondition(condition)
            .buildSoqlQuery();

        System.assertEquals(
            expectedSoqlQuery,
            actualSoqlQuery,
            'The soql query string with where clause was not as expected.'
        );
    }

    @IsTest
    private static void shouldBuildSoqlQueryWithOrderBy() {
        final String expectedSoqlQuery = 'SELECT id FROM Account ORDER BY Id';
        final String actualSoqlQuery = new QueryBuilder()
            .withSObjectType(Account.SObjectType)
            .withOrderBy('Id')
            .buildSoqlQuery();

        System.assertEquals(
            expectedSoqlQuery,
            actualSoqlQuery,
            'The soql query string with the order by was not as expected.'
        );
    }

    @IsTest
    private static void shouldBuildSoqlQueryWithLimit() {
        final String expectedSoqlQuery = 'SELECT id FROM Account LIMIT 1';
        final String actualSoqlQuery = new QueryBuilder()
            .withSObjectType(Account.SObjectType)
            .withLimit(1)
            .buildSoqlQuery();

        System.assertEquals(
            expectedSoqlQuery,
            actualSoqlQuery,
            'The soql query string with limit was not as expected.'
        );
    }

    @IsTest
    private static void shouldNotAddWhereClauseForEmptyCondition() {
        final String expectedSoqlQuery = 'SELECT id FROM Account';
        final String actualSoqlQuery = new QueryBuilder()
            .withSObjectType(Account.SObjectType)
            .addCondition('')
            .buildSoqlQuery();

        System.assertEquals(
            expectedSoqlQuery,
            actualSoqlQuery,
            'The soql query string with a blank condition was not as expected.'
        );
    }

    @IsTest
    private static void throwsExceptionWhenSObjectTypeIsMissing() {
        final String expectedException = System.Label.MissingSObjectType;
        String actualException;
        try {
            new QueryBuilder().buildCountQuery();
        } catch (Exception ex) {
            actualException = ex.getMessage();
        }

        System.assertEquals(
            expectedException,
            actualException,
            'Expected the exception message to be thrown.'
        );
    }
}
