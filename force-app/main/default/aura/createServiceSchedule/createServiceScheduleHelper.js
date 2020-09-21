({
    extractUrlParams: function(component, event, helper) {
        let pageRef = component.get("v.pageReference");
        let state = pageRef.state;
        let context = state.inContextOfRef;

        if (!context) {
            return;
        }

        if (context.startsWith("1.")) {
            context = context.substring(2);
        }

        // decode and deserialize the parameter
        // expected result: {"type":"standard__recordPage",
        //   "attributes":{"recordId":"a0763000003z79YAAQ","actionName":"view","objectApiName":"Service__c"}
        context = JSON.parse(window.atob(context));

        if (
            context.attributes.objectApiName &&
            context.attributes.objectApiName === helper.getObjectName(component)
        ) {
            component.set("v.serviceId", context.attributes.recordId);
        }
    },

    getObjectName: function(component) {
        let objectName = "Service__c";
        let namespace = component.getType().split(":")[0];
        namespace = namespace === null || namespace === "c" ? "" : namespace + "__";
        objectName = namespace + objectName;
        return objectName;
    },

    refresh: function(component, event, helper) {
        $A.get("e.force:refreshView").fire();
    },

    updateStatus: function(component, event, helper) {
        component.set("v.currentStage", event.getParam("currentStage"));
        component.set("v.stages", event.getParam("activeStages"));
    },

    updateNavigation: function(component, event, helper) {
        let availableActions;

        if (event && event.getParam("availableActions")) {
            availableActions = event.getParam("availableActions");
            component.set("v.availableActions", availableActions);
        } else {
            component.set("v.availableActions", []);
        }
    },

    publishNavigation: function(component, event, helper) {
        // TODO: Handle save and new vs save and leave
        let payload = { navigate: event.getParam("name") };

        component.find("navigation").publish(payload);
    },

    showFlow: function(component, event, helper) {
        $A.createComponents(helper.createComponents(component), function(
            modalComponents,
            status
        ) {
            if (status === "SUCCESS") {
                helper.showModal(component, modalComponents);
                helper.startFlow(component);
            }
        });
    },

    startFlow: function(component) {
        // TODO: Determine where to store the name of the flow to launch...
        const FLOW_NAME = "ScheduleCreator";
        let flow = component.find("flow");
        flow.startFlow(FLOW_NAME);
    },

    showModal: function(component, modalComponents) {
        let modalBody = modalComponents[0];
        let modalFooter = modalComponents[1];

        component.find("modal").showCustomModal({
            // TODO: Format New Record with SObject Label
            header: $A.get("$Label.c.New_Service_Schedule"),
            body: modalBody,
            footer: modalFooter,
            showCloseButton: true,
            cssClass: "slds-modal_large",
            closeCallback: function() {}
        });
    },

    createComponents: function(component) {
        return [
            [
                "lightning:flow",
                {
                    "aura:id": "flow",
                    onstatuschange: component.getReference("c.handleStatusChange"),
                    flowLayout: "twoColumn"
                }
            ],
            [
                "c:footer",
                {
                    availableActions: component.getReference("v.availableActions"),
                    stages: component.getReference("v.stages"),
                    currentStage: component.getReference("v.currentStage"),
                    onnavigate: component.getReference("c.handleNavigation")
                }
            ]
        ];
    }
});
