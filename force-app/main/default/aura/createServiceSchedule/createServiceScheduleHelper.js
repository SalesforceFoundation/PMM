/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

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
    }
});
