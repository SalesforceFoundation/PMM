({
    extractUrlParams: function(component, event, helper) {
        let name = "inContextOfRef";
        let url = window.location.href;

        // TODO: Grap this from Page Reference instead
        let regex = new RegExp("[?&]" + name + "(=1.([^&#]*)|&|#|$)");
        let results = regex.exec(url);

        if (!results) return null;
        if (!results[2]) return "";
        let context = decodeURIComponent(results[2].replace(/\+/g, " "));
        context = JSON.parse(window.atob(context));

        let namespace = component.getType().split(":")[0];
        let objectApiName = (namespace === "c" ? "" : namespace) + "Service__c";

        if (
            !context.attributes ||
            !context.attributes.objectApiName ||
            context.attributes.objectApiName !== objectApiName
        ) {
            return;
        }

        component.set("v.serviceId", context.attributes.recordId);
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
        const FLOW_NAME = "ScheduleCreator";
        let flow = component.find("flow");
        flow.startFlow(FLOW_NAME);
    },

    showModal: function(component, modalComponents) {
        let modalBody = modalComponents[0];
        let modalFooter = modalComponents[1];

        component.find("modal").showCustomModal({
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
