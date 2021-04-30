/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

({
    doInit: function(component, event, helper) {
        if ($A.get("$Site")) {
            component.set("v.isCommunity", true);
        } else {
            component.set("v.isCommunity", false);
        }
        helper.extractUrlParams(component, event, helper);
    },

    refresh: function(component, event, helper) {
        helper.refresh();
    }
});
