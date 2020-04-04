@IsTest
private with sharing class InstallScript_TEST {
    private static TelemetryService_TEST.SendUsageMetrics sendUsageMetricsMethod;
    private static Stub telemetryServiceStub;
    private static TelemetryService telemetryService;
    private static InstallScript installScript = new InstallScript();

    @IsTest
    private static void shouldNotCallTelemetryServiceOnInstall() {
        setupTelemetryServiceStubWithNoMethods();
        Test.testInstall(installScript, null);

        telemetryServiceStub.assertMethodsCalled();
    }

    @IsTest
    private static void shouldCallTelemetryServiceOnUpdate() {
        setupTelemetryServiceStub();
        installScript.telemetryService = telemetryService;
        Test.testInstall(installScript, new Version(1, 0));

        telemetryServiceStub.assertMethodsCalled();
    }

    @IsTest
    private static void shouldCallTelemetryServiceOnPush() {
        setupTelemetryServiceStub();
        installScript.telemetryService = telemetryService;
        Test.testInstall(installScript, new Version(1, 0), true);

        telemetryServiceStub.assertMethodsCalled();
    }

    @IsTest
    private static void shouldSendEmailWhenExceptionIsThrown() {
        setupTelemetryServiceStub();
        sendUsageMetricsMethod.setExceptionThrownBeforeReturningValue(
            new TestException('Intentionally Exceptional')
        );
        installScript.telemetryService = telemetryService;

        Test.testInstall(installScript, new Version(1, 0), true);

        System.assertEquals(
            1,
            Limits.getEmailInvocations(),
            'Expected an email to be sent.'
        );
    }

    @IsTest
    private static void shouldCreateTelemetryServiceOnDemand() {
        Test.startTest();
        TelemetryService telemetryService = installScript.telemetryService;
        Test.stopTest();

        System.assertNotEquals(
            null,
            telemetryService,
            'Expected an instance of the telemetry service to be created.'
        );
    }

    // ----------     Helpers     ---------- //
    private static void setupTelemetryServiceStub() {
        sendUsageMetricsMethod = new TelemetryService_TEST.SendUsageMetrics();
        telemetryServiceStub = new Stub(new List<Stub.Method>{ sendUsageMetricsMethod });

        telemetryService = (TelemetryService) Test.createStub(
            TelemetryService.class,
            telemetryServiceStub
        );
    }

    private static void setupTelemetryServiceStubWithNoMethods() {
        sendUsageMetricsMethod = new TelemetryService_TEST.SendUsageMetrics();
        telemetryServiceStub = new Stub(new List<Stub.Method>());

        telemetryService = (TelemetryService) Test.createStub(
            TelemetryService.class,
            telemetryServiceStub
        );
    }

    private class TestException extends Exception {
    }
}
