/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

/* The below comments were created as part of https://github.com/SalesforceFoundation/PMM/pull/205. 
Refer to the PR for any additional reference.

When a new telemetry feature parameter needs to be added we need to modify this class and do the following : 
1. Create a featureParameter manually under the featureParameters folder. Make sure the file name of the new
featureParameter has the data type included. Refer to the existing featureParameter files in that folder.
2. Need to add a new DeveloperName enum.
3. Need to add a new when statement to the end of the makeFeatureParameter method.
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
        PERM_SET_MANAGE_USERS,
        ATTENDANCE_SERVICE_DELIVERIES_LAST30,
        ACTIVE_PROGRAMS_WITH_COHORTS,
        ACTIVE_PROGRAMS_WITH_ACTIVE_SERVICES,
        ACTIVE_SERVICES,
        ACTIVE_SERVICES_WITH_SERVICE_SCHEDULES,
        SERVICE_SCHEDULES_WITH_SESSIONS
    }

    private static final String ACTIVE_PROGRAM_CONDITION =
        String.valueOf(Program__c.Status__c) +
        ' = ' +
        '\'Active\'';
    private static final String ACTIVE_SERVICE_CONDITION =
        String.valueOf(Service__c.Status__c) +
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
            when ATTENDANCE_SERVICE_DELIVERIES_LAST30 {
                return new AttendanceServiceDeliveriesLast30();
            }
            when ACTIVE_PROGRAMS_WITH_COHORTS {
                return new ActiveProgramsWithCohorts();
            }
            when ACTIVE_PROGRAMS_WITH_ACTIVE_SERVICES {
                return new ActiveProgramsWithActiveServices();
            }
            when ACTIVE_SERVICES {
                return new ActiveServices();
            }
            when ACTIVE_SERVICES_WITH_SERVICE_SCHEDULES {
                return new ActiveServicesWithServiceSchedules();
            }
            when SERVICE_SCHEDULES_WITH_SESSIONS {
                return new ServiceSchedulesWithSessions();
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
    private without sharing class ActiveProgramsWithCohorts implements FeatureManagement.FeatureParameter {
        @TestVisible
        private QueryBuilder queryBuilder {
            get {
                if (queryBuilder == null) {
                    queryBuilder = new QueryBuilder()
                        .withSObjectType(Program__c.SObjectType)
                        .addCondition(ACTIVE_PROGRAM_CONDITION)
                        .addCondition('Id IN (' + buildProgramCohortQuery() + ')');
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
            return DeveloperName.ACTIVE_PROGRAMS_WITH_COHORTS.name().remove('_');
        }

        private Object getValue() {
            return finder.findCount();
        }

        private String buildProgramCohortQuery() {
            return new QueryBuilder()
                .withSObjectType(ProgramCohort__c.SObjectType)
                .withSelectFields(
                    new List<String>{ String.valueOf(ProgramCohort__c.Program__c) }
                )
                .buildSoqlQuery();
        }
    }

    @TestVisible
    private without sharing class ActiveServices implements FeatureManagement.FeatureParameter {
        @TestVisible
        private QueryBuilder queryBuilder {
            get {
                if (queryBuilder == null) {
                    queryBuilder = new QueryBuilder()
                        .withSObjectType(Service__c.SObjectType)
                        .addCondition(ACTIVE_SERVICE_CONDITION);
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
            return DeveloperName.ACTIVE_SERVICES.name().remove('_');
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
    private without sharing class ActiveProgramsWithActiveServices implements FeatureManagement.FeatureParameter {
        @TestVisible
        private QueryBuilder queryBuilder {
            get {
                if (queryBuilder == null) {
                    queryBuilder = new QueryBuilder()
                        .withSObjectType(Program__c.SObjectType)
                        .addCondition(ACTIVE_PROGRAM_CONDITION)
                        .addCondition('Id IN (' + buildActiveServicesQuery() + ')');
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
            return DeveloperName.ACTIVE_PROGRAMS_WITH_ACTIVE_SERVICES.name().remove('_');
        }

        private Object getValue() {
            return finder.findCount();
        }

        private String buildActiveServicesQuery() {
            return new QueryBuilder()
                .withSObjectType(Service__c.SObjectType)
                .withSelectFields(
                    new List<String>{ String.valueOf(Service__c.Program__c) }
                )
                .addCondition(ACTIVE_SERVICE_CONDITION)
                .buildSoqlQuery();
        }
    }

    @TestVisible
    private without sharing class ActiveProgramsWithServiceDeliveriesLast30 implements FeatureManagement.FeatureParameter {
        private string programField = String.valueOf(ProgramEngagement__c.Program__c);

        private String activeProgram =
            ProgramEngagement__c.Program__c.getDescribe().getRelationshipName() +
            '.' +
            String.valueOf(Program__c.Status__c) +
            ' = \'Active\'';

        @TestVisible
        private QueryBuilder queryBuilder {
            get {
                if (queryBuilder == null) {
                    queryBuilder = new QueryBuilder()
                        .withSObjectType(ProgramEngagement__c.SObjectType)
                        .withSelectFields(new List<String>{ programField })
                        .addCondition(activeProgram)
                        .addCondition('Id IN (' + buildServiceDeliveryQuery() + ')');
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
            Set<Id> programIds = new Set<Id>();

            for (
                ProgramEngagement__c programEngagement : (List<ProgramEngagement__c>) finder.findRecords()
            ) {
                programIds.add(programEngagement.Program__c);
            }

            return programIds.size();
        }

        private String buildServiceDeliveryQuery() {
            return new QueryBuilder()
                .withSObjectType(ServiceDelivery__c.SObjectType)
                .withSelectFields(
                    new List<String>{
                        String.valueOf(ServiceDelivery__c.ProgramEngagement__c)
                    }
                )
                .addCondition(CREATED_LAST_30_CONDITION)
                .buildSoqlQuery();
        }
    }

    @TestVisible
    private without sharing class ActiveServicesWithServiceSchedules implements FeatureManagement.FeatureParameter {
        @TestVisible
        private QueryBuilder queryBuilder {
            get {
                if (queryBuilder == null) {
                    queryBuilder = new QueryBuilder()
                        .withSObjectType(Service__c.SObjectType)
                        .addCondition(ACTIVE_SERVICE_CONDITION)
                        .addCondition('Id IN (' + buildServiceScheduleQuery() + ')');
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
            return DeveloperName.ACTIVE_SERVICES_WITH_SERVICE_SCHEDULES.name()
                .remove('_');
        }

        private Object getValue() {
            return finder.findCount();
        }

        private String buildServiceScheduleQuery() {
            return new QueryBuilder()
                .withSObjectType(ServiceSchedule__c.SObjectType)
                .withSelectFields(
                    new List<String>{ String.valueOf(ServiceSchedule__c.Service__c) }
                )
                .buildSoqlQuery();
        }
    }

    @TestVisible
    private without sharing class ServiceSchedulesWithSessions implements FeatureManagement.FeatureParameter {
        @TestVisible
        private QueryBuilder queryBuilder {
            get {
                if (queryBuilder == null) {
                    queryBuilder = new QueryBuilder()
                        .withSObjectType(ServiceSchedule__c.SObjectType)
                        .addCondition('Id IN (' + buildSessionsQuery() + ')');
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
            return DeveloperName.SERVICE_SCHEDULES_WITH_SESSIONS.name().remove('_');
        }

        private Object getValue() {
            return finder.findCount();
        }

        private String buildSessionsQuery() {
            return new QueryBuilder()
                .withSObjectType(ServiceSession__c.SObjectType)
                .withSelectFields(
                    new List<String>{
                        String.valueOf(ServiceSession__c.ServiceSchedule__c)
                    }
                )
                .addCondition(
                    String.valueOf(ServiceSession__c.SessionStart__c) + ' > TODAY'
                )
                .buildSoqlQuery();
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

    @TestVisible
    private without sharing class AttendanceServiceDeliveriesLast30 implements FeatureManagement.FeatureParameter {
        private String attendanceStatusField = String.valueOf(
            ServiceDelivery__c.AttendanceStatus__c
        );

        private String serviceDeliveryIdField = String.valueOf(ServiceDelivery__c.Id);

        private String attendanceStatusServiceDelivery =
            String.valueOf(ServiceDelivery__c.AttendanceStatus__c) +
            ' IN' +
            getAttendanceStatusPicklistValues();

        @TestVisible
        private QueryBuilder queryBuilder {
            get {
                if (queryBuilder == null) {
                    queryBuilder = new QueryBuilder()
                        .withSObjectType(ServiceDelivery__c.SObjectType)
                        .withSelectFields(
                            new List<String>{
                                serviceDeliveryIdField,
                                attendanceStatusField
                            }
                        )
                        .addCondition(attendanceStatusServiceDelivery)
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
            return DeveloperName.ATTENDANCE_SERVICE_DELIVERIES_LAST30.name().remove('_');
        }

        private Object getValue() {
            return finder.findCount();
        }

        public List<String> getAttendanceStatusPicklistValues() {
            List<String> attendanceStatusOptions = new List<String>();

            for (
                Schema.PicklistEntry ple : ServiceDelivery__c.AttendanceStatus__c.getDescribe()
                    .getPicklistValues()
            ) {
                attendanceStatusOptions.add('\'' + ple.getValue() + '\'');
            }

            return attendanceStatusOptions;
        }
    }
}
