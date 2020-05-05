@IsTest
public with sharing class FeatureParameters_TEST {
    private static final BasicStub featureManagementStub = new BasicStub(
        FeatureManagement.class
    );

    @TestSetup
    static void generateData() {
        ProgramTestDataFactory.insertTestData(true);
    }

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

        System.assert(!allFeatureParameters.contains(null));
    }

    @IsTest
    private static void shouldReturnNullForUndefinedParameters() {
        FeatureManagement.FeatureParameter featureParameter = new FeatureParameters()
            .makeFeatureParameter(null);

        System.assertEquals(
            null,
            featureParameter,
            'Expected null to be returned when dev enum is null.'
        );
    }

    @IsTest
    private static void shouldCallSetPackageIntegerByActivePrograms() {
        final String expectedName = FeatureParameters.DeveloperName.ACTIVE_PROGRAMS.name()
            .remove('_');
        final Integer expectedValue = 10;
        Integer ordinalValue = FeatureParameters.DeveloperName.ACTIVE_PROGRAMS.ordinal();

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
    private static void shouldCallSetPackageIntegerByActiveProgramsWithEngagementsLast30() {
        final String expectedName = FeatureParameters.DeveloperName.ACTIVE_PROGRAMS_WITH_ENGAGEMENTS_LAST30.name()
            .remove('_');
        final Integer expectedValue = 10;
        Integer ordinalValue = FeatureParameters.DeveloperName.ACTIVE_PROGRAMS_WITH_ENGAGEMENTS_LAST30.ordinal();

        FeatureManagement.instance = (FeatureManagement) featureManagementStub.createMock();

        List<FeatureManagement.FeatureParameter> allFeatureParameters = new FeatureParameters()
            .getAll();
        FeatureParameters.ActiveProgramsWithEngagementsLast30 activeProgramsWithEnagegmentsParameter = (FeatureParameters.ActiveProgramsWithEngagementsLast30) allFeatureParameters[
            ordinalValue
        ];
        BasicStub finderStub = new BasicStub(Finder.class)
            .withReturnValue('findCount', expectedValue);
        activeProgramsWithEnagegmentsParameter.finder = (Finder) finderStub.createMock();

        Test.startTest();
        activeProgramsWithEnagegmentsParameter.send();
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

    @IsTest
    private static void shouldPassActualActivePrograms() {
        List<Program__c> programs = [
            SELECT Id
            FROM Program__c
            WHERE Status__c = 'Active'
        ];
        System.assert(
            !programs.isEmpty(),
            'Sanity check: Test setup should have generated at least 1 active record.'
        );

        final String expectedName = FeatureParameters.DeveloperName.ACTIVE_PROGRAMS.name()
            .remove('_');
        final Integer expectedValue = programs.size();
        FeatureManagement.instance = (FeatureManagement) featureManagementStub.createMock();

        Test.startTest();
        new FeatureParameters.ActivePrograms().send();
        Test.stopTest();

        featureManagementStub.assertCalledWith(
            'setPackageIntegerValue',
            new List<Type>{ String.class, Integer.class },
            new List<Object>{ expectedName, expectedValue }
        );
    }

    @IsTest
    private static void shouldPassActualActiveProgramsWithEngagementsLast30() {
        List<Program__c> programs = [
            SELECT Id
            FROM Program__c
            WHERE
                Status__c = 'Active'
                AND Id IN (
                    SELECT Program__c
                    FROM ProgramEngagement__c
                    WHERE CreatedDate = LAST_N_DAYS:30
                )
        ];
        System.assert(
            !programs.isEmpty(),
            'Sanity check: Test setup should have generated at least 1 active record with a related program engagement.'
        );

        final String expectedName = FeatureParameters.DeveloperName.ACTIVE_PROGRAMS_WITH_ENGAGEMENTS_LAST30.name()
            .remove('_');
        final Integer expectedValue = programs.size();
        FeatureManagement.instance = (FeatureManagement) featureManagementStub.createMock();

        Test.startTest();
        new FeatureParameters.ActiveProgramsWithEngagementsLast30().send();
        Test.stopTest();

        featureManagementStub.assertCalledWith(
            'setPackageIntegerValue',
            new List<Type>{ String.class, Integer.class },
            new List<Object>{ expectedName, expectedValue }
        );
    }
}
