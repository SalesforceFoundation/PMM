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
    ${program_cohort1} =            API Create Program Cohort           ${Program}[Id]
    Set suite variable              ${program_cohort1}
    ${program_cohort2} =            API Create Program Cohort           ${Program}[Id]
    Set suite variable              ${program_cohort2}   
    ${contact} =                    API Create Contact
    Set suite variable              ${contact}
    ${contact1} =                   API Create Contact
    Set suite variable              ${contact1}
    ${contact2} =                   API Create Contact
    Set suite variable              ${contact2}
    ${contact3} =                   API Create Contact
    Set suite variable              ${contact3}
    ${program_engagement1} =        API Create Program Engagement   ${Program}[Id]     ${contact1}[Id]      ${ns}ProgramCohort__c=${program_cohort1}[Id]
    Set suite variable              ${program_engagement1}
    ${program_engagement2} =        API Create Program Engagement   ${Program}[Id]     ${contact2}[Id]      ${ns}ProgramCohort__c=${program_cohort1}[Id]
    Set suite variable              ${program_engagement2}
    ${program_engagement3} =        API Create Program Engagement   ${Program}[Id]     ${contact3}[Id]      ${ns}ProgramCohort__c=${program_cohort2}[Id]
    Set suite variable              ${program_engagement3}
    ${service_schedule_name} =      Generate New String
    Set suite variable              ${service_schedule_name}


*** Test Cases ***
SSF1: Filter based on Program Cohort
    [Documentation]                        On service schedule wizard,filter based on program cohort and 
    ...                                    validate filtered results are displayed on screen 3
    [tags]                                 W-9176285   quadrant:Q2   perm:admin    perm:manage     feature:Service Schedule
    Go To Page                              Details                        Service__c           object_id=${service}[Id]
    Click Wrapper Related List Button       Service Schedules              New
    Current Page Should Be                  New                            ServiceSchedule__c
    Verify Wizard Screen Title              Service Schedule Information
    Populate Field                          Service Schedule Name               ${service_schedule_name}
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Review Service Sessions
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Add Service Participants
    Page Should Contain                     ${service_schedule_name}
    Page Should Contain                     No records selected
    Select Value From Dropdown              Filter by: Program Cohort        ${program_cohort2}[Name]
    Page Should Not Contain                 ${contact1}[Name]
    Page Should Not Contain                 ${contact2}[Name]
    Page Should Contain Text                ${contact3}[Name]

SSF2: Filter based on Client Name
    [Documentation]                        On service schedule wizard,filter based on client name and 
    ...                                    validate filtered results are displayed on screen 3
    [tags]                                 W-9176285   quadrant:Q2   perm:admin    perm:manage     feature:Service Schedule
    Go To Page                              Details                        Service__c           object_id=${service}[Id]
    Click Wrapper Related List Button       Service Schedules              New
    Current Page Should Be                  New                            ServiceSchedule__c
    Verify Wizard Screen Title              Service Schedule Information
    Populate Field                          Service Schedule Name               ${service_schedule_name}
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Review Service Sessions
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Add Service Participants
    Page Should Contain                     ${service_schedule_name}
    Page Should Contain                     No records selected
    Filter Participants                     ${contact1}[Name]
    Page Should Contain Text                ${contact1}[Name]
    Page Should Not Contain                 ${contact2}[Name]
    Page Should Not Contain                 ${contact3}[Name]

SSF3: Filter based on Stage
    [Documentation]                        On service schedule wizard,filter based on Stage and 
    ...                                    validate no results are displayed on screen 3
    [tags]                                 W-9176285   quadrant:Q2   perm:admin    perm:manage     feature:Service Schedule
    Go To Page                              Details                        Service__c           object_id=${service}[Id]
    Click Wrapper Related List Button       Service Schedules              New
    Current Page Should Be                  New                            ServiceSchedule__c
    Verify Wizard Screen Title              Service Schedule Information
    Populate Field                          Service Schedule Name               ${service_schedule_name}
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Review Service Sessions
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Add Service Participants
    Page Should Contain                     ${service_schedule_name}
    Page Should Contain                     No records selected
    Filter Participants                     Applied
    Page Should Contain                     No records found.
