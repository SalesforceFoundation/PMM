/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@isTest
public with sharing class ProgramService_TEST {
    @isTest
    private static void testGetProgramNamesByIdForContact() {
        Id contactId = TestUtil.mockId(Contact.SObjectType);

        Program__c program1 = new Program__c();
        program1.Id = TestUtil.mockId(Program__c.SObjectType);
        program1.Name = 'Program 1';
        program1.Status__c = 'Active';
        program1.StartDate__c = Date.today();
        program1.EndDate__c = Date.today().addDays(30);

        ProgramEngagement__c engagement1 = new ProgramEngagement__c();
        engagement1.Name = 'Engagement 1';
        engagement1.Stage__c = 'Enrolled';
        engagement1.Contact__c = contactId;
        engagement1.Program__c = program1.Id;
        engagement1.Program__r = program1;
        engagement1.Role__c = 'Client';

        BasicStub selectorStub = new BasicStub(ProgramEngagementSelector.class);
        List<ProgramEngagement__c> engagements = new List<ProgramEngagement__c>{
            engagement1
        };
        selectorStub.withReturnValue(
            'getProgramEngagementsByContactId',
            Id.class,
            engagements
        );

        Test.startTest();

        final ProgramService programService = new ProgramService();

        programService.programEngagementSelector = (ProgramEngagementSelector) selectorStub.createMock();

        final Map<Id, String> actual = programService.getProgramNamesByIdForContact(
            contactId
        );

        Test.stopTest();

        Set<Id> expectedKeySet = new Set<Id>{ program1.Id };

        System.assertEquals(expectedKeySet, actual.keySet());

        List<String> expectedValues = new List<String>{ program1.Name };

        for (String programName : actual.values()) {
            System.assert(expectedValues.contains(programName));
        }

        selectorStub.assertCalledWith(
            'getProgramEngagementsByContactId',
            Id.class,
            contactId
        );
    }
}
