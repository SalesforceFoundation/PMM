/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ServiceSessionService {
    @TestVisible
    private ServiceSessionSelector serviceSessionSelector = new ServiceSessionSelector();

    public Map<String, List<ServiceSession__c>> getServiceSessionsByStartDate(
        String dateLiteral
    ) {
        Map<String, List<ServiceSession__c>> serviceSessions = new Map<String, List<ServiceSession__c>>();

        for (
            ServiceSession__c session : serviceSessionSelector.getServiceSessionsByStartDate(
                dateLiteral
            )
        ) {
            List<ServiceSession__c> sessions = new List<ServiceSession__c>();
            String sessionStartDate = session.SessionStart__c.format('EEEE, dd MMMM');

            if (serviceSessions.get(sessionStartDate) == null) {
                serviceSessions.put(sessionStartDate, new List<ServiceSession__c>());
            }

            if (serviceSessions.get(sessionStartDate) != null) {
                if (serviceSessions.containsKey(sessionStartDate)) {
                    sessions.add(session);
                    serviceSessions.get(sessionStartDate).addAll(sessions);
                }
            }
        }

        return serviceSessions;
    }
}
