/* The below comments were created as part of https://github.com/SalesforceFoundation/PMM/pull/205. 
Refer to the PR for any additional reference.

When a new telemetry feature parameter needs to be added we need to modify this class and do the following : 
1. Create a featureParameter manually under the featureParameters folder. Make sure the file name of the new
featureParameter has the data type included. Refer to the existing featureParameter files in that folder.
2. Need to add a new DeveloperName enum.
3. Need to add a new when statement to the makeFeatureParameter method.
4. Need to create a new inner class similar to the other inner classes added for feature parameters and 
update the methods within the inner class accordingly
5. Modify FeatureParameters_TEST class to add tests for the newly created inner class*/

public without sharing class FeatureParameters {
    @TestVisible
    private enum DeveloperName {
        ACTIVE_PROGRAMS,
        ACTIVE_PROGRAMS_WITH_ENGAGEMENTS_LAST30,
        ACTIVE_PROGRAMS_WITH_SERVICE_DELIVERIES_LAST30,
        PERM_SET_DELIVER_USERS,
        PERM_SET_MANAGE_USERS
    }

    private static final String ACTIVE_PROGRAM_CONDITION =
        String.valueOf(Program__c.Status__c) +
        ' = ' +
        '\'Active\'';
    private static final String CREATED_LAST_30_CONDITION = 'CreatedDate = LAST_N_DAYS:30';
    private static final String PERMISSION_SET_NAME_CONDITION =
        String.valueOf(PermissionSet.SObjectType) +
        '.' +
        String.valueOf(PermissionSet.Name) +
        ' = ';
    @TestVisible
    private static final String DELIVER_PERMISSION = 'PMDM_Deliver';
    @TestVisible
    private static final String MANAGE_PERMISSION = 'PMDM_Manage';

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
            when ACTIVE_PROGRAMS_WITH_SERVICE_DELIVERIES_LAST30 {
                return new ActiveProgramsWithServiceDeliveriesLast30();
            }
            when PERM_SET_DELIVER_USERS {
                return new PermSetDeliverUsers();
            }
            when PERM_SET_MANAGE_USERS {
                return new PermSetManageUsers();
            }
            when else {
                return null;
            }
        }
    }

    @TestVisible
    private without sharing class ActivePrograms implements FeatureManagement.FeatureParameter {
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
    private without sharing class ActiveProgramsWithEngagementsLast30 implements FeatureManagement.FeatureParameter {
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

    @TestVisible
    private without sharing class ActiveProgramsWithServiceDeliveriesLast30 implements FeatureManagement.FeatureParameter {
        private string programField =
            ServiceDelivery__c.ProgramEngagement__c.getDescribe().getRelationshipName() +
            '.' +
            String.valueOf(ProgramEngagement__c.Program__c);

        private String activeServiceDelivery =
            ServiceDelivery__c.ProgramEngagement__c.getDescribe().getRelationshipName() +
            '.' +
            ProgramEngagement__c.Program__c.getDescribe().getRelationshipName() +
            '.' +
            String.valueOf(Program__c.Status__c) +
            ' = \'Active\'';

        @TestVisible
        private QueryBuilder queryBuilder {
            get {
                if (queryBuilder == null) {
                    queryBuilder = new QueryBuilder()
                        .withSObjectType(ServiceDelivery__c.SObjectType)
                        .withSelectFields(new List<String>{ programField })
                        .addCondition(activeServiceDelivery)
                        .addCondition(CREATED_LAST_30_CONDITION);
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
            return DeveloperName.ACTIVE_PROGRAMS_WITH_SERVICE_DELIVERIES_LAST30.name()
                .remove('_');
        }

        private Object getValue() {
            List<ServiceDelivery__c> serviceDeliveries = (List<ServiceDelivery__c>) finder.findRecords();
            Set<Id> programIds = new Set<Id>();
            for (ServiceDelivery__c serviceDelivery : serviceDeliveries) {
                programIds.add(serviceDelivery.programengagement__r.Program__c);
            }
            return programIds.size();
        }
    }

    @TestVisible
    private without sharing class PermSetDeliverUsers implements FeatureManagement.FeatureParameter {
        @TestVisible
        private QueryBuilder queryBuilder {
            get {
                if (queryBuilder == null) {
                    queryBuilder = new QueryBuilder()
                        .withSObjectType(User.SObjectType)
                        .addCondition(String.valueOf(User.IsActive) + ' = ' + 'true')
                        .addCondition(
                            ' Id IN (' +
                            buildAssignmentQuery(DELIVER_PERMISSION) +
                            ')'
                        )
                        .addCondition(
                            ' Id NOT IN (' +
                            buildAssignmentQuery(MANAGE_PERMISSION) +
                            ')'
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
            return DeveloperName.PERM_SET_DELIVER_USERS.name().remove('_');
        }

        private Object getValue() {
            return finder.findCount();
        }

        private String buildAssignmentQuery(String permissionSetName) {
            return new QueryBuilder()
                .withSObjectType(PermissionSetAssignment.SObjectType)
                .withSelectFields(
                    new List<String>{ String.valueOf(PermissionSetAssignment.AssigneeId) }
                )
                .addCondition(
                    PERMISSION_SET_NAME_CONDITION +
                    '\'' +
                    permissionSetName +
                    '\''
                )
                .buildSoqlQuery();
        }
    }

    @TestVisible
    private without sharing class PermSetManageUsers implements FeatureManagement.FeatureParameter {
        @TestVisible
        private QueryBuilder queryBuilder {
            get {
                if (queryBuilder == null) {
                    queryBuilder = new QueryBuilder()
                        .withSObjectType(PermissionSetAssignment.SObjectType)
                        .addCondition(
                            PERMISSION_SET_NAME_CONDITION +
                            '\'' +
                            MANAGE_PERMISSION +
                            '\''
                        )
                        .addCondition(
                            PermissionSetAssignment.AssigneeId.getDescribe()
                                .getRelationshipName() +
                            '.' +
                            String.valueOf(User.IsActive) +
                            ' = ' +
                            true
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
            return DeveloperName.PERM_SET_MANAGE_USERS.name().remove('_');
        }

        private Object getValue() {
            return finder.findCount();
        }
    }
}
