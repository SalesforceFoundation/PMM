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
