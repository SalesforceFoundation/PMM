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
    ${program_engagement3} =        API Create Program Engagement   ${Program}[Id]     ${contact3}[Id]   ${ns}Role__c=Volunteer
    Set suite variable              ${program_engagement3}
    ${service_schedule_name} =      Generate New String
    Set suite variable              ${service_schedule_name}

    ${program1} =                    API Create Program
    Set suite variable              ${program1}
    ${service1} =                    API Create Service                  ${Program1}[Id]
    Set suite variable              ${service1}
    ${program_cohort1} =            API Create Program Cohort           ${Program1}[Id]
    Set suite variable              ${program_cohort1}
    ${program_cohort2} =            API Create Program Cohort           ${Program1}[Id]
    Set suite variable              ${program_cohort2}
    ${program_cohort3} =            API Create Program Cohort           ${Program1}[Id]
    Set suite variable              ${program_cohort3}
    API Update Records              ${ns}ProgramCohort__c     ${program_cohort1}[Id]     ${ns}Status__c=Planned
    ${program_engagement4} =        API Create Program Engagement   ${Program1}[Id]     ${contact1}[Id]      ${ns}ProgramCohort__c=${program_cohort1}[Id]
    Set suite variable              ${program_engagement4}
    ${program_engagement5} =        API Create Program Engagement   ${Program1}[Id]     ${contact2}[Id]      ${ns}ProgramCohort__c=${program_cohort2}[Id]
    Set suite variable              ${program_engagement5}
    ${program_engagement6} =        API Create Program Engagement   ${Program1}[Id]     ${contact3}[Id]      ${ns}ProgramCohort__c=${program_cohort3}[Id]
    Set suite variable              ${program_engagement6}
    API Update Records              ${ns}ProgramEngagement__c    ${program_engagement4}[Id]     ${ns}Stage__c=Waitlisted



*** Test Cases ***
SSS3.1: Add/remove service participants on Screen3
    [Documentation]                        On service schedule wizard, add/remove service participants on screen 3 and validate that the
    ...                                    added participants are displayed on screen 4 and when the wizard is saved
    [tags]                                  W-8449817   quadrant:Q2   perm:admin    perm:manage   feature:Service Schedule
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
    Click Add All Button
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

SSS3.2: Warning when number of participants exceeds capacity
    [Documentation]                        On service schedule wizard, enter service participant capacity and validate that a warning
    ...                                    is displayed on Screen 3 when number of participants exceeds capacity
    [tags]                                  W-8449817   quadrant:Q2   perm:admin   perm:manage   feature:Service Schedule
    Go To Page                              Details                        Service__c           object_id=${service}[Id]
    Click Wrapper Related List Button       Service Schedules              New
    Current Page Should Be                  New                            ServiceSchedule__c
    Verify Wizard Screen Title              Service Schedule Information
    Populate Field                          Service Schedule Name               ${service_schedule_name}
    Populate Field                          Participant Capacity            1
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Review Service Sessions
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Add Service Participants
    Page Should Contain                     ${service_schedule_name}
    Page Should Contain                     No records selected
    Click Add All Button
    Page Should Contain                     Just a heads up, there are more participants than the Participant Capacity you selected.

SSS3.3: Validate fields added to SessionParticipantView fieldset on Wizard
    [Documentation]               Adds a field to SessionParticipantView fieldset and validates that the field is displayed on the 
    ...                           Wizard Screen 3 and Screen 4.
    [tags]                        W-9476493   quadrant:Q2   perm:admin   feature:Service Schedule
    Run task                            add_fields_to_field_set
    ...                                 field_set=${ns}ProgramEngagement__c.${ns}SessionParticipantView
    ...                                 fields=${{ ["${ns}Role__c"] }}
    Go To Page                              Details                        Service__c           object_id=${service}[Id]
    Click Wrapper Related List Button       Service Schedules              New
    Current Page Should Be                  New                            ServiceSchedule__c
    Verify Wizard Screen Title              Service Schedule Information
    Populate Field                          Service Schedule Name               ${service_schedule_name}
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Review Service Sessions
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Add Service Participants
    Page Should Contain                     Role
    Page Should Contain                     Volunteer
    Select Service Participant              ${contact3}[Name]
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Review Service Schedule
    Page Should Contain                     Role
    Page Should Contain                     Volunteer

Setup custom bucketed values and validate on service schedule wizard
    [Documentation]               Create custom bucketed values for Program Cohort Status and Program Engagement Stages and
    ...                           validate the same on the participant selector component on service schedule
    [tags]                        quadrant:Q3   perm:admin
    Setup Custom Metadata Bucketed Value    Planned    Planned   ProgramCohortStatusActive   Planned
    Setup Custom Metadata Bucketed Value    Waitlisted    Waitlisted    Active    Waitlisted
    Go To Page                              Details    Service__c    object_id=${service1}[Id]
    Click Wrapper Related List Button       Service Schedules              New
    Current Page Should Be                  New                            ServiceSchedule__c
    Verify Wizard Screen Title              Service Schedule Information
    Populate Field                          Service Schedule Name           ${service_schedule_name}
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Review Service Sessions
    Click Dialog Button                     Next
    Verify Wizard Screen Title              Add Service Participants
    Page Should Contain                     Waitlisted
    Verify dropdown Options                 Filter by: Program Cohort    contains    ${program_cohort1}[Name]
    Verify dropdown Options                 Filter by: Program Cohort    does not contain    ${program_cohort2}[Name]
    Verify dropdown Options                 Filter by: Program Cohort    does not contain    ${program_cohort3}[Name]
    Select Service Participant              ${contact1}[Name]
    Validate Participant Is Added           ${contact1}[Name]
    Click Dialog Button                     Next 
    Verify Wizard Screen Title              Review Service Schedule
    Click Dialog Button                     Save
    Wait Until Modal is Closed
    Page Should Contain                     ${contact1}[Name] - ${service_schedule_name}
