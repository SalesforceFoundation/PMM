/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { LightningElement, api, wire } from "lwc";
import { CurrentPageReference } from "lightning/navigation";
import { debug } from "c/util";

const events = {};

const GLOBAL_PUBSUB_EVENT_NAME = "globalpubsubevent";

/**
 * Confirm that two page references have the same attributes
 * @param {object} pageRef1 - The first page reference
 * @param {object} pageRef2 - The second page reference
 */
const samePageRef = (pageRef1, pageRef2) => {
    const obj1 = pageRef1.attributes;
    const obj2 = pageRef2.attributes;
    return Object.keys(obj1)
        .concat(Object.keys(obj2))
        .every(key => {
            return obj1[key] === obj2[key];
        });
};

/**
 * Registers a callback for an event
 * @param {string} eventName - Name of the event to listen for.
 * @param {function} callback - Function to invoke when said event is fired.
 * @param {object} thisArg - The value to be passed as the this parameter to the callback function is bound.
 */
const registerListener = (eventName, callback, thisArg) => {
    debug(
        {
            eventName: eventName,
        },
        "PMDM: pubsub.registerListener"
    );
    // Checking that the listener has a pageRef property. We rely on that property for filtering purpose in fireEvent()
    if (!thisArg.pageRef) {
        throw new Error(
            'pubsub listeners need a "@wire(CurrentPageReference) pageRef" property'
        );
    }

    if (!events[eventName]) {
        events[eventName] = [];
    }
    const duplicate = events[eventName].find(listener => {
        return listener.callback === callback && listener.thisArg === thisArg;
    });

    if (!duplicate) {
        events[eventName].push({ callback, thisArg });
    }
};

/**
 * Unregisters a callback for an event
 * @param {string} eventName - Name of the event to unregister from.
 * @param {function} callback - Function to unregister.
 * @param {object} thisArg - The value to be passed as the this parameter to the callback function is bound.
 */
const unregisterListener = (eventName, callback, thisArg) => {
    if (events[eventName]) {
        events[eventName] = events[eventName].filter(
            listener => listener.callback !== callback || listener.thisArg !== thisArg
        );
    }
};

/**
 * Unregisters all event listeners bound to an object.
 * @param {object} thisArg - All the callbacks bound to this object will be removed.
 */
const unregisterAllListeners = thisArg => {
    Object.keys(events).forEach(eventName => {
        events[eventName] = events[eventName].filter(
            listener => listener.thisArg !== thisArg
        );
    });
};

/**
 * Fires an event to listeners.
 * @param {object} pageRef - Reference of the page that represents the event scope.
 * @param {string} eventName - Name of the event to fire.
 * @param {*} payload - Payload of the event to fire.
 * @param {boolean} isGlobal - If to fire this event as a "global" event.
 */
const fireEvent = (pageRef, eventName, payload, isGlobal = false) => {
    debug(
        {
            eventName: eventName,
            payload: payload,
            isGlobal: !!isGlobal,
        },
        "PMDM: pubsub.fireEvent"
    );
    if (events[eventName]) {
        const listeners = events[eventName];
        listeners.forEach(listener => {
            if (samePageRef(pageRef, listener.thisArg.pageRef)) {
                try {
                    listener.callback.call(listener.thisArg, payload);
                } catch (error) {
                    // fail silently
                }
            }
        });
    }
    if (isGlobal) {
        fireEvent(
            pageRef,
            GLOBAL_PUBSUB_EVENT_NAME,
            {
                eventName: eventName,
                payload: payload,
            },
            false
        );
    }
};

export { registerListener, unregisterListener, unregisterAllListeners, fireEvent };
export default class Pubsub extends LightningElement {
    @wire(CurrentPageReference) pageRef;

    connectedCallback() {
        registerListener(GLOBAL_PUBSUB_EVENT_NAME, this.dispatchGlobalEvent, this);
    }

    dispatchGlobalEvent(detail) {
        debug(
            {
                detail: detail,
            },
            "PMDM: Pubsub.dispatchGlobalEvent"
        );
        this.dispatchEvent(
            new CustomEvent(GLOBAL_PUBSUB_EVENT_NAME, {
                detail: detail,
            })
        );
    }

    @api
    fireGlobalEvent(eventName, payload) {
        debug(
            {
                eventName: eventName,
                payload: payload,
            },
            "PMDM Pubsub.fireGlobalEvent"
        );
        fireEvent(this.pageRef, eventName, payload, false);
    }
}
