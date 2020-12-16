/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { LightningElement, api } from "lwc";
import skipToStartLink from "@salesforce/label/c.SkipToStartLink";
import skipToEndLink from "@salesforce/label/c.SkipToEndLink";

export default class SkipLinks extends LightningElement {
    labels = {
        skipToEndLink,
        skipToStartLink,
    };

    ENTER = "Enter"; // keyboard constant, not label

    @api
    handleSkipToEndClick() {
        this.template.querySelector(".end-link").focus();
    }

    @api
    handleSkipToStartClick() {
        this.template.querySelector(".start-link").focus();
    }

    handleSkipToStartKeyboard(event) {
        let key = event.key || event.keyCode;
        if (key === this.ENTER || key === " " || key === 13 || key === 32) {
            this.handleSkipToStartClick();
        }
    }

    handleSkipToEndKeyboard(event) {
        let key = event.key || event.keyCode;
        if (key === this.ENTER || key === " " || key === 13 || key === 32) {
            this.handleSkipToEndClick();
        }
    }
}
