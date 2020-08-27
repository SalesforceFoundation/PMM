({
    doInit: function(component, event, helper) {
        helper.extractUrlParams(component, event);
        helper.showFlow(component, event, helper);
    },

    reInit: function(component, event, helper) {
        helper.refresh();
    },

    handleStatusChange: function(component, event, helper) {
        helper.updateStatus(component, event, helper);
    },

    handleNavigation: function(component, event, helper) {
        helper.publishNavigation(component, event, helper);
    },

    handleNavigationMessage: function(component, event, helper) {
        helper.updateNavigation(component, event, helper);
    }
});
