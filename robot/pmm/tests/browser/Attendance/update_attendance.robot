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
    ${service_session1} =           API Create Service Session          ${service_schedule}[Id]     Pending
    Set suite variable              ${service_session1}
    ${service_session2} =           API Create Service Session          ${service_schedule}[Id]     Complete
    Set suite variable              ${service_session2}
    ${service_participant1} =       API Create Service Participant      ${contact1}[Id]   ${service_schedule}[Id]  ${service}[Id]
    Set suite variable              ${service_participant1}
    ${service_participant2} =       API Create Service Participant      ${contact2}[Id]   ${service_schedule}[Id]  ${service}[Id]
    Set suite variable              ${service_participant2}
    ${service_participant3} =       API Create Service Participant      ${contact3}[Id]   ${service_schedule}[Id]  ${service}[Id]
    Set suite variable              ${service_participant3}

*** Test Cases ***
Update attendance when service session status is Pending
    [Documentation]                 This test updates attendance for a service session record with Pending Status
    [tags]                          W-8607484   perm:admin   perm:manage    feature:Attendance
    Go To PMM App
    Go To Page                      Details         ${ns}ServiceSession__c        object_id=${service_session1}[Id]
    Page Should Contain Text        ${contact1}[Name]
    Page Should Contain Text        ${contact2}[Name]
    Page Should Contain Text        ${contact3}[Name]          
    Populate Attendance Field           1      Hours                10
    Populate Attendance Dropdown        1      Attendance Status    Present
    Populate Attendance Field           2      Hours                10
    Populate Attendance Dropdown        2      Attendance Status    Unexcused Absence
    Populate Attendance Field           3      Hours                10
    Populate Attendance Dropdown        3      Attendance Status    Excused Absence
    Click Button                    Submit
    Verify Toast Message            Saved 3 Service Delivery records.
    Reload Page
    Page Should Contain             Present
    Verify Details                  Status          contains        Complete
    
Update attendance when service session status is Complete
    [Documentation]                 This test updates attendance for a service session record with Complete Status
    [tags]                          W-8611541    perm:admin   perm:manage     feature:Attendance
    Go To PMM App
    Go To Page                      Details         ${ns}ServiceSession__c        object_id=${service_session2}[Id]
    Page Should Contain Text        ${contact1}[Name]
    Page Should Contain Text        ${contact2}[Name]
    Page Should Contain Text        ${contact3}[Name]
    Click Button                    Update
    Page Should Contain             Track Attendance         
    Populate Attendance Field           1      Hours                10
    Populate Attendance Dropdown        1      Attendance Status    Present
    Populate Attendance Dropdown        2      Attendance Status    Unexcused Absence
    Populate Attendance Dropdown        3      Attendance Status    Excused Absence
    Click Button                    Save
    Verify Toast Message            Saved 3 Service Delivery records.
    Page Should Contain             Present
    Page Should Contain             Created Date
