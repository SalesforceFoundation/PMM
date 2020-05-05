public inherited sharing class FeatureParameters {
    @TestVisible
     private enum DeveloperName {
        ACTIVE_PROGRAMS,
        ACTIVE_PROGRAMS_WITH_ENGAGEMENTS_LAST30
    }

    private static final String ACTIVE_PROGRAM_CONDITION =
        String.valueOf(Program__c.Status__c) +
        ' = ' +
        '\'Active\'';

    private static final String CREATED_LAST_30_CONDITION = 'CreatedDate = LAST_N_DAYS:30';

    @TestVisible
    private List<FeatureManagement.FeatureParameter> featureParameters = new List<FeatureManagement.FeatureParameter>();

    public List<FeatureManagement.FeatureParameter> getAll() {
        for (DeveloperName devName : DeveloperName.values()) {
            featureParameters.add(makeFeatureParameter(devName));
        }

        return featureParameters;
    }

    @TestVisible
    private FeatureManagement.FeatureParameter makeFeatureParameter(
        DeveloperName devName
    ) {
        switch on devName {
            when ACTIVE_PROGRAMS {
                return new ActivePrograms();
            }
            when ACTIVE_PROGRAMS_WITH_ENGAGEMENTS_LAST30 {
                return new ActiveProgramsWithEngagementsLast30();
            }
            when else {
                return null;
            }
        }
    }

    @TestVisible
    private inherited sharing class ActivePrograms implements FeatureManagement.FeatureParameter {
        @TestVisible
        private QueryBuilder queryBuilder {
            get {
                if (queryBuilder == null) {
                    queryBuilder = new QueryBuilder()
                        .withSObjectType(Program__c.SObjectType)
                        .addCondition(ACTIVE_PROGRAM_CONDITION);
                }

                return queryBuilder;
            }
            set;
        }
        @TestVisible
        private Finder finder {
            get {
                if (finder == null) {
                    finder = new Finder(queryBuilder);
                }

                return finder;
            }
            set;
        }

        public void send() {
            final Object value = getValue();

            if (value instanceof Integer) {
                FeatureManagement.getInstance()
                    .setPackageIntegerValue(getName(), (Integer) value);
            }
        }

        private String getName() {
            return DeveloperName.ACTIVE_PROGRAMS.name().remove('_');
        }

        private Object getValue() {
            return finder.findCount();
        }
    }

    @TestVisible
    private inherited sharing class ActiveProgramsWithEngagementsLast30 implements FeatureManagement.FeatureParameter {
        @TestVisible
        private QueryBuilder queryBuilder {
            get {
                if (queryBuilder == null) {
                    queryBuilder = new QueryBuilder()
                        .withSObjectType(Program__c.SObjectType)
                        .addCondition(ACTIVE_PROGRAM_CONDITION)
                        .addCondition('Id IN (' + buildProgramEngagementQuery() + ')');
                }

                return queryBuilder;
            }
            set;
        }
        @TestVisible
        private Finder finder {
            get {
                if (finder == null) {
                    finder = new Finder(queryBuilder);
                }

                return finder;
            }
            set;
        }

        public void send() {
            final Object value = getValue();

            if (value instanceof Integer) {
                FeatureManagement.getInstance()
                    .setPackageIntegerValue(getName(), (Integer) value);
            }
        }

        private String getName() {
            return DeveloperName.ACTIVE_PROGRAMS_WITH_ENGAGEMENTS_LAST30.name()
                .remove('_');
        }

        private Object getValue() {
            return finder.findCount();
        }

        private String buildProgramEngagementQuery() {
            return new QueryBuilder()
                .withSObjectType(ProgramEngagement__c.SObjectType)
                .withSelectFields(
                    new List<String>{ String.valueOf(ProgramEngagement__c.Program__c) }
                )
                .addCondition(CREATED_LAST_30_CONDITION)
                .buildSoqlQuery();
        }
    }
}
