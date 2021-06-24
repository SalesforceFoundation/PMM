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
    ${today} =                      Get Current Date                result_format=%-m/%-d/%Y 
    Set suite variable              ${today}


*** Test Cases ***
Create a New Service Schedule
    [Documentation]                        Navigates to service schedule listing page, clicks 'New' on the listing page and
    ...                                    creates a new record using the wizard, validates the details on the service schedule record
    [tags]                                 W-8294332     perm:admin   perm:manage       feature:Service Schedule
    Go To Page                              Details                        Service__c           object_id=${service}[Id]
    Click Wrapper Related List Button       Service Schedules              New
    Current Page Should Be                  New                            ServiceSchedule__c
    Verify Wizard Screen Title              Service Schedule Information
    Populate Field                          Service Schedule Name               ${service_schedule_name}
    Populate Field                          Participant Capacity                10
    Populate Lookup Field                   Primary Service Provider            ${contact}[Name]
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Review Service Sessions
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Add Service Participants
    Click Add All Button
    Click Dialog Button                     Next 
    Verify Wizard Screen Title              Review Service Schedule
    Verify Wizard Review Screen             Service Schedule Name        contains       ${service_schedule_name}      
    Verify Wizard Review Screen             Participant Capacity         contains       10
    Verify Wizard Review Screen             Primary Service Provider     contains       ${contact}[Name]
    Verify Accordion                        Service Sessions             contains       ${today}: ${service_schedule_name}
    Verify Accordion                        Service Participants         contains       ${contact1}[Name]
    Verify Accordion                        Service Participants         contains       ${contact2}[Name]
    Verify Accordion                        Service Participants         contains       ${contact3}[Name]
    Click Dialog Button                     Save
    Wait Until Modal is Closed
    Verify Details                          Service Schedule Name        contains      ${service_schedule_name}
    Verify Details                          Service                      contains      ${service}[Name]
    Verify Details                          Frequency                    contains       One Time
    Verify Page Contains Related List       Service Sessions
    Verify Page Contains Related List       Service Participants
    Verify Page Contains Related List       Files
    Page Should Contain                     ${today}: ${service_schedule_name}
    Page Should Contain                     ${contact1}[Name] - ${service_schedule_name}
    Page Should Contain                     ${contact2}[Name] - ${service_schedule_name}
    Page Should Contain                     ${contact3}[Name] - ${service_schedule_name}
