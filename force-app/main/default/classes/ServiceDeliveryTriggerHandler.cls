public with sharing class ServiceDeliveryTriggerHandler {
    public void execute() {
        if (!Trigger.isExecuting) {
            return;
        }

        switch on Trigger.operationType {
            when AFTER_DELETE {
                handleAfterDelete();
            }
            when AFTER_INSERT {
                handleAfterInsert();
            }
            when AFTER_UNDELETE {
                handleAfterUndelete();
            }
            when AFTER_UPDATE {
                handleAfterUpdate();
            }
            when else {
                return;
            }
        }
    }

    public void handleAfterDelete() {
    }

    public void handleAfterInsert() {
    }

    public void handleAfterUndelete() {
    }

    public void handleAfterUpdate() {
    }
}
