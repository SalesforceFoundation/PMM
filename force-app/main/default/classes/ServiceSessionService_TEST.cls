/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opecci onsource.org/licenses/BSD-3-Clause
 *
 */
@IsTest
public with sharing class ServiceSessionService_TEST {
    private static BasicStub serviceSelectorStub = new BasicStub(
        ServiceSessionSelector.class
    );

    private static ServiceSessionService service = new ServiceSessionService();

    @IsTest
    private static void testGetServiceSessionsByStartDate() {
        final String dateRange = 'THIS_WEEK';
        final String methodName = 'getServiceSessionsByStartDate';
        final DateTime currentDate = System.now();

        Account newAccount = new Account();
        newAccount.Name = 'Test Account';
        insert newAccount;

        Contact newContact = new Contact();
        newContact.LastName = 'Test Contact';
        newContact.AccountId = newAccount.Id;
        insert newContact;

        ServiceSession__c serviceSession = new ServiceSession__c();
        serviceSession.Name = 'Session 1';
        serviceSession.Status__c = 'Pending';
        serviceSession.PrimaryServiceProvider__c = newContact.Id;
        serviceSession.SessionStart__c = currentDate;

        ServiceSession__c serviceSession1 = new ServiceSession__c();
        serviceSession1.Name = 'Session 2';
        serviceSession1.Status__c = 'Pending';
        serviceSession1.PrimaryServiceProvider__c = newContact.Id;
        serviceSession1.SessionStart__c = currentDate;

        ServiceSession__c serviceSession2 = new ServiceSession__c();
        serviceSession2.Name = 'Session 3';
        serviceSession2.Status__c = 'Pending';
        serviceSession2.PrimaryServiceProvider__c = newContact.Id;
        serviceSession2.SessionStart__c = currentDate.addDays(1);

        Map<String, List<ServiceSession__c>> expected = new Map<String, List<ServiceSession__c>>();
        List<ServiceSession__c> sessions = new List<ServiceSession__c>{
            serviceSession,
            serviceSession1
        };
        expected.put(currentDate.format('EEEE, dd MMMM'), sessions);

        expected.put(
            currentDate.addDays(1).format('EEEE, dd MMMM'),
            new List<ServiceSession__c>{ serviceSession2 }
        );

        serviceSelectorStub.withReturnValue(
            methodName,
            String.class,
            new List<ServiceSession__c>{
                serviceSession,
                serviceSession1,
                serviceSession2
            }
        );

        Test.startTest();
        service.serviceSessionSelector = (ServiceSessionSelector) serviceSelectorStub.createMock();

        Map<String, List<ServiceSession__c>> actual = service.getServiceSessionsByStartDate(
            dateRange
        );

        Test.stopTest();

        System.assertEquals(
            expected.get(currentDate.format('EEEE, dd MMMM')),
            actual.get(currentDate.format('EEEE, dd MMMM')),
            'Expected values is not the same as actual values'
        );

        System.assertEquals(
            expected.get(currentDate.addDays(1).format('EEEE, dd MMMM')),
            actual.get(currentDate.addDays(1).format('EEEE, dd MMMM')),
            'Expected values is not the same as actual values'
        );

        System.assert(
            actual.containsKey(currentDate.format('EEEE, dd MMMM')),
            'Actual result does not have the key'
        );

        serviceSelectorStub.assertCalledWith(methodName, String.class, dateRange);
    }
}
