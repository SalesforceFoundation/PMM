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

API Create Service Schedule
    [Documentation]     Creates a new Service Schedule. Service Schedule details are passed as key value pairs.
    ${service_schedule_name} =   Generate Random String
    ${ns} =                      Get PMM Namespace Prefix
    ${session_start} =           Get Current Date     result_format=%Y-%m-%dT%H:%M:%S.%f
    [Arguments]                     ${service_id}    &{fields}
    ${service_schedule_id} =     Salesforce Insert  ${ns}ServiceSchedule__c
    ...                             Name=${service_schedule_name}
    ...                             ${ns}Service__c=${service_id}
    ...                             ${ns}FirstSessionStart__c=${session_start}
    ...                             &{fields}
    &{service_schedule} =       Salesforce Get  ${ns}ServiceSchedule__c  ${service_schedule_id}
    Store Session Record      ${ns}ServiceSchedule__c  ${service_schedule_id}
    [Return]            &{service_schedule}

API Create Service Session
    [Documentation]     Creates a new Service Session. Service Session details are passed as key value pairs.
    ${service_session_name} =   Generate Random String
    ${session_start} =          Get Current Date     result_format=%Y-%m-%dT%H:%M:%S.%f
    ${session_end} =            Get Current Date     increment=30   result_format=%Y-%m-%dT%H:%M:%S.%f
    ${ns} =                     Get PMM Namespace Prefix
    [Arguments]                 ${service_schedule_id}   ${status}     &{fields}
    ${service_session_id} =     Salesforce Insert  ${ns}ServiceSession__c
    ...                             Name=${service_session_name}
    ...                             ${ns}ServiceSchedule__c=${service_schedule_id}
    ...                             ${ns}SessionStart__c=${session_start}
    ...                             ${ns}SessionEnd__c=${session_end} 
    ...                             ${ns}Status__c=${status}
    &{service_session} =       Salesforce Get  ${ns}ServiceSession__c  ${service_session_id}
    Store Session Record      ${ns}ServiceSession__c  ${service_session_id}
    [Return]            &{service_session}

API Create Service Participant
    [Documentation]     Creates a new Service Participant. Service Participant details are passed as key value pairs.
    ${service_participant_name} =   Generate Random String
    ${ns} =                     Get PMM Namespace Prefix
    [Arguments]                 ${contact_id}  ${service_schedule_id}   ${service_id}   &{fields}
    ${service_participant_id} =     Salesforce Insert  ${ns}ServiceParticipant__c
    ...                             Name=${service_participant_name}
    ...                             ${ns}Contact__c=${contact_id}
    ...                             ${ns}ServiceSchedule__c=${service_schedule_id}
    ...                             ${ns}Service__c=${service_id}
    ...                             &{fields}
    &{service_participant} =       Salesforce Get  ${ns}ServiceParticipant__c  ${service_participant_id}
    Store Session Record      ${ns}ServiceParticipant__c  ${service_participant_id}
    [Return]            &{service_participant}

API Create Service Delivery
    [Documentation]     Creates a new Service Delivery record. Service Delivery details are passed as key value pairs.
    ${service_delivery_name} =   Generate Random String
    ${ns} =                     Get PMM Namespace Prefix
    [Arguments]                 ${contact_id}  ${program_engagement_id}   ${service_id}   &{fields}
    ${service_delivery_id} =     Salesforce Insert  ${ns}ServiceDelivery__c
    ...                             Name=${service_delivery_name}
    ...                             ${ns}Contact__c=${contact_id}
    ...                             ${ns}ProgramEngagement__c=${program_engagement_id}
    ...                             ${ns}Service__c=${service_id}
    &{service_delivery} =       Salesforce Get  ${ns}ServiceDelivery__c  ${service_delivery_id}
    Store Session Record      ${ns}ServiceDelivery__c  ${service_delivery_id}
    [Return]            &{service_delivery}

API Update Records
    [Documentation]         Updates the record based on the Id,field_name & field_value.
    [Arguments]             ${obj_name}    ${id}   &{fields}
    ${record} =             Salesforce Update  ${obj_name}   ${id}
    ...                     &{fields}
    @{records} =            Salesforce Query      ${obj_name}
    ...                         select=Id
    &{Id} =                 Get From List  ${records}  0
    [return]                &{Id}

Capture Screenshot and Delete Records and Close Browser
    [Documentation]         This keyword will capture a screenshot before closing the browser and deleting records when test fails
    Run Keyword If Any Tests Failed      Capture Page Screenshot
    Close Browser
    Delete Session Records
    