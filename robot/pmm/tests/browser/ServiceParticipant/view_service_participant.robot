*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/pmm.py
...            robot/pmm/resources/ServiceParticipantPageObject.py
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
    ${contact}                      API Create Contact
    Set suite variable              ${contact}
    ${program} =                    API Create Program
    Set suite variable              ${program}
    ${service} =                    API Create Service                  ${Program}[Id]
    Set suite variable              ${service}
    ${service_schedule} =           API Create Service Schedule         ${service}[Id]
    Set suite variable              ${service_schedule}
    ${service_participant} =        API Create Service Participant      ${contact}[Id]    ${service_schedule}[Id]     ${service}[Id]
    Set suite variable              ${service_participant}


*** Test Cases ***
VSP1: View Perm Test for Service Participant
     [Documentation]                  Validates that New (Listing Page) and Edit buttons (Record Page) are not 
     ...                              displayed for Service Participant (View Perm Set) 
     [tags]                           unstable    quadrant:Q2   perm:view    feature:Service Participant
     Go To Page                              Listing                               ${ns}ServiceParticipant__c
     Page Should Not Contain Button          New
     Go To Page                              Details              ServiceParticipant__c                    object_id=${service_participant}[Id]
     Page Should Not Contain Button          Edit
