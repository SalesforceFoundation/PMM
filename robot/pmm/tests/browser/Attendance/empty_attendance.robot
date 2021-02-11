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
    [Documentation]                 Creates service session using API
    ${ns} =                         Get PMM Namespace Prefix
    Set suite variable              ${ns}
    ${program} =                    API Create Program
    Set suite variable              ${program}
    ${service} =                    API Create Service                  ${Program}[Id]
    Set suite variable              ${service}
    ${service_schedule} =           API Create Service Schedule         ${service}[Id]
    Set suite variable              ${service_schedule}
    ${service_session1} =           API Create Service Session          ${service_schedule}[Id]     Pending
    Set suite variable              ${service_session1}


*** Test Cases ***
Validate Empty Attendance State
    [Documentation]                 This test confirms that the service session empty state message shows in track attendance
    [tags]                          W-8607484   perm:admin   perm:manage    perm:deliver      feature:Attendance
    Go To PMM App
    Go To Page                      Details         ServiceSession__c        object_id=${service_session1}[Id]
    Page Should Contain             No participants yet
    