*** Settings ***

Resource       robot/pmm/resources/pmm.robot
Library        cumulusci.robotframework.PageObjects
...            robot/pmm/resources/ServiceSchedulePageObject.py
...            robot/pmm/resources/ServicePageObject.py
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
    ${contact} =                    API Create Contact
    Set suite variable              ${contact}
    ${contact1} =                   API Create Contact
    Set suite variable              ${contact1}
    ${contact2} =                   API Create Contact
    Set suite variable              ${contact2}
    ${contact3} =                   API Create Contact
    Set suite variable              ${contact3}
    ${program_engagement1} =        API Create Program Engagement   ${Program}[Id]     ${contact1}[Id]
    Set suite variable              ${program_engagement1}
    ${program_engagement2} =        API Create Program Engagement   ${Program}[Id]     ${contact2}[Id]
    Set suite variable              ${program_engagement2}
    ${program_engagement3} =        API Create Program Engagement   ${Program}[Id]     ${contact3}[Id]
    Set suite variable              ${program_engagement3}
    ${service_schedule_name} =      Generate New String
    Set suite variable              ${service_schedule_name}


*** Test Cases ***
Add/remove service participants on Screen3
    [Documentation]                        On service schedule wizard, add/remove service participants on screen 3 and validate that the
    ...                                    added participants are displayed on screen 4 and when the wizard is saved
    [tags]                                 unstable    W-8449817    perm:admin    perm:manage     feature:Service Schedule
    Go To Page                              Details                        Service__c           object_id=${service}[Id]
    Click Wrapper Related List Button       Service Schedules              New
    Current Page Should Be                  New                            ServiceSchedule__c
    Verify Wizard Screen Title              Service Schedule Information
    Populate Field                          Service Schedule Name               ${service_schedule_name}
    Populate Lightning Fields               Date=Today
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Review Service Sessions
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Add Service Participants
    Page Should Contain                     ${service_schedule_name}
    Page Should Contain                     No records selected
    Select Service Participant              ${contact1}[Name]
    Select Service Participant              ${contact2}[Name]
    Select Service Participant              ${contact3}[Name]
    Click Dialog Button                     Add Service Participants
    Validate Participant Is Added           ${contact1}[Name]
    Validate Participant Is Added           ${contact2}[Name]
    Validate Participant Is Added           ${contact3}[Name]
    Remove Participant                      ${contact3}[Name]
    Click Dialog Button                     Next 
    Verify Wizard Screen Title              Review Service Schedule
    Verify Accordion                        Service Participants         contains               ${contact1}[Name]
    Verify Accordion                        Service Participants         contains               ${contact2}[Name]
    Page Should Not Contain                 ${contact3}[Name]
    Click Dialog Button                     Save
    Wait Until Modal is Closed
    Page Should Contain                     ${contact1}[Name] - ${service_schedule_name}
    Page Should Contain                     ${contact2}[Name] - ${service_schedule_name}
    Page Should Not Contain                 ${contact3}[Name] - ${service_schedule_name}
