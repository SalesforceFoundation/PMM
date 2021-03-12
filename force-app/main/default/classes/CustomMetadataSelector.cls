/*
 *
 *  * Copyright (c) 2021, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class CustomMetadataSelector {
    @TestVisible
    private static CustomMetadataSelector instance;

    public static CustomMetadataSelector getInstance() {
        if (instance == null) {
            instance = new CustomMetadataSelector();
        }
        return instance;
    }

    public List<FeatureGate__mdt> getAllFeatureGates() {
        return FeatureGate__mdt.getAll().values();
    }
}
