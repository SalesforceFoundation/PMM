@IsTest
public with sharing class TelemetryService_TEST {
    @IsTest
    private static void shouldCallEnqueueWithFeatureParameters() {
        final List<FeatureManagement.FeatureParameter> expectedFeatureParameters = new List<FeatureManagement.FeatureParameter>{};
        final BasicStub featureParametersStub = new BasicStub(FeatureParameters.class)
            .withReturnValue('getAll', expectedFeatureParameters);
        final BasicStub telemetryQueueableStub = new BasicStub(TelemetryQueueable.class);

        TelemetryService telemetryService = new TelemetryService();
        telemetryService.featureParameters = (FeatureParameters) featureParametersStub.createMock();
        telemetryService.telemetryQueueable = (TelemetryQueueable) telemetryQueueableStub.createMock();

        Test.startTest();
        telemetryService.sendUsageMetrics();
        Test.stopTest();

        featureParametersStub.assertCalled('getAll');
        telemetryQueueableStub.assertCalledWith(
            'enqueue',
            List<FeatureManagement.FeatureParameter>.class,
            expectedFeatureParameters
        );
    }

    @IsTest
    private static void shouldCreateQueueableOnDemand() {
        Test.startTest();
        TelemetryQueueable telemetryQueueable = new TelemetryService().telemetryQueueable;
        Test.stopTest();

        System.assertNotEquals(
            null,
            telemetryQueueable,
            'Expected the queueable instance to be created on demand.'
        );
    }

    @IsTest
    private static void shouldCreateFeatureParametersOnDemand() {
        Test.startTest();
        FeatureParameters featureParameters = new TelemetryService().featureParameters;
        Test.stopTest();

        System.assertNotEquals(
            null,
            featureParameters,
            'Expected the feature parameters instance to be created on demand.'
        );
    }
}
