/*
 *
 *  * Copyright (c) 2022, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ProgramEngagementService {
    @TestVisible
    private FieldBucketSelector bucketSelector = new FieldBucketSelector();

    @TestVisible
    private Set<String> activeOrEnrolledStages {
        get {
            if (activeOrEnrolledStages == null) {
                activeOrEnrolledStages = getActiveOrEnrolledStages();
            }
            return activeOrEnrolledStages;
        }
        set;
    }

    public Set<String> getActiveOrEnrolledStages() {
        List<String> bucketNames = new List<String>{ 'ActiveOrEnrolled' };
        Set<String> activeOrEnrolledStages = new Set<String>();

        Schema.SObjectType programEngagementSObjType = ProgramEngagement__c.SObjectType;
        Schema.SObjectField stageField = Schema.SObjectType.ProgramEngagement__c.fields.getMap()
            .get('Stage__c');

        for (
            Bucket__mdt bucket : bucketSelector.getBuckets(
                bucketNames,
                programEngagementSObjType,
                stageField
            )
        ) {
            for (BucketedValue__mdt value : bucket.BucketedValues__r) {
                activeOrEnrolledStages.add(value.Value__c);
            }
        }

        return activeOrEnrolledStages;
    }
}
