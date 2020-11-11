/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ServiceDeliveryDomain {
    public class ServiceDeliveryDomainException extends Exception {
    }

    public void upsertServiceDeliveries(
        List<ServiceDelivery__c> serviceDeliveriesToUpsert
    ) {
        if (
            !PermissionValidator.getInstance()
                .hasObjectAccess(
                    ServiceDelivery__c.SObjectType,
                    PermissionValidator.CRUDAccessType.CREATEABLE
                ) ||
            !PermissionValidator.getInstance()
                .hasObjectAccess(
                    ServiceDelivery__c.SObjectType,
                    PermissionValidator.CRUDAccessType.UPDATEABLE
                )
        ) {
            throw new ServiceDeliveryDomainException(Label.UpsertOperationException);
        }

        upsert serviceDeliveriesToUpsert;
    }
}
