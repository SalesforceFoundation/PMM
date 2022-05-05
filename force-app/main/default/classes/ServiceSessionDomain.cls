/*
 *
 *  * Copyright (c) 2022, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ServiceSessionDomain {
    public class ServiceSessionDomainException extends Exception {
    }

    public void updateServiceSession(ServiceSession__c serviceSession) {
        String omittedContactIds = serviceSession.OmittedContactIds__c;

        if (
            !PermissionValidator.getInstance()
                .hasObjectAccess(
                    ServiceSession__c.SObjectType,
                    PermissionValidator.CRUDAccessType.UPDATEABLE
                )
        ) {
            throw new ServiceSessionDomainException(Label.UpsertOperationException);
        }

        List<ServiceSession__c> strippedSessions = (List<ServiceSession__c>) Security.stripInaccessible(
                AccessType.UPDATABLE,
                new List<ServiceSession__c>{ serviceSession }
            )
            .getRecords();
        // We are intentionally bypassing security for this system level field
        strippedSessions[0].OmittedContactIds__c = omittedContactIds;

        update strippedSessions;
    }
}
