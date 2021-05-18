/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

/*
 * We must bypass sharing in order to rollup all detail records to the parent entity.
 */
public without sharing class SystemAccess {
    private QueryBuilder queryBuilder = new QueryBuilder();

    public String getDeliveryRollupsQuery(String lookupField) {
        return buildDeliveryRollupsQuery(lookupField, ' != null');
    }

    public Integer getDeliveryRollupsCount(String lookupField, Id recordId) {
        setDeliveryRollupQueryBuilder(lookupField, ' = :recordId');

        return Database.countQuery(queryBuilder.buildCountQuery());
    }

    public List<SObject> getParentsWithDeliveries(
        SObjectType sObjectType,
        String lookupField,
        List<SObject> records
    ) {
        // Find all records that have service delivery child records e.g.
        // SELECT Id FROM Contact where Id in (SELECT Contact FROM ServiceDelivery__c
        // WHERE Contact IN :records)
        String query = queryBuilder
            .reset()
            .withSObjectType(sObjectType)
            .withSelectFields(new List<String>{ 'Id' })
            .addCondition(
                'Id IN (SELECT ' +
                lookupField +
                ' FROM ' +
                String.valueOf(ServiceDelivery__c.SObjectType) +
                ' WHERE ' +
                lookupField +
                ' IN :records)'
            )
            .buildSoqlQuery();

        return Database.query(query);
    }

    public List<ServiceDelivery__c> getDeliveryRecordsToRollup(
        String lookupField,
        Set<Id> recordIds
    ) {
        String query = buildDeliveryRollupsQuery(
            String.valueOf(lookupField),
            ' IN: recordIds'
        );
        return Database.query(query);
    }

    public List<SObject> getRecordsById(
        sObjectType sObjectType,
        Set<Id> recordIds,
        List<String> selectFields
    ) {
        return Database.query(
            queryBuilder
                .reset()
                .withSObjectType(sObjectType)
                .withSelectFields(selectFields)
                .addCondition('Id IN :recordIds')
                .buildSoqlQuery()
        );
    }

    public void updateRecords(List<SObject> sObjects) {
        update sObjects;
    }

    private String buildDeliveryRollupsQuery(
        String lookupField,
        String lookupFieldCondition
    ) {
        setDeliveryRollupQueryBuilder(lookupField, lookupFieldCondition);
        queryBuilder
            .withSelectFields(
                new List<String>{
                    String.valueOf(ServiceDelivery__c.AttendanceStatus__c),
                    String.valueOf(ServiceDelivery__c.DeliveryDate__c),
                    String.valueOf(lookupField),
                    String.valueOf(ServiceDelivery__c.Quantity__c)
                }
            );

        return queryBuilder.buildSoqlQuery();
    }

    private QueryBuilder setDeliveryRollupQueryBuilder(
        String lookupField,
        String lookupFieldCondition
    ) {
        String condition = lookupField + lookupFieldCondition;

        queryBuilder
            .reset()
            .withSObjectType(ServiceDelivery__c.SObjectType)
            .addCondition(lookupField + lookupFieldCondition)
            .withOrderBy(
                lookupField +
                ', ' +
                String.valueOf(ServiceDelivery__c.DeliveryDate__c) +
                ' ASC '
            );

        return queryBuilder;
    }
}
