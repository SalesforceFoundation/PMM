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
            when AFTER_UPDATE {
                rollupsService.processInsertedParticipants(Trigger.new);
            }
            when AFTER_DELETE {
                rollupsService.processInsertedParticipants(Trigger.old);
            }
            when AFTER_UNDELETE {
                rollupsService.processInsertedParticipants(Trigger.new);
            }
            when else {
                return;
            }
        }
    }
}
