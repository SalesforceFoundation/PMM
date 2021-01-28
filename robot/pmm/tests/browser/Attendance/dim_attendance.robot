*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/ServiceSessionPageObject.py
...            robot/pmm/resources/BulkServiceDeliveryPageObject.py
Suite Setup     Run Keywords
...             Open Test Browser
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser


*** Keywords ***
Setup Test Data
    [Documentation]                 Creates contact, service participant and 3 service sessions using API
    ${ns} =                         Get PMM Namespace Prefix
    Set suite variable              ${ns}
    ${contact1}                     API Create Contact
    Set suite variable              ${contact1}
    ${contact2}                     API Create Contact      FirstName=ztest robot contact
    Set suite variable              ${contact2}
    ${program} =                    API Create Program
    Set suite variable              ${program}
    ${service} =                    API Create Service                  ${Program}[Id]
    Set suite variable              ${service}
    ${service_schedule} =           API Create Service Schedule         ${service}[Id]
    Set suite variable              ${service_schedule}
    ${service_session1} =           API Create Service Session          ${service_schedule}[Id]     Pending
    Set suite variable              ${service_session1}
    ${service_session2} =           API Create Service Session          ${service_schedule}[Id]     Pending
    Set suite variable              ${service_session2}
    ${service_session3} =           API Create Service Session          ${service_schedule}[Id]     Pending
    Set suite variable              ${service_session3}
    ${service_participant1} =       API Create Service Participant      ${contact1}[Id]   ${service_schedule}[Id]  ${service}[Id]
    Set suite variable              ${service_participant1}

*** Test Cases ***
Dim attendance rows and validate service deliveries are not created
    [Documentation]                 This test Dims an attendance row and validates that the toast message is displayed
    [tags]                          W-8613706 feature:Attendance
    Go To PMM App
    Go To Page                      Details         ${ns}ServiceSession__c        object_id=${service_session1}[Id]
    Page Should Contain Text        ${contact1}[Name]
    Dim attendance Row              1         Select
    Click Button                    Submit
    Verify Toast Message            There are no Service Delivery records to update.

Dim attendance row and validate that the Quantity and Attendance Status is reset
    [Documentation]                 This test updates the attendance row, clicks on the Dim icon and validates that
    ...                             the data is reset when clicked on Submit
    [tags]                          W-8613706 feature:Attendance
    Go To PMM App
    Go To Page                          Details         ${ns}ServiceSession__c        object_id=${service_session2}[Id]
    Page Should Contain Text            ${contact1}[Name]
    Populate Attendance Field           1      Hours                10
    Populate Attendance Dropdown        1      Attendance Status    Present
    Dim Attendance Row                  1      Select
    Click Button                        Submit
    Validate Attendance Info In Row     1     Hours                 does not contain    10
    Validate Attendance Info In Row     1     Attendance Status     does not contain    Present

Validate Dim attendance icon is displayed only for newly added rows
    [Documentation]                 This test updates the attendance row and Submits. Creates a new Service participant and validates
    ...                             that the dim icon is displayed only for the newly added row.
    [tags]                          W-8613706 feature:Attendance
    Go To PMM App
    Go To Page                      Details         ${ns}ServiceSession__c        object_id=${service_session3}[Id]
    Page Should Contain Text        ${contact1}[Name]
    Populate Attendance Field           1      Hours                10
    Populate Attendance Dropdown        1      Attendance Status    Present
    Click Button                        Submit
    API Create Service Participant  ${contact2}[Id]   ${service_schedule}[Id]  ${service}[Id]
    Reload Page
    Click Button                    Update
    Dim Attendance Row              1       Is not displayed
    Dim Attendance Row              2       Is displayed
