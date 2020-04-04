@IsTest
public with sharing class FeatureParameters_TEST {
    @IsTest
    private static void shouldRetrunAllParameters() {
        List<FeatureManagement.FeatureParameter> allFeatureParameters = new FeatureParameters()
            .getAll();

        System.assertEquals(
            FeatureParameters.DeveloperName.values().size(),
            allFeatureParameters.size(),
            'Expected all feature parameters to be returned.'
        );

        System.assert(
            !allFeatureParameters.isEmpty(),
            'Expected at least one feature parameter to be returned.'
        );
    }

    @IsTest
    private static void shouldCallSetPackageIntegerByActivePrograms() {
        final String expectedName = FeatureParameters.DeveloperName.ACTIVE_PROGRAMS.name()
            .remove('_');
        final Integer expectedValue = 10;
        final Integer ordinalValue = FeatureParameters.DeveloperName.ACTIVE_PROGRAMS.ordinal();

        Finder_Test.FindCount findCountMethod = new Finder_Test.FindCount();
        findCountMethod.returnValue = expectedValue;
        final Stub finderStub = new Stub(new List<Stub.Method>{ findCountMethod });

        FeatureManagement_TEST.SetPackageIntegerValue setPackageIntegerValueMethod = new FeatureManagement_TEST.SetPackageIntegerValue();
        setPackageIntegerValueMethod.apiName = expectedName;
        setPackageIntegerValueMethod.value = expectedValue;
        final Stub featureManagementStub = new Stub(
            new List<Stub.Method>{ setPackageIntegerValueMethod }
        );
        FeatureManagement.instance = (FeatureManagement) Test.createStub(
            FeatureManagement.class,
            featureManagementStub
        );

        List<FeatureManagement.FeatureParameter> allFeatureParameters = new FeatureParameters()
            .getAll();
        FeatureParameters.ActivePrograms activeProgramsParameter = (FeatureParameters.ActivePrograms) allFeatureParameters[
            ordinalValue
        ];
        activeProgramsParameter.finder = (Finder) Test.createStub(
            Finder.class,
            finderStub
        );

        Test.startTest();
        activeProgramsParameter.send();
        Test.stopTest();

        finderStub.assertMethodsCalled();
        featureManagementStub.assertMethodsCalled();
    }

    @IsTest
    private static void shouldCreateTheQueryBuilderOnDemand() {
        QueryBuilder queryBuilder = new FeatureParameters.ActivePrograms().queryBuilder;

        System.assertNotEquals(
            null,
            queryBuilder,
            'Expected the queryBuilder to auto create on demand.'
        );
    }

    @IsTest
    private static void shouldCreateTheFinderOnDemand() {
        Finder finder = new FeatureParameters.ActivePrograms().finder;

        System.assertNotEquals(
            null,
            finder,
            'Expected the finder to auto create on demand.'
        );
    }
}
