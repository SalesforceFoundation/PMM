/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public inherited sharing class FeatureManagement {
    @TestVisible
    private static FeatureManagement instance;

    //This is a wrapper class around FeatureManagement for stubbing purposes.
    public static FeatureManagement getInstance() {
        if (instance == null) {
            instance = new FeatureManagement();
        }
        return instance;
    }

    public void setPackageIntegerValue(String apiName, Integer value) {
        System.FeatureManagement.setPackageIntegerValue(apiName, value);
    }

    public Integer checkPackageIntegerValue(String apiName) {
        return System.FeatureManagement.checkPackageIntegerValue(apiName);
    }

    // ----------     Interface     ---------- //
    public interface FeatureParameter {
        void send();
    }
}
