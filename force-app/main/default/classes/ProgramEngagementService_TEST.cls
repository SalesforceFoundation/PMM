/*
 *
 *  * Copyright (c) 2022, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class ProgramEngagementService_TEST {
    private static TestStub bucketSelectorStub;

    private static ProgramEngagementService service = new ProgramEngagementService();

    @IsTest
    private static void shouldGetActiveStages() {
        List<String> bucketNames = new List<String>{ 'Active' };

        String stageFieldApiName = Util.prefixNamespace('Stage__c');

        Schema.SObjectType programEngagementSObjType = ProgramEngagement__c.SObjectType;
        Schema.SObjectField stageField = Schema.SObjectType.ProgramEngagement__c.fields.getMap()
            .get(stageFieldApiName);

        Set<String> stagesToReturn = new Set<String>{ 'Active', 'Enrolled' };

        Test.startTest();
        Set<String> returnedStages = service.ActiveStages;
        Test.stopTest();

        for (String stageName : stagesToReturn) {
            System.assert(
                returnedStages.contains(stageName),
                'Expected the stage ' +
                stageName +
                ' to be returned.'
            );
        }
    }
}
