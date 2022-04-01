/*
 *
 *  * Copyright (c) 2022, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class FieldBucketSelector {
    // Custom metadata buckets are used to determine groupings of other fields
    // similar to IsWon or IsClosed in an Opportunity. This data is consumed by
    // our components and not the end user.
    /* sfca-disable-stack ApexFlsViolationRule */
    public List<Bucket__mdt> getBuckets(
        List<String> bucketNames,
        Schema.SObjectType objectType,
        Schema.SObjectField bucketedField
    ) {
        // Note: there doesn't seem to be a way to get the subquery with .getAll() so I think we're stuck
        // with SOQL for this layer.

        String sObjectApiName = objectType.getDescribe().getName();
        String bucketedFieldApiName = bucketedField.getDescribe().getName();

        List<Bucket__mdt> matchingBucketsOnObject = [
            SELECT
                Id,
                DeveloperName,
                BucketedField__r.Field__r.QualifiedApiName,
                BucketedField__r.Object__r.QualifiedApiName,
                QualifiedApiName,
                (SELECT Id, Value__c FROM BucketedValues__r)
            FROM Bucket__mdt
            WHERE
                DeveloperName IN :bucketNames
                AND NamespacePrefix = :Util.getNamespace()
                AND BucketedField__r.Object__r.QualifiedApiName = :sObjectApiName
            ORDER BY QualifiedApiName
        ];

        List<Bucket__mdt> matchingBucketsOnFieldAndObject = new List<Bucket__mdt>();

        // At the time of writing, attempting to include 'BucketedField__r.Field__r.QualifiedApiName'
        // in the WHERE clause caused an Internal Server Error. As a workaround, testing manually
        // here in the for loop.

        for (Bucket__mdt bucket : matchingBucketsOnObject) {
            if (
                bucket.BucketedField__r.Field__r.QualifiedApiName == bucketedFieldApiName
            ) {
                matchingBucketsOnFieldAndObject.add(bucket);
            }
        }

        return matchingBucketsOnFieldAndObject;
    }
}
