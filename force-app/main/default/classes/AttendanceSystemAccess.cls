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
public without sharing class AttendanceSystemAccess {
    private QueryBuilder queryBuilder = new QueryBuilder();

    public List<ServiceDelivery__c> getAttendanceRecords(
        SObjectField field,
        Set<Id> recordIds,
        List<String> statuses
    ) {
        queryBuilder
            .reset()
            .withSelectFields(
                new List<String>{
                    String.valueOf(field),
                    String.valueOf(ServiceDelivery__c.AttendanceStatus__c),
                    String.valueOf(ServiceDelivery__c.DeliveryDate__c)
                }
            )
            .withSObjectType(ServiceDelivery__c.SObjectType)
            .addCondition(String.valueOf(field) + ' IN :recordIds')
            .addCondition(
                String.valueOf(ServiceDelivery__c.AttendanceStatus__c) + ' IN :statuses'
            )
            .withOrderBy(
                String.valueOf(field) +
                ', ' +
                String.valueOf(ServiceDelivery__c.DeliveryDate__c) +
                ' DESC'
            );

        return Database.query(queryBuilder.buildSoqlQuery());
    }

    public void updateRecords(List<SObject> sObjects) {
        update sObjects;
    }
}
