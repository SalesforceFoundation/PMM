/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public without sharing class TelemetryQueueable implements System.Queueable {
    @TestVisible
    private List<FeatureManagement.FeatureParameter> featureParameters;

    public void enqueue(List<FeatureManagement.FeatureParameter> featureParameters) {
        if (featureParameters == null || featureParameters.isEmpty()) {
            return;
        }

        this.featureParameters = featureParameters;
        System.enqueueJob(this);
    }

    public void execute(QueueableContext qc) {
        try {
            for (
                FeatureManagement.FeatureParameter featureParameter : featureParameters
            ) {
                featureParameter.send();
            }
        } catch (Exception ex) {
            throw new TelemetryException(System.Label.TelemetryException);
        }
    }

    public class TelemetryException extends Exception {
    }
}
