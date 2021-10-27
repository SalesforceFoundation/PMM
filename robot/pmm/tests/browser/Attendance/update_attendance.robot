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
    ${service_provider}             API Create Contact
    Set suite variable              ${service_provider}
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
    ${service_session3} =           API Create Service Session          ${service_schedule}[Id]     Pending
    Set suite variable              ${service_session3}
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
    Go To Page                      Details         ServiceSession__c        object_id=${service_session1}[Id]         
    Populate Attendance Field           ${contact1}[Name]      Hours                10
    Populate Attendance Dropdown        ${contact1}[Name]      Attendance Status    Present
    Populate Attendance Field           ${contact2}[Name]       Hours                10
    Populate Attendance Dropdown        ${contact2}[Name]      Attendance Status    Unexcused Absence
    Populate Attendance Field           ${contact3}[Name]      Hours                10
    Populate Attendance Dropdown        ${contact3}[Name]      Attendance Status    Excused Absence
    Click Dialog Button             Submit
    Verify Toast Message            Saved 3 Service Delivery records.
    Reload Page
    Page Should Contain             Present
    Verify Details                  Status          contains        Complete
    Page Should Contain Text        ${contact1}[Name]
    Page Should Contain Text        ${contact2}[Name]
    Page Should Contain Text        ${contact3}[Name] 
    
Update attendance when service session status is Complete
    [Documentation]                 This test updates attendance for a service session record with Complete Status
    [tags]                          W-8611541    perm:admin   perm:manage     feature:Attendance
    Go To Page                      Details         ServiceSession__c        object_id=${service_session2}[Id]
    Click Dialog Button             Update
    Page Should Contain             Track Attendance         
    Populate Attendance Field           ${contact1}[Name]       Hours                10
    Populate Attendance Dropdown        ${contact1}[Name]      Attendance Status    Present
    Populate Attendance Dropdown        ${contact2}[Name]      Attendance Status    Unexcused Absence
    Populate Attendance Dropdown        ${contact3}[Name]      Attendance Status    Excused Absence
    Click Dialog Button             Save
    Verify Toast Message            Saved 3 Service Delivery records.
    Page Should Contain             Present
    Page Should Contain             Created Date
    Page Should Contain Text        ${contact1}[Name]
    Page Should Contain Text        ${contact2}[Name]
    Page Should Contain Text        ${contact3}[Name]

Validate fields added to AttendanceServiceDeliveries Fieldset
    [Documentation]                 This test updates attendance for a service session record with Complete Status
    [tags]                          W-9505038    perm:admin   feature:Attendance
    Run task                            add_fields_to_field_set
    ...                                 field_set=${ns}ServiceDelivery__c.${ns}Attendance_Service_Deliveries
    ...                                 fields=${{ ["${ns}Service_Provider__c"] }}
    Go To Page                          Details         ServiceSession__c        object_id=${service_session3}[Id]
    Page Should Contain                 Track Attendance         
    Populate Attendance Field           ${contact1}[Name]       Hours                10
    Populate Attendance Dropdown        ${contact1}[Name]       Attendance Status    Present
    Populate Attendance Lookup Field    ${contact1}[Name]       Service Provider     ${service_provider}[Name]
    Click Dialog Button                 Submit
    Verify Toast Message                Saved 3 Service Delivery records.
    Page Should Contain Text            ${service_provider}[Name]