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
                rollupsService.processInsertedParticipants(Trigger.new);
            }
            // when AFTER_UPDATE {
            // }
            when AFTER_DELETE {
                rollupsService.processDeletedServiceSchedules(Trigger.old);
            }
            // when AFTER_UNDELETE {
            // }
            when else {
                return;
            }
        }
    }
}
