public inherited sharing class FeatureParameters {
    @TestVisible
     private enum DeveloperName {
        ACTIVE_PROGRAMS
    }
    @TestVisible
    private List<FeatureManagement.FeatureParameter> featureParameters = new List<FeatureManagement.FeatureParameter>();

    public List<FeatureManagement.FeatureParameter> getAll() {
        featureParameters.add(new ActivePrograms());

        return featureParameters;
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
}
