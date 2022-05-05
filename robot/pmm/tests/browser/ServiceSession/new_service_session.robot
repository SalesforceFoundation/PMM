*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/ServiceSessionPageObject.py
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
    ${program} =                    API Create Program
    Set suite variable              ${program}
    ${service} =                    API Create Service                  ${Program}[Id]
    Set suite variable              ${service}
    ${service_schedule} =           API Create Service Schedule         ${service}[Id]
    Set suite variable              ${service_schedule}
    ${contact} =                    API Create Contact
    Set suite variable              ${contact}
    ${service_session_name} =       Generate New String
    Set suite variable              ${service_session_name}
    ${session_start} =              Get Current Date                    result_format=%-m/%-d/%Y 
    Set suite variable              ${session_start}

*** Test Cases ***
NSS1: Create a new service session
    [Documentation]                        Navigates to service session listing page, clicks 'New' on the listing page and
    ...                                    creates a new record, validates the details on the service session record
    [tags]                                 W-8294332   quadrant:Q2   perm:admin   perm:manage         feature:Service Session
     Go To Page                              Listing                                ${ns}ServiceSession__c
     Click Object Button                     New
     Load Page Object                        New                                    ServiceSession__c
     Populate Field                          Service Session Name                   ${service_session_name}
     Populate Lookup Field                   Service Schedule                       ${service_schedule}[Name]
     Populate Lookup Field                   Primary Service Provider               ${contact}[Name]
     Populate Lightning Fields               Status=Complete
     Select Session Date                     Session Start          Today
     Click Dialog Button                     Save
     Wait Until Modal Is Closed
     Verify Details                          Service Session Name        contains       ${service_session_name}
     Verify Details                          Session Start               contains       ${session_start}, 12:00 PM
     Verify Lookup Details                   Primary Service Provider    contains       ${contact}[Name]
     Verify Details                          Status                      contains       Complete
     Verify Page Contains Related List       Service Deliveries
