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
    ${service_name} =  Generate New String
    [Arguments]       ${program_id}  &{fields}
    ${service_id} =  Salesforce Insert  Service__c
    ...                  Name=${service_name}
    ...                  Program__c=${program_id}
    ...                  Description__c=PMDM Robot service
    ...                  UnitOfMeasurement__c=Hours
    ...                  Status__c=Active
    ...                  &{fields}
    &{service} =     Salesforce Get  Service__c  ${service_id}
    Store Session Record      Service__c  ${service_id}
    [Return]         &{service}

API Create Program Engagement
    ${program_engagement_name} =  Generate Random String
    [Arguments]       ${program_id}     ${contact_id}   &{fields}
    ${program_engagement_id} =  Salesforce Insert  ProgramEngagement__c
    ...                  Name=${program_engagement_name}
    ...                  Program__c=${program_id}
    ...                  Contact__c=${contact_id}
    ...                  Stage__c=Enrolled
    ...                  Role__c=Client
    ...                  &{fields}
    &{program_engagement} =     Salesforce Get  ProgramEngagement__c  ${program_engagement_id}
    Store Session Record      ProgramEngagement__c  ${program_engagement_id}
    [Return]         &{program_engagement}

API Create Program Cohort
    ${program_cohort_name} =  Generate New String
    [Arguments]       ${program_id}  &{fields}
    ${program_cohort_id} =  Salesforce Insert  ProgramCohort__c
    ...                  Name=${program_cohort_name}
    ...                  Status__c=Active
    ...                  Program__c=${program_id}
    ...                  Description__c=Robot program cohort created via API
    ...                  &{fields}
    &{program_cohort} =     Salesforce Get  ProgramCohort__c  ${program_cohort_id}
    Store Session Record      ProgramCohort__c  ${program_cohort_id}
    [Return]         &{program_cohort}