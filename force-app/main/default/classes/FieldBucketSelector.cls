/*
 *
 *  * Copyright (c) 2022, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class FieldBucketSelector {

    public List<Bucket__mdt> getBuckets(List<String> bucketNames) {
        // Note: there doesn't seem to be a way to get the subquery with .getAll() so I think we're stuck
        // with SOQL for this layer.
        return [
            SELECT
                Id,
                DeveloperName,
                BucketedField__r.Field__r.QualifiedApiName,
                BucketedField__r.Object__r.QualifiedApiName,
                QualifiedApiName,
                (SELECT Id, Value__c FROM BucketedValues__r)
            FROM Bucket__mdt
            WHERE DeveloperName IN :bucketNames AND NamespacePrefix = :Util.getNamespace()
            ORDER BY QualifiedApiName
        ];
    }

    public List<Bucket__mdt> getBuckets(List<String> bucketNames, Schema.SObjectType objectType, Schema.SObjectField bucketedField) {
        // Note: there doesn't seem to be a way to get the subquery with .getAll() so I think we're stuck
        // with SOQL for this layer.

        String sObjectAPIName = objectType.getDescribe().getName();
        String bucketedFieldAPIName = bucketedField.getDescribe().getLocalName();

        return [
            SELECT
            Id,
            DeveloperName,
            BucketedField__r.Field__r.QualifiedApiName,
            BucketedField__r.Object__r.QualifiedApiName,
            QualifiedApiName,
            (SELECT Id, Value__c FROM BucketedValues__r)
            FROM Bucket__mdt
            WHERE DeveloperName IN :bucketNames 
                AND NamespacePrefix = :Util.getNamespace()
                AND BucketedField__r.Object__r.QualifiedApiName = :sObjectAPIName
                //AND BucketedField__r.Field__r.QualifiedApiName = :bucketedFieldAPIName
            ORDER BY QualifiedApiName
        ];
    }    
}
