/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

export class ProgressStep {
    constructor(value, instructions, label, navigationItems) {
        this.label = label;
        this.instructions = instructions;
        this._navigationItems = navigationItems;
        this.value = value;
    }

    get next() {
        return this._navigationItems && this._navigationItems.next
            ? this._navigationItems.next
            : undefined;
    }

    get back() {
        return this._navigationItems && this._navigationItems.back
            ? this._navigationItems.back
            : undefined;
    }

    get finish() {
        return this._navigationItems && this._navigationItems.finish
            ? this._navigationItems.finish
            : undefined;
    }
}
