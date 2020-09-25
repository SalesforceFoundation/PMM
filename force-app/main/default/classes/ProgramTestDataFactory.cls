/*
 *
 *  * Copyright (c) 2020, salesforce.com, inc.
 *  * All rights reserved.
 *  * SPDX-License-Identifier: BSD-3-Clause
 *  * For full license text, see the LICENSE file in the repo root or https://opensource.org/licenses/BSD-3-Clause
 *
 */

public with sharing class ProgramTestDataFactory {
    public static void insertTestData(Boolean addServices) {
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;

        Contact con1 = new Contact();
        con1.LastName = 'Test Contact';
        con1.AccountId = acc.Id;
        insert con1;

        Contact con2 = new Contact();
        con2.LastName = 'Test Contact';
        con2.AccountId = acc.Id;
        insert con2;

        List<Program__c> programs = new List<Program__c>();
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

        List<ProgramCohort__c> programCohorts = new List<ProgramCohort__c>();
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

        List<ProgramEngagement__c> engagements = new List<ProgramEngagement__c>();

        ProgramEngagement__c engagement1 = new ProgramEngagement__c();
        engagement1.Name = 'Engagement 1';
        engagement1.Stage__c = 'Enrolled';
        engagement1.Contact__c = con1.Id;
        engagement1.Program__c = program1.Id;
        engagement1.Role__c = 'Client';
        engagement1.ProgramCohort__c = cohort1.Id;
        engagements.add(engagement1);

        ProgramEngagement__c engagement2 = new ProgramEngagement__c();
        engagement2.Name = 'Engagement 2';
        engagement2.Stage__c = 'Enrolled';
        engagement2.Contact__c = con1.Id;
        engagement2.Program__c = program2.Id;
        engagement2.Role__c = 'Client';
        engagements.add(engagement2);

        insert engagements;

        if (addServices) {
            List<Service__c> services = new List<Service__c>();

            Service__c service1 = new Service__c();
            service1.Name = 'Service 1';
            service1.Program__c = program1.Id;
            service1.Status__c = 'Active';
            service1.UnitOfMeasurement__c = 'Hours';
            services.add(service1);

            Service__c service2 = new Service__c();
            service2.Name = 'Service 2';
            service2.Program__c = program2.Id;
            service2.Status__c = 'Active';
            service2.UnitOfMeasurement__c = 'Days';
            services.add(service2);

            insert services;

            List<ServiceDelivery__c> serviceDeliveries = new List<ServiceDelivery__c>();

            ServiceDelivery__c serviceDelivery1 = new ServiceDelivery__c();
            serviceDelivery1.ProgramEngagement__c = engagement1.Id;
            serviceDelivery1.Contact__c = con1.Id;
            serviceDelivery1.DeliveryDate__c = System.today();
            serviceDelivery1.Quantity__c = 10;
            serviceDelivery1.Service__c = service1.Id;
            serviceDeliveries.add(serviceDelivery1);

            insert serviceDeliveries;
        }
    }
}
