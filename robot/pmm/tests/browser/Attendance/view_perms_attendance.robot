*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/ServiceSessionPageObject.py
...            robot/pmm/resources/BulkServiceDeliveryPageObject.py
Suite Setup     Run Keywords
...             Open test browser            useralias=${test_user}             AND
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser

*** Variables ***
${test_user}             UUser

*** Keywords ***
Setup Test Data
    [Documentation]                 Creates contact, service participant and service session using API
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
    ${service_session1} =           API Create Service Session          ${service_schedule}[Id]     Pending
    Set suite variable              ${service_session1}
    ${service_session2} =           API Create Service Session          ${service_schedule}[Id]     Complete
    Set suite variable              ${service_session2}
    ${service_participant} =        API Create Service Participant      ${contact}[Id]   ${service_schedule}[Id]  ${service}[Id]
    Set suite variable              ${service_participant}

*** Test Cases ***
View Perms Attendance Snapshot for Pending Status
    [Documentation]                        Logged in as a non admin user with view perm sets, navigates to service session details page, and 
    ...                                    validates that a warning message is displayed on attendance component.
    [tags]                                 unstable         perm:view      feature:Service Session
    Go To Page                             Details                        ServiceSession__c           object_id=${service_session1}[Id]
    Page Should Contain                    Track Attendance  
    Page Should Contain                    You don't have access to this information. Ask your admin for help.

View Perms Attendance Snapshot for Complete Status
    [Documentation]                        Logged in as a non admin user with view perm sets, navigates to service session details page, and 
    ...                                    validates that a warning message is displayed on attendance component.
    [tags]                                 unstable         perm:view      feature:Service Session
    Go To Page                             Details                        ServiceSession__c           object_id=${service_session2}[Id]
    Page Should Contain                    Track Attendance  
    Page Should Not Contain Button         Update