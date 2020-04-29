public inherited sharing class FeatureParameters {
    @TestVisible
     private enum DeveloperName {
        ACTIVE_PROGRAMS,
        ACTIVE_PROGRAMS_WITH_ENGAGEMENTS_LAST30
    }
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
                        .withCondition(
                            String.valueOf(Program__c.Status__c) +
                            ' = ' +
                            '\'Active\''
                        );
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
                        .withConditions(buildConditions());
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

        private List<String> buildConditions() {
            List<String> conditions = new List<String>();
            String programEngagementQuery = new QueryBuilder()
                .withSObjectType(ProgramEngagement__c.SObjectType)
                .withSelectFields(
                    new List<String>{ String.valueOf(ProgramEngagement__c.Program__c) }
                )
                .withCondition('CreatedDate = LAST_N_DAYS:30')
                .buildSoqlQuery();
            conditions.add(String.valueOf(Program__c.Status__c) + ' = ' + '\'Active\'');
            conditions.add('Id IN (' + programEngagementQuery + ')');

            return conditions;
        }
    }
}
