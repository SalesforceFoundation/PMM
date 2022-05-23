/*
 *
 *  * Copyright (c) 2022, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */
public with sharing class ServiceParticipantTriggerHandler {
    @TestVisible
    private ServiceParticipantRollupsService rollupsService = new ServiceParticipantRollupsService();

    public void execute() {
        if (!Trigger.isExecuting) {
            return;
        }

        delegate();
    }

    @TestVisible
    private void delegate() {
        switch on Trigger.operationType {
            when AFTER_INSERT {
                rollupsService.processParticipantRollups(Trigger.new);
            }
            when AFTER_UPDATE {
                rollupsService.processParticipantRollups(Trigger.new);
            }
            when AFTER_DELETE {
                rollupsService.processParticipantRollups(Trigger.old);
            }
            when AFTER_UNDELETE {
                rollupsService.processParticipantRollups(Trigger.new);
            }
            when else {
                return;
            }
        }
    }
}
