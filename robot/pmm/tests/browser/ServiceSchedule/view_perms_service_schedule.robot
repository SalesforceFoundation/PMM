*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/ServiceSchedulePageObject.py
...            robot/pmm/resources/ServicePageObject.py
Suite Setup     Run Keywords
...             Open test browser            useralias=${test_user}        AND
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser

*** Variables ***
${test_user}             UUser

*** Keywords ***
Setup Test Data
    [Documentation]                 Creates a Service Schedule, Service Participant and PE using API.
    ${ns} =                         Get PMM Namespace Prefix
    Set suite variable              ${ns}
    ${contact1}                     API Create Contact
    Set suite variable              ${contact1}
    ${contact2}                     API Create Contact
    Set suite variable              ${contact2}
    ${contact3}                     API Create Contact
    Set suite variable              ${contact3}
    ${program} =                    API Create Program
    Set suite variable              ${program}
    ${service} =                    API Create Service                  ${Program}[Id]
    Set suite variable              ${service}
    ${service_schedule} =           API Create Service Schedule         ${service}[Id]
    Set suite variable              ${service_schedule}
    ${program_engagement} =         API Create Program Engagement   ${Program}[Id]     ${contact1}[Id]
    Set suite variable              ${program_engagement}
    ${service_participant1} =       API Create Service Participant  ${contact1}[Id]   ${service_schedule}[Id]  ${service}[Id]
    Set suite variable              ${service_participant1}


*** Test Cases ***
VPSSS1: View Perms Add Service Participant quick action
    [Documentation]                        Logged in as a non admin user with view perm sets, navigates to service schedule details page, clicks on Add service
    ...                                    Participants quick action, and validates that a warning message is displayed
    [tags]                                 unstable   quadrant:Q2   perm:view      feature:Service Schedule 
    Go To Page                              Details                        ServiceSchedule__c           object_id=${service_schedule}[Id]
    Click Quick Action Button               Add More Participants
    Page Should Contain                     You don't have access to this information. Ask your admin for help.

    