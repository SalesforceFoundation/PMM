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
        List<ServiceDelivery__c> deliveriesToInsert = new List<ServiceDelivery__c>();
        List<ServiceDelivery__c> deliveriesToUpdate = new List<ServiceDelivery__c>();

        for (ServiceDelivery__c delivery : serviceDeliveriesToUpsert) {
            if (delivery.Id == null) {
                deliveriesToInsert.add(delivery);
            } else {
                deliveriesToUpdate.add(delivery);
            }
        }
        insertServiceDeliveries(deliveriesToInsert);
        updateServiceDeliveries(deliveriesToUpdate);
    }

    public void deleteServiceDeliveries(List<ServiceDelivery__c> serviceDeliveries) {
        if (serviceDeliveries.isEmpty()) {
            return;
        }

        if (
            !PermissionValidator.getInstance()
                .hasObjectAccess(
                    ServiceDelivery__c.SObjectType,
                    PermissionValidator.CRUDAccessType.DELETEABLE
                )
        ) {
            throw new ServiceDeliveryDomainException(Label.Delete_Operation_Exception);
        }

        delete serviceDeliveries;
    }

    public void insertServiceDeliveries(List<ServiceDelivery__c> serviceDeliveries) {
        if (serviceDeliveries.isEmpty()) {
            return;
        }

        if (
            !PermissionValidator.getInstance()
                .hasObjectAccess(
                    ServiceDelivery__c.SObjectType,
                    PermissionValidator.CRUDAccessType.CREATEABLE
                )
        ) {
            throw new ServiceDeliveryDomainException(Label.UpsertOperationException);
        }

        insert Security.stripInaccessible(AccessType.CREATABLE, serviceDeliveries)
            .getRecords();
    }

    public void updateServiceDeliveries(List<ServiceDelivery__c> serviceDeliveries) {
        if (serviceDeliveries.isEmpty()) {
            return;
        }

        if (
            !PermissionValidator.getInstance()
                .hasObjectAccess(
                    ServiceDelivery__c.SObjectType,
                    PermissionValidator.CRUDAccessType.UPDATEABLE
                )
        ) {
            throw new ServiceDeliveryDomainException(Label.UpsertOperationException);
        }

        update Security.stripInaccessible(AccessType.UPDATABLE, serviceDeliveries)
            .getRecords();
    }
}
