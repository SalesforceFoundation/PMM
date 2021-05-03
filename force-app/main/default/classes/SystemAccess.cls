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

    public String getDeliveryRollupsQuery(
        String lookupField,
        List<String> attendanceStatuses
    ) {
        return buildDeliveryRollupsQuery(lookupField, ' != null', attendanceStatuses);
    }

    public Integer getDeliveryRollupsCount(
        String lookupField,
        Id recordId,
        List<String> attendanceStatuses
    ) {
        setDeliveryRollupQueryBuilder(lookupField, ' = :recordId', attendanceStatuses);

        return Database.countQuery(queryBuilder.buildCountQuery());
    }

    public List<ServiceDelivery__c> getDeliveryRecordsToRollup(
        String lookupField,
        Set<Id> recordIds,
        List<String> attendanceStatuses
    ) {
        String query = buildDeliveryRollupsQuery(
            String.valueOf(lookupField),
            ' IN: recordIds',
            attendanceStatuses
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
        String lookupFieldCondition,
        List<String> attendanceStatuses
    ) {
        setDeliveryRollupQueryBuilder(
            lookupField,
            lookupFieldCondition,
            attendanceStatuses
        );
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
        String lookupFieldCondition,
        List<String> attendanceStatuses
    ) {
        String condition = lookupField + lookupFieldCondition + ' AND (';

        queryBuilder
            .reset()
            .withSObjectType(ServiceDelivery__c.SObjectType)
            .addCondition(
                condition +
                String.valueOf(ServiceDelivery__c.AttendanceStatus__c) +
                ' IN (\'' +
                String.join(attendanceStatuses, '\',\'') +
                '\') OR ( ' +
                String.valueOF(ServiceDelivery__c.Quantity__c) +
                ' > 0 AND ' +
                String.valueOf(ServiceDelivery__c.DeliveryDate__c) +
                ' != null ))'
            )
            .withOrderBy(
                lookupField +
                ', ' +
                String.valueOf(ServiceDelivery__c.DeliveryDate__c) +
                ' ASC '
            );

        return queryBuilder;
    }
}
