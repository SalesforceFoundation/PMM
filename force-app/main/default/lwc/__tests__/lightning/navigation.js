/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

/**
 * For the original lightning/navigation mock that comes by default with
 * @salesforce/sfdx-lwc-jest, see:
 * https://github.com/salesforce/sfdx-lwc-jest/blob/master/src/lightning-stubs/navigation/navigation.js
 */
export const CurrentPageReference = jest.fn();

let _pageReference, _replace;

const Navigate = Symbol("Navigate");
const GenerateUrl = Symbol("GenerateUrl");
export const NavigationMixin = Base => {
    return class extends Base {
        [Navigate](pageReference, replace) {
            _pageReference = pageReference;
            _replace = replace;
        }
        [GenerateUrl](pageReference) {
            _pageReference = pageReference;
            return Promise.resolve();
        }
    };
};
NavigationMixin.Navigate = Navigate;
NavigationMixin.GenerateUrl = GenerateUrl;

/*
 * Tests do not have access to the internals of this mixin used by the
 * component under test so save a reference to the arguments the Navigate method is
 * invoked with and provide access with this function.
 */
export const getNavigateCalledWith = () => {
    return {
        pageReference: _pageReference,
        replace: _replace,
    };
};
