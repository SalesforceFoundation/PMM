*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/HomePageObject.py
Suite Setup     Run Keywords
...             Open test browser            useralias=${test_user}             AND
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser

*** Variables ***
${test_user}             UUser

*** Keywords ***
Setup Test Data
    ${ns} =                         Get PMM Namespace Prefix
    Set suite variable              ${ns}
    ${today} =                      Get Current Date        result_format=%Y-%m-%dT%H:%M:%S.%f   
    Set suite variable              ${today}
    ${future_date} =                Get Current Date               result_format=%-m/%-d/%Y          increment=5 days
    Set suite variable              ${future_date}
    ${end_date} =                   Get Current Date        result_format=%Y-%m-%dT%H:%M:%S.%f      increment=5 days
    Set suite variable              ${end_date}
    ${contact}                      API Create Contact
    Set suite variable              ${contact}
    ${program} =                    API Create Program
    Set suite variable              ${program}
    ${service} =                    API Create Service                  ${Program}[Id]
    Set suite variable              ${service}
    ${service_schedule} =           API Create Service Schedule         ${service}[Id]
    Set suite variable              ${service_schedule}
    ${service_session} =            API Create Service Session          ${service_schedule}[Id]     Pending
    Set suite variable              ${service_session}
    API Update Records              ${ns}ServiceSession__c              ${service_session}[Id]     ${ns}SessionStart__c=${today}
    API Update Records              ${ns}ServiceSession__c              ${service_session}[Id]      ${ns}SessionEnd__c=${end_date}

*** Test Cases ***
Today's tasks on homepage
    [Documentation]                 Go to homepage and validate 'Today's task' component is displayed
    [tags]                          W-037575   perm:admin   perm:manage   perm:deliver   perm:view   feature:Homepage
    Go to Page                      Home                    Homepage
    Verify Component On HomePage    Today’s Tasks

Recent Items on Homepage
    [Documentation]                 Go to homepage and validate 'Recent Items' component is displayed
    [tags]                          W-037575   perm:admin   perm:manage   perm:deliver   perm:view   feature:Homepage
    Go to Page                      Home                    Homepage
    Verify Component On HomePage    Recent Items

Add fields to recent sessions field_set
    [Documentation]                 Add fields to Recent Sessions fieldset and validate on recent sessions component
    [tags]                          T-3842208   perm:admin   perm:manage   feature:Homepage
    Run task                                add_fields_to_field_set
    ...                                     field_set=${ns}ServiceSession__c.${ns}RecentSessionsView
    ...                                     fields=${{ ["${ns}SessionEnd__c"]}}
    Go to Page                              Home                    Homepage
    Verify Recent Sessions Component Contains    ${future_date}
    