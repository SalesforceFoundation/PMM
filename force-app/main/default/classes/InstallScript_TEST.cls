@IsTest
private with sharing class InstallScript_TEST {
    private static BasicStub telemetryServiceStub = new BasicStub(TelemetryService.class);
    private static TelemetryService telemetryService;
    private static InstallScript installScript = new InstallScript();

    @IsTest
    private static void shouldNotCallTelemetryServiceOnInstall() {
        telemetryService = (TelemetryService) telemetryServiceStub.createMock();
        Test.testInstall(installScript, null);

        telemetryServiceStub.assertNotCalled('sendUsageMetrics');
    }

    @IsTest
    private static void shouldCallTelemetryServiceOnUpdate() {
        telemetryService = (TelemetryService) telemetryServiceStub.createMock();
        installScript.telemetryService = telemetryService;
        Test.testInstall(installScript, new Version(1, 0));

        telemetryServiceStub.assertCalled('sendUsageMetrics');
    }

    @IsTest
    private static void shouldCallTelemetryServiceOnPush() {
        telemetryService = (TelemetryService) telemetryServiceStub.createMock();
        installScript.telemetryService = telemetryService;
        Test.testInstall(installScript, new Version(1, 0), true);

        telemetryServiceStub.assertCalled('sendUsageMetrics');
    }

    @IsTest
    private static void shouldSendEmailWhenExceptionIsThrown() {
        telemetryServiceStub.withThrowException('sendUsageMetrics');
        telemetryService = (TelemetryService) telemetryServiceStub.createMock();
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
}
