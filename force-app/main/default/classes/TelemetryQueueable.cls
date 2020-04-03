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
                System.debug(featureParameter.getSendCount());
            }
        } catch (Exception ex) {
            throw new TelemetryException('Whooops!');
        }
    }

    public class TelemetryException extends Exception {
    }
}
