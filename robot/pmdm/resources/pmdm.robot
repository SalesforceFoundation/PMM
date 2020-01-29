*** Settings ***

Resource       cumulusci/robotframework/Salesforce.robot
Library        pmdm.py
Library        DateTime

*** Keywords ***
Go To PMDM App
    Open App Launcher
    Wait Until Element Is visible           //div[contains(@class,'slds-app-launcher__tile-body')]//a[ text()='Program Management']
    Click Link                              //div[contains(@class,'slds-app-launcher__tile-body')]//a[ text()='Program Management']

API Create Program
    [Arguments]      &{fields}
    ${program_name} =  Generate New String
    ${program_id} =  Salesforce Insert  Program__c
    ...               Name=${program_name}
    ...               ProgramIssueArea__c=Employment
    ...               Description__c=PMDM Robot Program
    ...               ShortSummary__c=created via API
    ...               TargetPopulation__c=Youth Target Population
    ...               Status__c=Active
    &{program} =     Salesforce Get  Program__c  ${program_id}
    Store Session Record    Program__c  ${program_id}
    [Return]         &{program}

API Create Contact
    [Arguments]      &{fields}
    ${first_name} =  Generate Random String
    ${last_name} =   Generate Random String
    ${legal_name} =  Generate Random String
    ${contact_id} =  Salesforce Insert  Contact
    ...                  FirstName=${first_name}
    ...                  LastName=${last_name}
    ...                  &{fields}
    &{contact} =     Salesforce Get  Contact  ${contact_id}
    Store Session Record      Contact  ${contact_id}
    [Return]         &{contact}

API Create Service
    [Arguments]      &{fields}
    ${service_name} =  Generate Random String
    ${service_id} =  Salesforce Insert  service
    ...                  Name=${service_name}
    ...                  ProgramId=${program}[Id]
    ...                  Description__c=PMDM Robot service
    ...                  UnitOfMeasurement__c=Hours
    ...                  Status__c=Active
    ...                  &{fields}
    &{service} =     Salesforce Get  service  ${service_id}
    Store Session Record      service  ${service_id}
    [Return]         &{service}

API Create Program Engagement
    [Arguments]      &{fields}
    ${program_engagement_name} =  Generate Random String
    ${program_engagement_id} =  Salesforce Insert  program_engagement
    ...                  Name=${program_engagement_name}
    ...                  ProgramId=${program}[Id]
    ...                  ContactId=${contact}[Id]
    ...                  Stage__c=Enrolled
    ...                  Role__c=Client
    ...                  &{fields}
    &{program_engagement} =     Salesforce Get  program_engagement  ${program_engagement_id}
    Store Session Record      program_engagement  ${program_engagement_id}
    [Return]         &{program_engagement}

API Create Account
    [Arguments]      &{fields}
    ${account_name} =        Generate Random String
    ${rt_id} =       Get Record Type Id  Account  Organization
    ${account_id} =  Salesforce Insert  Account
    ...                  Name=${account_name}
    ...                  RecordTypeId=${rt_id}
    ...                  &{fields}
    &{account} =     Salesforce Get  Account  ${account_id}
    [return]         &{account}