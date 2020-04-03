@IsTest
public with sharing class TelemetryQueueable_TEST {
    private static TelemetryQueueable telemetryQueueable = new TelemetryQueueable();
    private static FeatureManagement_TEST.FeatureParameter featureParameterStub = new FeatureManagement_TEST.FeatureParameter();

    @IsTest
    private static void shouldEnqueueJob() {
        final String className = TelemetryQueueable.class.getName();
        Test.startTest();
        telemetryQueueable.enqueue(
            new List<FeatureManagement.FeatureParameter>{ featureParameterStub }
        );
        Test.stopTest();

        List<AsyncApexJob> asyncJobs = [
            SELECT Id
            FROM AsyncApexJob
            WHERE ApexClass.Name = :className
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
        Test.startTest();
        telemetryQueueable.enqueue(
            new List<FeatureManagement.FeatureParameter>{ featureParameterStub }
        );
        Test.stopTest();

        //TODO: Is this a bug or am I too tired to see my mistake?
        System.assertEquals(
            1,
            featureParameterStub.getSendCount(),
            'Expected each parameter to be sent.'
        );
    }

    // ----------     Method Stubs     ---------- //
    public class Enqueue extends Stub.Method {
        private List<FeatureManagement.FeatureParameter> featureParameters;

        public Enqueue() {
            super(
                TelemetryQueueable.class,
                Void.class,
                'enqueue',
                new List<Stub.Parameter>{
                    new Stub.Parameter(
                        List<FeatureManagement.FeatureParameter>.class,
                        'featureParameters'
                    )
                }
            );
        }

        public override Boolean isInstanceOf(Object instance) {
            return instance instanceof TelemetryQueueable;
        }

        public override List<Object> getExpectedArguments() {
            return this.featureParameters;
        }

        public override Object getReturnValue() {
            return Void.class;
        }
    }
}
