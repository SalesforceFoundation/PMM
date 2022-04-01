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
    private Set<String> activeStages {
        get {
            if (activeStages == null) {
                activeStages = getActiveStages();
            }
            return activeStages;
        }
        set;
    }

    public Set<String> getActiveStages() {
        List<String> bucketNames = new List<String>{ 'Active' };
        Set<String> activeStages = new Set<String>();

        Schema.SObjectType programEngagementSObjType = ProgramEngagement__c.SObjectType;
        Schema.SObjectField stageField = ProgramEngagement__c.Stage__c;

        for (
            Bucket__mdt bucket : bucketSelector.getBuckets(
                bucketNames,
                programEngagementSObjType,
                stageField
            )
        ) {
            for (BucketedValue__mdt value : bucket.BucketedValues__r) {
                activeStages.add(value.Value__c);
            }
        }

        return activeStages;
    }
}
