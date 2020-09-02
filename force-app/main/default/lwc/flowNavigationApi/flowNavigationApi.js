import { LightningElement, api, wire } from "lwc";
import {
    FlowNavigationBackEvent,
    FlowNavigationNextEvent,
    FlowNavigationFinishEvent,
} from "lightning/flowSupport";
import { publish, subscribe, MessageContext } from "lightning/messageService";
import NAVIGATION_CHANNEL from "@salesforce/messageChannel/Navigation__c";

export default class FlowNavigationApi extends LightningElement {
    @api availableActions = [];

    @wire(MessageContext)
    messageContext;

    subscribeToMessageChannel() {
        this.subscription = subscribe(this.messageContext, NAVIGATION_CHANNEL, message =>
            this.handleNavigate(message)
        );
    }

    publishToMessageChannel() {
        const payload = { availableActions: this.availableActions };

        publish(this.messageContext, NAVIGATION_CHANNEL, payload);
    }

    connectedCallback() {
        this.subscribeToMessageChannel();
        this.publishToMessageChannel();
    }

    handleNavigate(message) {
        let navigationEvent;

        if (
            message.navigate === "next" &&
            this.availableActions.find(action => action === "NEXT")
        ) {
            navigationEvent = new FlowNavigationNextEvent();
        } else if (
            message.navigate === "back" &&
            this.availableActions.find(action => action === "BACK")
        ) {
            navigationEvent = new FlowNavigationBackEvent();
        } else if (
            message.navigate === "finish" &&
            this.availableActions.find(action => action === "FINISH")
        ) {
            navigationEvent = new FlowNavigationFinishEvent();
        } else {
            return;
        }

        this.dispatchEvent(navigationEvent);
    }
}
