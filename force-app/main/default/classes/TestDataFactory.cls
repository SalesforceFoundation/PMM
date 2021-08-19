/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

@IsTest
public with sharing class TestDataFactory {
    public static Account accountRecord;
    public static List<Contact> contacts;
    public static Contact contact1;
    public static Contact contact2;
    public static List<Program__c> programs;
    public static List<ProgramCohort__c> programCohorts;
    public static List<ProgramEngagement__c> engagements;
    public static ProgramEngagement__c engagement1;
    public static ProgramEngagement__c engagement2;
    public static List<Service__c> services;
    public static List<ServiceDelivery__c> serviceDeliveries;
    public static List<ServiceSchedule__c> serviceSchedules;
    public static List<ServiceSession__c> serviceSessions;
    public static List<ServiceParticipant__c> serviceParticipants;

    public static void requery() {
        contacts = [
            SELECT
                Id,
                NumPresentServiceDeliveries__c,
                NumAbsentServiceDeliveries__c,
                LastServiceDate__c,
                ConsecutiveAbsences__c,
                LastModifiedDate
            FROM Contact
        ];
        services = [
            SELECT Id, NumPresentServiceDeliveries__c, NumAbsentServiceDeliveries__c
            FROM Service__c
        ];
        serviceSessions = [
            SELECT
                Id,
                NumPresentServiceDeliveries__c,
                NumAbsentServiceDeliveries__c,
                SessionStart__c
            FROM ServiceSession__c
            ORDER BY SessionStart__c DESC
        ];
        engagements = [
            SELECT
                Id,
                NumPresentServiceDeliveries__c,
                NumAbsentServiceDeliveries__c,
                LastServiceDate__c,
                ConsecutiveAbsences__c
            FROM ProgramEngagement__c
        ];
    }

    public static void generateProgramData() {
        accountRecord = new Account();
        accountRecord.Name = 'Test Account';
        insert accountRecord;

        contacts = new List<Contact>();
        Contact contact1 = new Contact();
        contact1.LastName = 'Test Contact';
        contact1.AccountId = accountRecord.Id;
        contacts.add(contact1);

        Contact contact2 = new Contact();
        contact2.LastName = 'Test Contact';
        contact2.AccountId = accountRecord.Id;
        contacts.add(contact2);

        insert contacts;

        programs = new List<Program__c>();
        Program__c program1 = new Program__c();
        program1.Name = 'Program 1';
        program1.Status__c = 'Active';
        program1.StartDate__c = Date.today();
        program1.EndDate__c = Date.today().addDays(30);
        programs.add(program1);

        Program__c program2 = new Program__c();
        program2.Name = 'Program 2';
        program2.Status__c = 'Active';
        program2.StartDate__c = Date.today();
        program2.EndDate__c = Date.today().addDays(90);
        programs.add(program2);

        insert programs;

        programCohorts = new List<ProgramCohort__c>();
        ProgramCohort__c cohort1 = new ProgramCohort__c();
        cohort1.Name = 'Cohort 1';
        cohort1.Program__c = program1.Id;
        cohort1.StartDate__c = System.today();
        cohort1.Status__c = 'Active';
        programCohorts.add(cohort1);

        ProgramCohort__c cohort2 = new ProgramCohort__c();
        cohort2.Name = 'Cohort 2';
        cohort2.Program__c = program2.Id;
        cohort2.StartDate__c = System.today();
        cohort2.Status__c = 'Active';
        programCohorts.add(cohort2);

        insert programCohorts;

        engagements = new List<ProgramEngagement__c>();

        ProgramEngagement__c engagement1 = new ProgramEngagement__c();
        engagement1.Name = 'Engagement 1';
        engagement1.Stage__c = 'Enrolled';
        engagement1.Contact__c = contact1.Id;
        engagement1.Program__c = program1.Id;
        engagement1.Role__c = 'Client';
        engagement1.ProgramCohort__c = cohort1.Id;
        engagements.add(engagement1);

        ProgramEngagement__c engagement2 = new ProgramEngagement__c();
        engagement2.Name = 'Engagement 2';
        engagement2.Stage__c = 'Enrolled';
        engagement2.Contact__c = contact1.Id;
        engagement2.Program__c = program2.Id;
        engagement2.Role__c = 'Client';
        engagements.add(engagement2);

        insert engagements;
    }

    public static void generateServiceData() {
        generateProgramData();

        services = new List<Service__c>();
        Service__c service1 = new Service__c();
        service1.Name = 'Service 1';
        service1.Program__c = programs[0].Id;
        service1.Status__c = 'Active';
        service1.UnitOfMeasurement__c = 'Hours';
        services.add(service1);

        Service__c service2 = new Service__c();
        service2.Name = 'Service 2';
        service2.Program__c = programs[1].Id;
        service2.Status__c = 'Active';
        service2.UnitOfMeasurement__c = 'Days';
        services.add(service2);

        insert services;

        serviceDeliveries = new List<ServiceDelivery__c>();
        ServiceDelivery__c serviceDelivery1 = new ServiceDelivery__c();
        serviceDelivery1.ProgramEngagement__c = engagements[0].Id;
        serviceDelivery1.Contact__c = contacts[0].Id;
        serviceDelivery1.DeliveryDate__c = System.today();
        serviceDelivery1.Quantity__c = 10;
        serviceDelivery1.Service__c = service1.Id;
        serviceDeliveries.add(serviceDelivery1);

        ServiceDelivery__c serviceDelivery2 = new ServiceDelivery__c();
        serviceDelivery2.ProgramEngagement__c = engagements[1].Id;
        serviceDelivery2.Contact__c = contacts[0].Id;
        serviceDelivery2.DeliveryDate__c = System.today() - 2;
        serviceDelivery2.AttendanceStatus__c = 'Present';
        serviceDelivery2.Quantity__c = 3;
        serviceDelivery2.Service__c = service2.Id;
        serviceDeliveries.add(serviceDelivery2);

        insert serviceDeliveries;
    }

    public static void generateAttendanceData(String frequency) {
        generateServiceData();

        DateTime nextMonth = DateTime.newInstance(
            System.today().year(),
            System.today().month() + 1,
            1
        );

        DateTime currentDate = System.now();

        if (frequency == 'Monthly') {
            generateServiceScheduleData('Monthly', nextMonth);
        } else if (frequency == 'Daily') {
            generateServiceScheduleData(frequency, currentDate);
        }

        generateServiceSessionData();

        serviceDeliveries[0].ServiceSession__c = serviceSessions[0].Id;
        update serviceDeliveries[0];

        generateServiceParticipantData();
    }

    public static void generateServiceScheduleData(
        String frequency,
        DateTime sessionStart
    ) {
        serviceSchedules = new List<ServiceSchedule__c>();
        serviceSchedules.add(
            new ServiceSchedule__c(
                Name = 'Payday',
                Frequency__c = frequency,
                FirstSessionStart__c = sessionStart,
                FirstSessionEnd__c = sessionStart.addHours(24),
                PrimaryServiceProvider__c = contacts[0].Id,
                OtherServiceProvider__c = contacts[0].Id,
                Service__c = services[0].Id
            )
        );
        insert serviceSchedules;
    }

    public static void generateServiceSessionData() {
        serviceSessions = new List<ServiceSession__c>();
        serviceSessions.add(
            new ServiceSession__c(
                ServiceSchedule__c = serviceSchedules[0].Id,
                SessionStart__c = serviceSchedules[0].FirstSessionStart__c,
                SessionEnd__c = serviceSchedules[0].FirstSessionEnd__c,
                PrimaryServiceProvider__c = serviceSchedules[0].PrimaryServiceProvider__c,
                OtherServiceProvider__c = serviceSchedules[0].OtherServiceProvider__c,
                Status__c = 'Pending'
            )
        );
        serviceSessions.add(
            new ServiceSession__c(
                ServiceSchedule__c = serviceSchedules[0].Id,
                SessionStart__c = serviceSchedules[0].FirstSessionStart__c.addDays(1),
                SessionEnd__c = serviceSchedules[0].FirstSessionEnd__c,
                PrimaryServiceProvider__c = serviceSchedules[0].PrimaryServiceProvider__c,
                OtherServiceProvider__c = serviceSchedules[0].OtherServiceProvider__c,
                Status__c = 'Complete'
            )
        );
        serviceSessions.add(
            new ServiceSession__c(
                ServiceSchedule__c = serviceSchedules[0].Id,
                SessionStart__c = serviceSchedules[0].FirstSessionStart__c.addDays(1),
                SessionEnd__c = serviceSchedules[0].FirstSessionEnd__c,
                PrimaryServiceProvider__c = serviceSchedules[0].PrimaryServiceProvider__c,
                OtherServiceProvider__c = serviceSchedules[0].OtherServiceProvider__c,
                Status__c = 'Canceled'
            )
        );
        insert serviceSessions;
    }

    public static void generateServiceParticipantData() {
        serviceParticipants = new List<ServiceParticipant__c>();
        serviceParticipants.add(
            new ServiceParticipant__c(
                Name = 'Test Participant 1',
                Contact__c = contacts[0].Id,
                ProgramEngagement__c = engagements[0].Id,
                Service__c = services[0].Id,
                ServiceSchedule__c = serviceSchedules[0].Id,
                SignUpDate__c = System.today()
            )
        );

        serviceParticipants.add(
            new ServiceParticipant__c(
                Name = 'Test Participant 2',
                Contact__c = contacts[1].Id,
                ProgramEngagement__c = engagements[1].Id,
                Service__c = services[0].Id,
                ServiceSchedule__c = serviceSchedules[0].Id,
                SignUpDate__c = System.today()
            )
        );

        insert serviceParticipants;
    }
}
