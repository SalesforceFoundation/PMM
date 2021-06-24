/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ServiceDeliveryTriggerHandler {
    @TestVisible
    private ServiceDeliveryRollupsService rollupsService = new ServiceDeliveryRollupsService();

    public void execute() {
        if (!Trigger.isExecuting) {
            return;
        }

        delegate();
    }

    @TestVisible
    private void delegate() {
        switch on Trigger.operationType {
            when AFTER_DELETE {
                rollupsService.processDeleted(Trigger.old);
            }
            when AFTER_INSERT {
                rollupsService.processInserted(Trigger.new);
            }
            when AFTER_UNDELETE {
                rollupsService.processInserted(Trigger.new);
            }
            when AFTER_UPDATE {
                rollupsService.processUpdated(Trigger.oldMap, Trigger.new);
            }
            when else {
                return;
            }
        }
    }
}
