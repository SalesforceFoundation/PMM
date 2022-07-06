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
    @api grabFocus = false;

    connectedCallback() {
        if (this.grabFocus) {
            this.handleFocus();
        }
    }

    handleFocus() {
        // eslint-disable-next-line @lwc/lwc/no-async-operation
        setTimeout(
            function() {
                let firstInput = this.template.querySelector("h3");
                if (firstInput) {
                    firstInput.focus();
                }
            }.bind(this),
            50
        );
    }
}
