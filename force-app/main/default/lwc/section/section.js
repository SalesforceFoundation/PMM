/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { LightningElement, api } from "lwc";

export default class Section extends LightningElement {
    @api title;
    @api focusHeading = false;

    connectedCallback() {
        if (this.focusHeading) {
            this.handleFocus();
        }
    }

    handleFocus() {
        // eslint-disable-next-line @lwc/lwc/no-async-operation
        setTimeout(
            function() {
                let sectionHeading = this.template.querySelector("h3");
                if (sectionHeading) {
                    sectionHeading.focus();
                }
            }.bind(this),
            50
        );
    }
}
