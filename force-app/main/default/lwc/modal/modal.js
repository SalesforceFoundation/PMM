/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

import { LightningElement, api, track } from "lwc";
import closeLabel from "@salesforce/label/c.Close";

const CSS_CLASS = "modal-hidden";

export default class Modal extends LightningElement {
    close = closeLabel;

    @api size = "fixed";

    visibilityClass = CSS_CLASS;

    @api
    set defaultVisible(value) {
        if (value) {
            this.visibilityClass = "";
        } else {
            this.visibilityClass = CSS_CLASS;
        }
    }
    get defaultVisible() {
        return this.visibilityClass === "";
    }

    @api
    set header(value) {
        this.hasHeaderString = value !== "";
        this._headerPrivate = value;
    }
    get header() {
        return this._headerPrivate;
    }

    get modalCss() {
        return (
            "slds-modal slds-fade-in-open" +
            (this.size === "fixed" ? "" : ` slds-modal_${this.size}`)
        );
    }

    get modalContainerCss() {
        return "slds-modal__container" + (this.size === "fixed" ? " fixed-width" : "");
    }

    @track hasHeaderString = false;
    _headerPrivate;

    @api show() {
        const outerDivEl = this.template.querySelector("div");
        outerDivEl.classList.remove(CSS_CLASS);
    }

    @api hide() {
        const outerDivEl = this.template.querySelector("div");
        outerDivEl.classList.add(CSS_CLASS);
    }

    handleDialogClose() {
        this.hide();
        this.dispatchEvent(new CustomEvent("dialogclose"));
    }

    handleSlotTaglineChange() {
        const taglineEl = this.template.querySelector("p");
        taglineEl.classList.remove(CSS_CLASS);
    }

    handleSlotFooterChange() {
        const footerEl = this.template.querySelector("footer");
        footerEl.classList.remove(CSS_CLASS);
    }
}
