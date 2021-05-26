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
    [Documentation]                 Creates contact, service participant and 3 service sessions using API
    ${ns} =                         Get PMM Namespace Prefix
    Set suite variable              ${ns}
    ${contact1}                     API Create Contact
    Set suite variable              ${contact1}
    ${contact2}                     API Create Contact
    Set suite variable              ${contact2}
    ${program} =                    API Create Program
    Set suite variable              ${program}
    ${service} =                    API Create Service                  ${Program}[Id]
    Set suite variable              ${service}
    ${service_schedule} =           API Create Service Schedule         ${service}[Id]
    Set suite variable              ${service_schedule}
    ${service_schedule1} =          API Create Service Schedule         ${service}[Id]
    Set suite variable              ${service_schedule1}
    ${service_session1} =           API Create Service Session          ${service_schedule}[Id]     Pending
    Set suite variable              ${service_session1}
    ${service_session2} =           API Create Service Session          ${service_schedule1}[Id]     Pending
    Set suite variable              ${service_session2}
    ${service_session3} =           API Create Service Session          ${service_schedule}[Id]    Pending
    Set suite variable              ${service_session3}
    ${service_participant1} =       API Create Service Participant      ${contact1}[Id]   ${service_schedule}[Id]  ${service}[Id]
    Set suite variable              ${service_participant1}
    ${service_participant2} =       API Create Service Participant      ${contact1}[Id]   ${service_schedule1}[Id]  ${service}[Id]
    Set suite variable              ${service_participant2}

*** Test Cases ***
Dim attendance rows and validate service deliveries are not created
    [Documentation]                 This test Dims an attendance row and validates that the toast message is displayed
    [tags]                          W-8613706    perm:admin   perm:manage    perm:deliver   feature:Attendance
    Go To Page                      Details         ServiceSession__c        object_id=${service_session1}[Id]
    Page Should Contain Text        Track Attendance
    Dim attendance Row              ${contact1}[Name]         Select
    Click Dialog Button             Submit
    Verify Toast Message            There are no Service Delivery records to update.
    Page Should Contain Text        ${contact1}[Name]

Validate Dim attendance icon is displayed only for newly added rows
    [Documentation]                 This test updates the attendance row and Submits. Creates a new Service participant and validates
    ...                             that the dim icon is displayed only for the newly added row.
    [tags]                          W-8613706    perm:admin   perm:manage   perm:deliver   feature:Attendance
    Go To Page                      Details         ServiceSession__c        object_id=${service_session3}[Id]
    Page Should Contain Text            Track Attendance
    Populate Attendance Field           ${contact1}[Name]       Hours                10
    Populate Attendance Dropdown        ${contact1}[Name]      Attendance Status    Present
    Click Dialog Button             Submit
    Verify Toast Message            Saved 1 Service Delivery records.
    API Create Service Participant  ${contact2}[Id]   ${service_schedule}[Id]  ${service}[Id]
    Reload Page
    Page Should Contain             Service Session Name
    Click Dialog Button             Update
    Dim Attendance Row              ${contact1}[Name]       Is not displayed
    Dim Attendance Row              ${contact2}[Name]       Is displayed
    Page Should Contain             ${contact1}[Name]
    Page Should Contain             ${contact2}[Name]

Dim attendance row and validate that the Quantity and Attendance Status is reset
    [Documentation]                 This test updates the attendance row, clicks on the Dim icon and validates that
    ...                             the data is reset when clicked on Submit
    [tags]                          W-8613706    perm:admin   perm:manage     perm:deliver   feature:Attendance
    Go To Page                          Details         ServiceSession__c        object_id=${service_session2}[Id]
    Page Should Contain Text            Track Attendance
    Populate Attendance Field           ${contact1}[Name]      Hours                10
    Populate Attendance Dropdown        ${contact1}[Name]      Attendance Status    Present
    Dim Attendance Row                  ${contact1}[Name]      Select
    Click Dialog Button                 Submit
    Validate Attendance Info In Row     ${contact1}[Name]     Hours                 does not contain    10
    Validate Attendance Info In Row     ${contact1}[Name]     Attendance Status     does not contain    Present
