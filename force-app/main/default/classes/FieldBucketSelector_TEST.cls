/*
 *
 *  * Copyright (c) 2022, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class FieldBucketSelector_TEST {
    private static FieldBucketSelector bucketSelector = new FieldBucketSelector();

    @IsTest
    private static void getAttendanceBucketsReturnsPackagedBuckets() {
        List<String> bucketNames = new List<String>{ 'Absent', 'Present' };

        Schema.SObjectType serviceDeliverySObjType = ServiceDelivery__c.SObjectType;
        Schema.SObjectField statusField = ServiceDelivery__c.AttendanceStatus__c;

        List<Bucket__mdt> buckets = bucketSelector.getBuckets(
            bucketNames,
            serviceDeliverySObjType,
            statusField
        );

        System.assertEquals(
            2,
            buckets.size(),
            'Expected the 2 packaged attendance records to be returned.'
        );
        System.assertEquals(
            bucketNames[0],
            buckets[0].DeveloperName,
            'Expected the Absent bucket to be returned first.'
        );
        System.assertEquals(
            bucketNames[1],
            buckets[1].DeveloperName,
            'Expected the Present bucket to be returned second.'
        );
    }
}
