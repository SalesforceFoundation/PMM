/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public inherited sharing class QueryBuilder {
    private String entity;
    private List<String> selectFields = new List<String>();
    private List<String> conditions = new List<String>();
    private String orderByField;
    private Integer limitTo;
    private List<QueryBuilder> subqueries = new List<QueryBuilder>();
    private static final String AND_OPERATOR = ' AND ';

    public QueryBuilder withSObjectType(SObjectType sObjectType) {
        entity = sObjectType.getDescribe().getName();
        return this;
    }

    public QueryBuilder withChildRelationshipName(String childRelationshipName) {
        entity = childRelationshipName;
        return this;
    }

    public QueryBuilder addSubQuery(QueryBuilder subquery) {
        subqueries.add(subquery);
        return this;
    }

    public QueryBuilder withSelectFields(List<String> fieldNames) {
        if (fieldNames != null) {
            this.selectFields.addAll(fieldNames);
        }

        return this;
    }

    public QueryBuilder withSelectFields(FieldSet fieldSet) {
        for (Schema.FieldSetMember f : fieldSet.getFields()) {
            this.selectFields.add(f.getFieldPath());
        }

        return this;
    }

    public QueryBuilder addCondition(String condition) {
        conditions.add(condition);
        return this;
    }

    public QueryBuilder withOrderBy(String orderByField) {
        this.orderByField = orderByField;
        return this;
    }

    public QueryBuilder withLimit(Integer limitTo) {
        this.limitTo = limitTo;
        return this;
    }

    public String buildSoqlQuery() {
        return String.format(
            'SELECT {0} FROM {1}{2}{3}{4}',
            new List<String>{
                buildSelectFields(),
                entity,
                buildWhereClause(),
                buildOrderBy(),
                buildLimit()
            }
        );
    }

    public String buildCountQuery() {
        validate();

        return String.format(
            'SELECT count() FROM {0}{1}',
            new List<String>{ entity, buildWhereClause() }
        );
    }

    public QueryBuilder reset() {
        entity = null;
        subqueries = new List<QueryBuilder>();
        selectFields = new List<String>();
        conditions = new List<String>();
        orderByField = null;
        limitTo = null;
        return this;
    }

    private String buildSelectFields() {
        validate();

        Set<String> fields = new Set<String>();

        if (selectFields == null || selectFields.isEmpty()) {
            fields.add('id');
        } else {
            for (String field : selectFields) {
                fields.add(field.toLowerCase());
            }
        }

        for (QueryBuilder subquery : subqueries) {
            fields.add('(' + subquery.buildSoqlQuery() + ')');
        }

        return String.join(new List<String>(fields), ', ');
    }

    private void validate() {
        if (entity == null) {
            throw new QueryBuilderException(System.Label.MissingSObjectType);
        }
    }

    private String buildWhereClause() {
        if (conditions.isEmpty()) {
            return '';
        }

        String soqlWhere = '';

        for (String condition : conditions) {
            if (String.isBlank(condition)) {
                continue;
            }

            soqlWhere += String.isBlank(soqlWhere) ? '' : AND_OPERATOR;
            soqlWhere += condition;
        }

        return String.isBlank(soqlWhere) ? '' : ' WHERE ' + soqlWhere;
    }

    private String buildOrderBy() {
        if (String.isEmpty(orderByField)) {
            return '';
        }

        return ' ORDER BY ' + orderByField;
    }

    private String buildLimit() {
        if (limitTo == null || limitTo < 1) {
            return '';
        }

        return ' LIMIT ' + limitTo;
    }

    public class QueryBuilderException extends Exception {
    }
}
