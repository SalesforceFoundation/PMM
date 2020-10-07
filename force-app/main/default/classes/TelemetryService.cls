/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public inherited sharing class TelemetryService {
    @TestVisible
    private FeatureParameters featureParameters {
        get {
            if (featureParameters == null) {
                featureParameters = new FeatureParameters();
            }
            return featureParameters;
        }
        set;
    }

    @TestVisible
    private TelemetryQueueable telemetryQueueable {
        get {
            if (telemetryQueueable == null) {
                telemetryQueueable = new TelemetryQueueable();
            }

            return telemetryQueueable;
        }
        set;
    }

    public void sendUsageMetrics() {
        telemetryQueueable.enqueue(featureParameters.getAll());
    }
}
