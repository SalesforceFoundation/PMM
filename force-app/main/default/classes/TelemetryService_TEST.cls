@IsTest
public with sharing class TelemetryService_TEST {
    @IsTest
    private static void shouldCallEnqueueWithFeatureParameters() {
        List<FeatureManagement.FeatureParameter> expectedFeatureParameters = new List<FeatureManagement.FeatureParameter>();
        FeatureParameters_Test.GetAll getAllMethod = new FeatureParameters_Test.GetAll();
        getAllMethod.returnValue = expectedFeatureParameters;
        final Stub featureParametersStub = new Stub(
            new List<Stub.Method>{ getAllMethod }
        );

        TelemetryQueueable_Test.Enqueue enqueueMethod = new TelemetryQueueable_Test.Enqueue();
        final Stub telemetryQueueableStub = new Stub(
            new List<Stub.Method>{ enqueueMethod }
        );

        TelemetryService telemetryService = new TelemetryService();
        telemetryService.featureParameters = (FeatureParameters) Test.createStub(
            FeatureParameters.class,
            featureParametersStub
        );

        telemetryService.telemetryQueueable = (TelemetryQueueable) Test.createStub(
            TelemetryQueueable.class,
            telemetryQueueableStub
        );

        Test.startTest();
        telemetryService.sendUsageMetrics();
        Test.stopTest();

        featureParametersStub.assertMethodsCalled();
        telemetryQueueableStub.assertMethodsCalled();
    }

    // ----------     Method Stubs     ---------- //
    public class SendUsageMetrics extends Stub.Method {
        public SendUsageMetrics() {
            super(
                TelemetryService.class,
                Void.class,
                'sendUsageMetrics',
                new List<Stub.Parameter>{}
            );
        }

        public override Boolean isInstanceOf(Object instance) {
            return instance instanceof TelemetryService;
        }

        public override List<Object> getExpectedArguments() {
            return new List<Object>{};
        }

        public override Object getReturnValue() {
            return Void.class;
        }
    }
}
