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

const MODAL_HIDDEN = "modal-hidden";

export default class Modal extends LightningElement {
    close = closeLabel;

    @api size = "fixed";
    @api isNested = false;
    @api hideBodyPadding = false;

    visibilityClass = MODAL_HIDDEN;

    @api
    set defaultVisible(value) {
        if (value) {
            this.visibilityClass = "";
        } else {
            this.visibilityClass = MODAL_HIDDEN;
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
            "slds-modal slds-fade-in-open slds-align_absolute-center" +
            (this.size === "fixed" ? "" : ` slds-modal_${this.size}`) +
            (this.isNested ? " nested-modal" : "")
        );
    }

    get modalContainerCss() {
        return "slds-modal__container" + (this.size === "fixed" ? " fixed-width" : "");
    }

    get bodyCss() {
        return (
            "slds-modal__content slds-scrollable" +
            (this.hideBodyPadding ? "" : " slds-p-around_medium")
        );
    }

    @track hasHeaderString = false;
    _headerPrivate;

    @api show() {
        const outerDivEl = this.template.querySelector("div");
        outerDivEl.classList.remove(MODAL_HIDDEN);
    }

    @api hide() {
        const outerDivEl = this.template.querySelector("div");
        outerDivEl.classList.add(MODAL_HIDDEN);
    }

    handleDialogClose() {
        this.hide();
        this.dispatchEvent(new CustomEvent("dialogclose"));
    }

    handleSlotTaglineChange() {
        const taglineEl = this.template.querySelector("p");
        taglineEl.classList.remove(MODAL_HIDDEN);
    }

    handleSlotFooterChange() {
        const footerEl = this.template.querySelector("footer");
        footerEl.classList.remove(MODAL_HIDDEN);
    }
}
