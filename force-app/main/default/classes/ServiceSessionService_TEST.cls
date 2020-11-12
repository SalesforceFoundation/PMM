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
        TestDataFactory.generateAttendanceData('Daily');

        final String dateLiteral = 'THIS_WEEK';
        final String methodName = 'getServiceSessionsByStartDate';
        final DateTime currentDate = System.now();
        final Set<String> sessionStatus = new Set<String>{ 'Pending', 'Complete' };

        Map<String, List<ServiceSession__c>> expected = new Map<String, List<ServiceSession__c>>();

        List<ServiceSession__c> expectedSessions = [
            SELECT Id, Name, PrimaryServiceProvider__c, Status__c, SessionStart__c
            FROM ServiceSession__c
            WHERE SessionStart__c = THIS_WEEK AND Status__c IN :sessionStatus
            ORDER BY SessionStart__c
        ];

        expected.put(
            currentDate.format('EEEE, dd MMMM'),
            new List<ServiceSession__c>{ expectedSessions[0] }
        );

        expected.put(
            currentDate.addDays(1).format('EEEE, dd MMMM'),
            new List<ServiceSession__c>{ expectedSessions[1] }
        );

        serviceSelectorStub.withReturnValue(methodName, String.class, expectedSessions);

        Test.startTest();
        service.serviceSessionSelector = (ServiceSessionSelector) serviceSelectorStub.createMock();

        Map<String, List<ServiceSession__c>> actual = service.getServiceSessionsByStartDate(
            dateLiteral
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

        serviceSelectorStub.assertCalledWith(methodName, String.class, dateLiteral);
    }
}
