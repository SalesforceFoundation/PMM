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
        Integer ordinalValue = FeatureParameters.DeveloperName.ACTIVE_PROGRAMS.ordinal();

        BasicStub featureManagementStub = new BasicStub(FeatureManagement.class);
        FeatureManagement.instance = (FeatureManagement) featureManagementStub.createMock();

        List<FeatureManagement.FeatureParameter> allFeatureParameters = new FeatureParameters()
            .getAll();
        FeatureParameters.ActivePrograms activeProgramsParameter = (FeatureParameters.ActivePrograms) allFeatureParameters[
            ordinalValue
        ];
        BasicStub finderStub = new BasicStub(Finder.class)
            .withReturnValue('findCount', expectedValue);
        activeProgramsParameter.finder = (Finder) finderStub.createMock();

        Test.startTest();
        activeProgramsParameter.send();
        Test.stopTest();

        finderStub.assertCalled('findCount');
        featureManagementStub.assertCalledWith(
            'setPackageIntegerValue',
            new List<Type>{ String.class, Integer.class },
            new List<Object>{ expectedName, expectedValue }
        );
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
