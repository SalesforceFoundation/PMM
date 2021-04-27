/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public class ServiceDeliveryRollups implements Database.Batchable<SObject>, Database.Stateful {
    @TestVisible
    private Set<Id> recordIds;
    private SObjectType sObjectType;
    @TestVisible
    private List<String> attendanceStatuses;
    @TestVisible
    private Set<String> presentStatuses;
    @TestVisible
    private Set<String> absentStatuses;
    @TestVisible
    private Map<Id, SObject> recordById = new Map<Id, SObject>();
    @TestVisible
    private AttendanceSelector attendanceSelector = new AttendanceSelector();
    @TestVisible
    private AttendanceService attendanceService = new AttendanceService();
    @TestVisible
    private SystemAccess systemAccess = new SystemAccess();

    public ServiceDeliveryRollups(Set<Id> recordIds) {
        this.recordIds = recordIds;
        this.sObjectType = new List<Id>(recordIds)[0].getSObjectType();
    }

    public Database.Querylocator start(Database.BatchableContext bc) {
        presentStatuses = new Set<String>(attendanceService.presentStatuses);
        absentStatuses = new Set<String>(attendanceService.absentStatuses);
        attendanceStatuses = attendanceService.getAttendanceStatuses();

        String query = attendanceService.getServiceDeliveryWithRollupDataQuery(
            sObjectType
        );
        return Database.getQueryLocator(query);
    }

    public void execute(Database.BatchableContext bc, List<ServiceDelivery__c> scope) {
        processBatch(scope);
    }

    public void finish(Database.BatchableContext bc) {
        //Update the records processed by the last batch
        attendanceService.processUpdates(sObjectType, recordById);

        //Remove ids processed in the last batch
        recordIds.removeAll(recordById.keySet());

        // What remains in recordIds are records that need to be reset.
        // They once had rollup data but no longer do.
        List<SObject> recordsToClearRollups = new List<SObject>();
        for (Id recordId : recordIds) {
            // TODO: Investigate whether or not we need to recreate these records every batch run
            // TODO: Total number of batches 250,000 per 24 hours -> is this a namespace limit?
            recordsToClearRollups.add(
                attendanceService.constructNewRecord(sObjectType, recordId)
            );
        }
        update recordsToClearRollups;
    }

    //Here we iterate the deliveries that are a part of the batch
    private void processBatch(List<ServiceDelivery__c> deliveries) {
        Set<Id> parentIdsInCurrentScope = new Set<Id>();
        for (ServiceDelivery__c delivery : deliveries) {
            Id parentLookupId = (Id) delivery.get(
                attendanceService.getParentLookupField(sObjectType)
            );
            //Add the parentLookupId to the universe of ids for the batch, we'll need this at the end of the method
            parentIdsInCurrentScope.add(parentLookupId);
            //Add the parent record to the map, if it doesn't exist already
            if (!recordById.containsKey(parentLookupId)) {
                recordById.put(
                    parentLookupId,
                    attendanceService.constructNewRecord(sObjectType, parentLookupId)
                );
            }

            //Update parent record attributes based on current ServiceDelivery__c
            SObject currentRecord = recordById.get(parentLookupId);
            currentRecord = attendanceService.processRecord(
                sObjectType,
                delivery,
                currentRecord
            );
        }
        processUpdatesFromPreviousScope(parentIdsInCurrentScope);
    }

    //Here we find out which records have been fully processed and update them
    //If they are no longer in the batch, they are ready to be updated
    private void processUpdatesFromPreviousScope(Set<Id> parentIdsInCurrentScope) {
        Map<Id, SObject> recordsToUpdateMap = new Map<Id, SObject>();
        for (SObject record : recordById.values()) {
            if (!parentIdsInCurrentScope.contains(record.Id)) {
                recordsToUpdateMap.put(record.Id, record);
                recordById.remove(record.Id);
                recordIds.remove(record.Id);
            }
        }
        attendanceService.processUpdates(sObjectType, recordsToUpdateMap);
    }
}
