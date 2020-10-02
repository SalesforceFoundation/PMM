({
    doInit: function(component, event, helper) {
        helper.extractUrlParams(component, event, helper);
    },

    reInit: function(component, event, helper) {
        helper.refresh();
    }
});
