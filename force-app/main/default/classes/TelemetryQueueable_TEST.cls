/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class TelemetryQueueable_TEST {
    private static TelemetryQueueable telemetryQueueable = new TelemetryQueueable();
    // Implementing the interface in the test class because we cannot stub an inner class
    private static FeatureManagement_TEST.FeatureParameter testParameter = new FeatureManagement_TEST.FeatureParameter();
    private static final String APEX_CLASS_NAME = 'TelemetryQueueable';

    @IsTest
    private static void shouldEnqueueJob() {
        Test.startTest();
        telemetryQueueable.enqueue(
            new List<FeatureManagement.FeatureParameter>{ testParameter }
        );
        Test.stopTest();

        List<AsyncApexJob> asyncJobs = [
            SELECT Id
            FROM AsyncApexJob
            WHERE ApexClass.Name = :APEX_CLASS_NAME
        ];
        System.assertEquals(1, asyncJobs.size(), 'Expected the job to be enqueued.');
    }

    @IsTest
    private static void shouldNotEnqueueJobWithoutFeatureParameters() {
        final String className = TelemetryQueueable.class.getName();
        Test.startTest();
        telemetryQueueable.enqueue(new List<FeatureManagement.FeatureParameter>());
        Test.stopTest();

        List<AsyncApexJob> asyncJobs = [
            SELECT Id
            FROM AsyncApexJob
            WHERE ApexClass.Name = :className
        ];
        System.assert(asyncJobs.isEmpty(), 'Expected the job not to be enqueued.');
    }

    @IsTest
    private static void shouldSendFeatureParameter() {
        telemetryQueueable.featureParameters = new List<FeatureManagement.FeatureParameter>{
            testParameter
        };
        // NOTE: When the Queueable gets enqueued, it and all of its instance variables are serialized and persisted.
        // When the Queueable is actually kicked off in its own transaction (regardless of Test.startTest() malarky),
        // it's been deserialized into new instances, so your unit test can't actually hold a shared reference to the
        // object that's passed to the Queueable instance that gets executed.
        // Workaround: call execute() synchronously
        // Thanks Mr. Reed!
        Test.startTest();
        telemetryQueueable.execute(null);
        Test.stopTest();

        System.assertEquals(
            1,
            testParameter.getSendCount(),
            'Expected each parameter to be sent.'
        );
    }

    @IsTest
    private static void throwsExceptionWhenFeatureParameterSendFails() {
        String actualException;
        telemetryQueueable.featureParameters = new List<FeatureManagement.FeatureParameter>{
            testParameter.withThrowException()
        };

        Test.startTest();
        try {
            telemetryQueueable.execute(null);
        } catch (Exception ex) {
            actualException = ex.getMessage();
        }

        System.assertEquals(
            System.Label.TelemetryException,
            actualException,
            'Expected the telemetry exception to be thrown.'
        );
    }
}
