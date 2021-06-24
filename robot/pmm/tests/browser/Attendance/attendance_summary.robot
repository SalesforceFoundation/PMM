*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/ServiceSessionPageObject.py
...            robot/pmm/resources/ServicePageObject.py
...            robot/pmm/resources/ProgramEngagementPageObject.py
...             robot/pmm/resources/ContactPageObject.py
Suite Setup     Run Keywords
...             Open test browser            useralias=${test_user}             AND
...             Setup Test Data
Suite Teardown  Capture Screenshot and Delete Records and Close Browser

*** Variables ***
${test_user}             UUser

*** Keywords ***
Setup Test Data
    [Documentation]                 Creates contact, service participants and service sessions using API
    ${ns} =                         Get PMM Namespace Prefix
    Set suite variable              ${ns}

    # Test Data for validating attendance summary on service session and service record
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
    ${service_session1} =           API Create Service Session          ${service_schedule}[Id]     Pending
    Set suite variable              ${service_session1}
    ${service_session2} =           API Create Service Session          ${service_schedule}[Id]     Pending
    Set suite variable              ${service_session2}
    ${service_participant1} =       API Create Service Participant      ${contact1}[Id]   ${service_schedule}[Id]  ${service}[Id]
    Set suite variable              ${service_participant1}
    ${service_participant2} =       API Create Service Participant      ${contact2}[Id]   ${service_schedule}[Id]  ${service}[Id]
    Set suite variable              ${service_participant2}

    # Test Data for validating attendance summary on contact record
    ${contact3}                     API Create Contact
    Set suite variable              ${contact3}
    ${contact4}                      API Create Contact
    Set suite variable              ${contact4}
    ${service_schedule1} =           API Create Service Schedule         ${service}[Id]
    Set suite variable              ${service_schedule1}
    ${service_session3} =           API Create Service Session          ${service_schedule1}[Id]     Pending
    Set suite variable              ${service_session3}
    ${service_participant3} =       API Create Service Participant      ${contact3}[Id]   ${service_schedule1}[Id]  ${service}[Id]
    Set suite variable              ${service_participant3}
    ${service_participant4} =       API Create Service Participant      ${contact4}[Id]   ${service_schedule1}[Id]  ${service}[Id]
    Set suite variable              ${service_participant4}   

    # Test Data for validating attendance summary on PE record
    ${contact5}                     API Create Contact
    Set suite variable              ${contact5}
    ${contact6}                      API Create Contact
    Set suite variable              ${contact6}
    ${program_engagement1} =        API Create Program Engagement       ${Program}[Id]     ${contact5}[Id]
    Set suite variable              ${program_engagement1}
    ${program_engagement2} =        API Create Program Engagement       ${Program}[Id]     ${contact6}[Id]
    Set suite variable              ${program_engagement2}
    ${service_schedule2} =           API Create Service Schedule         ${service}[Id]
    Set suite variable              ${service_schedule2}
    ${service_session4} =           API Create Service Session          ${service_schedule2}[Id]     Pending
    Set suite variable              ${service_session4}
    ${service_participant5} =       API Create Service Participant      ${contact5}[Id]   ${service_schedule2}[Id]  ${service}[Id]    ${ns}ProgramEngagement__c=${program_engagement1}[Id]
    Set suite variable              ${service_participant5}
    ${service_participant6} =       API Create Service Participant      ${contact6}[Id]   ${service_schedule2}[Id]  ${service}[Id]    ${ns}ProgramEngagement__c=${program_engagement2}[Id]
    Set suite variable              ${service_participant6}


*** Test Cases ***
Service attendance summary field
    [Documentation]                 This test updates attendance and validates the attendance summary field on a service record
    [tags]                          W-9323278   perm:admin   perm:manage    feature:Attendance
    Run Task                       deploy_cmdts
    Go To Page                     Details         ServiceSession__c        object_id=${service_session1}[Id]
    Page Should Contain Text       Track Attendance
    Populate Attendance Dropdown        ${contact1}[Name]      Attendance Status    Present
    Populate Attendance Dropdown        ${contact2}[Name]      Attendance Status    Unexcused Absence
    Click Dialog Button            Submit
    Verify toast Message           Saved 2 Service Delivery records.
    Go To Page                     Details              Service__c           object_id=${service}[Id]
    Verify Details                 Attendance Summary     contains           50% (1/2)

Service session attendance summary field
    [Documentation]                 This test updates attendance and validates the attendance summary field on a service session record
    [tags]                          W-9323278  perm:admin   perm:manage    feature:Attendance
    Go To Page                     Details         ServiceSession__c        object_id=${service_session2}[Id]
    Page Should Contain Text       Track Attendance
    Populate Attendance Dropdown        ${contact1}[Name]      Attendance Status    Present
    Populate Attendance Dropdown        ${contact2}[Name]      Attendance Status    Unexcused Absence
    Click Dialog Button            Submit
    Verify toast Message           Saved 2 Service Delivery records.
    Verify Details                 Attendance Summary     contains           50% (1/2)

Contact attendance summary field
    [Documentation]                This test updates attendance and validates the attendance summary field on a contact record
    [tags]                         W-9323278   perm:admin   perm:manage    feature:Attendance
    Go To Page                     Details         ServiceSession__c        object_id=${service_session3}[Id]
    Page Should Contain Text       Track Attendance
    Populate Attendance Dropdown        ${contact3}[Name]      Attendance Status    Present
    Populate Attendance Dropdown        ${contact4}[Name]      Attendance Status    Unexcused Absence
    Click Dialog Button            Submit
    Verify toast Message           Saved 2 Service Delivery records.
    Go To Page                     Details        Contact              object_id=${contact3}[Id]
    Verify Details                 Attendance Summary     contains           100% (1/1)
    Verify Details                 Consecutive Absences   contains           0
    Go To Page                     Details        Contact              object_id=${contact4}[Id]    
    Verify Details                 Attendance Summary     contains           0% (0/1)
    Verify Details                 Consecutive Absences   contains           1

Program Engagement attendance summary field
    [Documentation]                 This test updates attendance and validates the attendance summary field on a program engagement record
    [tags]                          W-9323278   perm:admin   perm:manage    feature:Attendance
    Go To Page                     Details         ServiceSession__c        object_id=${service_session4}[Id]
    Page Should Contain Text       Track Attendance
    Populate Attendance Dropdown        ${contact5}[Name]      Attendance Status    Present
    Populate Attendance Dropdown        ${contact6}[Name]      Attendance Status    Unexcused Absence
    Click Dialog Button            Submit
    Verify toast Message           Saved 2 Service Delivery records.
    Go To Page                     Details        ProgramEngagement__c      object_id=${program_engagement1}[Id]
    Verify Details                 Attendance Summary     contains           100% (1/1)
    Verify Details                 Consecutive Absences   contains           0
    Go To Page                     Details        ProgramEngagement__c      object_id=${program_engagement2}[Id]  
    Verify Details                 Attendance Summary     contains           0% (0/1)
    Verify Details                 Consecutive Absences   contains           1