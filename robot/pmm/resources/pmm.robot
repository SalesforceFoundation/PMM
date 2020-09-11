*** Settings ***

Resource       cumulusci/robotframework/Salesforce.robot
Library        pmm.py
Library        DateTime

*** Keywords ***
Go To PMM App
    Open App Launcher
    Click App Link

API Create Program
    [Arguments]         &{fields}
    ${program_name} =   Generate New String
    ${ns} =             Get PMM Namespace Prefix
    ${program_id} =     Salesforce Insert  ${ns}Program__c
    ...                 Name=${program_name}
    ...                 ${ns}ProgramIssueArea__c=Employment
    ...                 ${ns}Description__c=PMM Robot Program
    ...                 ${ns}ShortSummary__c=created via API
    ...                 ${ns}TargetPopulation__c=Youth Target Population
    ...                 ${ns}Status__c=Active
    ...                 &{fields}
    &{program} =        Salesforce Get  ${ns}Program__c  ${program_id}
    Store Session Record    ${ns}Program__c  ${program_id}
    [Return]                &{program}

API Create Contact
    [Arguments]      &{fields}
    ${first_name} =  Generate Random String
    ${last_name} =   Generate Random String
    ${legal_name} =  Generate Random String
    ${contact_id} =  Salesforce Insert  Contact
    ...                  FirstName=${first_name}
    ...                  LastName=${last_name}
    ...                  &{fields}
    &{contact} =              Salesforce Get  Contact  ${contact_id}
    Store Session Record      Contact  ${contact_id}
    [Return]                  &{contact}

API Create Service
    ${service_name} =  Generate New String
    ${ns} =            Get PMM Namespace Prefix
    [Arguments]        ${program_id}  &{fields}
    ${service_id} =    Salesforce Insert  ${ns}Service__c
    ...                     Name=${service_name}
    ...                     ${ns}Program__c=${program_id}
    ...                     ${ns}Description__c=PMM Robot service
    ...                     ${ns}UnitOfMeasurement__c=Hours
    ...                     ${ns}Status__c=Active
    ...                     &{fields}
    &{service} =              Salesforce Get  ${ns}Service__c  ${service_id}
    Store Session Record      ${ns}Service__c  ${service_id}
    [Return]                  &{service}

API Create Program Engagement
    ${program_engagement_name} =  Generate Random String
    ${ns} =                       Get PMM Namespace Prefix
    [Arguments]                   ${program_id}     ${contact_id}   &{fields}
    ${program_engagement_id} =    Salesforce Insert  ${ns}ProgramEngagement__c
    ...                             Name=${program_engagement_name}
    ...                             ${ns}Program__c=${program_id}
    ...                             ${ns}Contact__c=${contact_id}
    ...                             ${ns}Stage__c=Enrolled
    ...                             ${ns}Role__c=Client
    ...                             &{fields}
    &{program_engagement} =     Salesforce Get  ${ns}ProgramEngagement__c  ${program_engagement_id}
    Store Session Record        ${ns}ProgramEngagement__c  ${program_engagement_id}
    [Return]                    &{program_engagement}

API Create Program Cohort
    ${program_cohort_name} =  Generate New String
    ${ns} =                   Get PMM Namespace Prefix
    [Arguments]               ${program_id}  &{fields}
    ${program_cohort_id} =  Salesforce Insert  ${ns}ProgramCohort__c
    ...                         Name=${program_cohort_name}
    ...                         ${ns}Status__c=Active
    ...                         ${ns}Program__c=${program_id}
    ...                         ${ns}Description__c=Robot program cohort created via API
    ...                         &{fields}
    &{program_cohort} =       Salesforce Get  ${ns}ProgramCohort__c  ${program_cohort_id}
    Store Session Record      ${ns}ProgramCohort__c  ${program_cohort_id}
    [Return]                  &{program_cohort}

API Create Account
    [Documentation]     Creates a new account. Account details are passed as key value pairs.
    [Arguments]         &{fields}
    ${account_name} =   Generate Random String
    ${account_id} =     Salesforce Insert  Account
    ...                     Name=${account_name}
    ...                     &{fields}
    &{account} =        Salesforce Get  Account  ${account_id}
    [Return]            &{account}

Capture Screenshot and Delete Records and Close Browser
    [Documentation]         This keyword will capture a screenshot before closing the browser and deleting records when test fails
    Run Keyword If Any Tests Failed      Capture Page Screenshot
    Close Browser
    Delete Session Records
    