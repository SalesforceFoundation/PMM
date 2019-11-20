({
    onGlobalPubsubEvent: function(component, event, helper) {
        const eventName = event.getParam("eventName");
        const payload = event.getParam("payload");

        helper.debug(
            {
                eventName: eventName,
                payload: payload
            },
            "pubsubBridge: globalpubsubevent"
        );

        component.find("pubsub").forEach(pubsub => {
            if (pubsub.getGlobalId() !== event.getSource().getGlobalId()) {
                pubsub.fireGlobalEvent(eventName, payload);
            }
        });
    }
});
